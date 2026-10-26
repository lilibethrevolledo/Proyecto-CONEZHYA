package servlets;

import conexion.ConexionBD;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "NuevaSolicitudServlet", urlPatterns = {"/NuevaSolicitudServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5L * 1024 * 1024,       // 5 MB para el archivo
        maxRequestSize = 6L * 1024 * 1024)    // archivo + texto del formulario
public class NuevaSolicitudServlet extends HttpServlet {

    // Carpeta FUERA del proyecto, para que Clean and Build no borre los archivos.
    private static final Path CARPETA = Paths.get("C:/conezhya_archivos");

    // Sin O, I, 0 ni 1 para evitar confusiones al dictar el radicado
    private static final String ALFABETO = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
    private static final SecureRandom AZAR = new SecureRandom();

    private static String nuevoRadicado() {
        StringBuilder sb = new StringBuilder("CNZ-");
        for (int i = 0; i < 8; i++) {
            sb.append(ALFABETO.charAt(AZAR.nextInt(ALFABETO.length())));
        }
        return sb.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1) Solo usuarios con sesión
        HttpSession sesion = request.getSession(false);
        Object idObj = (sesion == null) ? null : sesion.getAttribute("idUsuario");
        if (!(idObj instanceof Integer)) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        int idUsuario = (Integer) idObj;

        // 2) Leer el formulario y el archivo (si hay)
        Part archivo = null;
        String asunto;
        String tipo;
        String mensaje;
        try {
            Part p = request.getPart("archivo");
            if (p != null && p.getSize() > 0
                    && p.getSubmittedFileName() != null
                    && !p.getSubmittedFileName().isBlank()) {
                archivo = p;
            }
            asunto  = limpio(request.getParameter("asunto"));
            tipo    = limpio(request.getParameter("tipo"));
            mensaje = limpio(request.getParameter("mensaje"));
        } catch (IllegalStateException e) {
            volverConError(request, response, "El archivo supera el tamaño permitido (máximo 5 MB).");
            return;
        }

        // 3) Validar texto
        if (asunto.isEmpty() || asunto.length() > 150
                || mensaje.isEmpty() || mensaje.length() > 2000
                || !tipo.matches("queja|reclamo|peticion|sugerencia")) {
            volverConError(request, response,
                    "Revisa los campos: asunto, tipo y mensaje son obligatorios.");
            return;
        }

        // 4) Validar archivo
        String original = null;
        String guardado = null;
        long tamano = 0;
        if (archivo != null) {
            original = nombreOriginal(archivo);
            String ext = extension(original);
            if (!ext.matches("\\.(pdf|jpg|jpeg|png|doc|docx)")) {
                volverConError(request, response,
                        "Solo se permiten archivos PDF, JPG, PNG, DOC o DOCX.");
                return;
            }
            guardado = UUID.randomUUID() + ext;   // nombre aleatorio y seguro
            tamano = archivo.getSize();
        }

        // 5) Copiar el archivo al disco
        Path destino = null;
        try {
            if (archivo != null) {
                Files.createDirectories(CARPETA);
                destino = CARPETA.resolve(guardado);
                try (InputStream in = archivo.getInputStream()) {
                    Files.copy(in, destino, StandardCopyOption.REPLACE_EXISTING);
                }
            }
        } catch (IOException e) {
            log("Error guardando el archivo adjunto", e);
            volverConError(request, response, "No se pudo guardar el archivo. Inténtalo de nuevo.");
            return;
        }

        // 6) Guardar la solicitud (si el radicado saliera repetido, error 1062, se prueba otro)
        String sql = "INSERT INTO adso_sena.solicitudes "
                   + "(radicado, idUsuario, tipo, asunto, mensaje, "
                   + "archivo_original, archivo_guardado, archivo_tamano) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        String radicadoOk = null;

        try (Connection cn = ConexionBD.conectar()) {
            for (int intento = 0; intento < 5 && radicadoOk == null; intento++) {
                String candidato = nuevoRadicado();

                try (PreparedStatement ps = cn.prepareStatement(sql)) {
                    ps.setString(1, candidato);
                    ps.setInt(2, idUsuario);
                    ps.setString(3, tipo);
                    ps.setString(4, asunto);
                    ps.setString(5, mensaje);
                    if (archivo != null) {
                        ps.setString(6, original);
                        ps.setString(7, guardado);
                        ps.setLong(8, tamano);
                    } else {
                        ps.setNull(6, Types.VARCHAR);
                        ps.setNull(7, Types.VARCHAR);
                        ps.setNull(8, Types.BIGINT);
                    }
                    ps.executeUpdate();
                    radicadoOk = candidato;

                } catch (SQLException e) {
                    if (e.getErrorCode() != 1062) { throw e; }
                }
            }
        } catch (SQLException e) {
            log("Error guardando solicitud", e);
        }

        if (radicadoOk == null) {
            borrarArchivo(destino);   // si no se guardó la solicitud, no se deja el archivo suelto
            volverConError(request, response, "Error al guardar la solicitud. Inténtalo de nuevo.");
            return;
        }

        response.sendRedirect(request.getContextPath()
                + "/usuario/Mis%20solicitudes.jsp?radicado=" + radicadoOk);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/usuario/Nueva%20solicitud.jsp");
    }

    // ---------------------------------------------------------------
    // Utilidades
    // ---------------------------------------------------------------
    private void volverConError(HttpServletRequest request, HttpServletResponse response, String error)
            throws ServletException, IOException {
        request.setAttribute("error", error);
        request.getRequestDispatcher("/usuario/Nueva solicitud.jsp").forward(request, response);
    }

    private String limpio(String s) {
        return (s == null) ? "" : s.trim();
    }

    /** Nombre del archivo tal como lo subió la persona, sin rutas. */
    private String nombreOriginal(Part p) {
        String n = p.getSubmittedFileName();
        if (n == null) { return ""; }
        n = n.substring(Math.max(n.lastIndexOf('/'), n.lastIndexOf('\\')) + 1).trim();
        if (n.length() > 200) { n = n.substring(n.length() - 200); }
        return n;
    }

    private String extension(String nombre) {
        int i = nombre.lastIndexOf('.');
        return (i < 0) ? "" : nombre.substring(i).toLowerCase();
    }

    private void borrarArchivo(Path ruta) {
        if (ruta == null) { return; }
        try {
            Files.deleteIfExists(ruta);
        } catch (IOException ignorado) {
            // no hay nada más que hacer
        }
    }
}