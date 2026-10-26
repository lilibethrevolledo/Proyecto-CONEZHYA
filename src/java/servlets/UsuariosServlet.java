package servlets;

import conexion.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Gestión de usuarios para el administrador.
 *
 * GET  ?accion=listar        -> lista de usuarios en JSON (sin contraseñas)
 * GET  ?accion=yo            -> datos de la persona que inició sesión
 * POST accion=crear          -> crea un usuario
 * POST accion=editar         -> edita los datos de un usuario
 * POST accion=cambiarRol     -> cambia el rol
 * POST accion=eliminar       -> elimina un usuario
 *
 * Todas las acciones exigen que la sesión tenga rol "administrador".
 */
@WebServlet(name = "UsuariosServlet", urlPatterns = {"/UsuariosServlet"})
public class UsuariosServlet extends HttpServlet {

    private static final String TABLA = "adso_sena.usuarios";

    // ---------------------------------------------------------------
    // GET
    // ---------------------------------------------------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!esAdmin(request)) {
            responder(response, 403, mensaje("Acceso denegado."));
            return;
        }

        String accion = request.getParameter("accion");
        if (accion == null) { accion = ""; }

        switch (accion) {
            case "listar":
                listar(response);
                break;
            case "yo":
                yo(request, response);
                break;
            default:
                responder(response, 400, mensaje("Acción no válida."));
        }
    }

    // ---------------------------------------------------------------
    // POST
    // ---------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        if (!esAdmin(request)) {
            responder(response, 403, mensaje("Acceso denegado."));
            return;
        }

        String accion = request.getParameter("accion");
        if (accion == null) { accion = ""; }

        switch (accion) {
            case "crear":
                crear(request, response);
                break;
            case "editar":
                editar(request, response);
                break;
            case "cambiarRol":
                cambiarRol(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            default:
                responder(response, 400, mensaje("Acción no válida."));
        }
    }

    // ---------------------------------------------------------------
    // Acciones
    // ---------------------------------------------------------------
    private void listar(HttpServletResponse response) throws IOException {
        String sql = "SELECT idUsuarios, nombres, apellidos, tipo_documento, "
                   + "numero_documento, correo, celular, rol "
                   + "FROM " + TABLA + " ORDER BY idUsuarios";

        StringBuilder sb = new StringBuilder("[");

        try (Connection cn = ConexionBD.conectar();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            boolean primero = true;
            while (rs.next()) {
                if (!primero) { sb.append(","); }
                primero = false;

                String rol = rs.getString("rol");
                if (rol == null || rol.isBlank()) { rol = "usuario"; }

                sb.append("{\"id\":").append(rs.getInt("idUsuarios"))
                  .append(",\"nombres\":\"").append(j(rs.getString("nombres"))).append("\"")
                  .append(",\"apellidos\":\"").append(j(rs.getString("apellidos"))).append("\"")
                  .append(",\"tipoDoc\":\"").append(j(rs.getString("tipo_documento"))).append("\"")
                  .append(",\"numDoc\":\"").append(j(rs.getString("numero_documento"))).append("\"")
                  .append(",\"correo\":\"").append(j(rs.getString("correo"))).append("\"")
                  .append(",\"celular\":\"").append(j(rs.getString("celular"))).append("\"")
                  .append(",\"rol\":\"").append(j(rol)).append("\"}");
            }
            sb.append("]");
            responder(response, 200, sb.toString());

        } catch (SQLException e) {
            log("Error listando usuarios", e);
            responder(response, 500, mensaje("Error al consultar la base de datos."));
        }
    }

    private void yo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession sesion = request.getSession(false);
        String json = "{\"id\":" + idSesion(request)
                + ",\"nombre\":\"" + j((String) sesion.getAttribute("nombre")) + "\""
                + ",\"apellido\":\"" + j((String) sesion.getAttribute("apellido")) + "\""
                + ",\"rol\":\"" + j((String) sesion.getAttribute("rol")) + "\"}";
        responder(response, 200, json);
    }

    private void crear(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Datos d = leerDatos(request);
        String clave = request.getParameter("clave");

        String error = validar(d);
        if (error == null && (clave == null || clave.length() < 6)) {
            error = "La contraseña debe tener al menos 6 caracteres.";
        }
        if (error != null) {
            responder(response, 400, mensaje(error));
            return;
        }

        String sql = "INSERT INTO " + TABLA
                   + " (correo, `contraseña`, nombres, apellidos, tipo_documento, "
                   + "numero_documento, celular, rol) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection cn = ConexionBD.conectar()) {

            if (correoExiste(cn, d.correo, 0)) {
                responder(response, 409, mensaje("Ya existe un usuario con ese correo."));
                return;
            }

            try (PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, d.correo);
                ps.setString(2, clave);   // OJO: se guarda igual que en tu login (texto plano). Ver nota de BCrypt.
                ps.setString(3, d.nombres);
                ps.setString(4, d.apellidos);
                ps.setString(5, d.tipoDoc);
                ps.setString(6, d.numDoc);
                ps.setString(7, d.celular);
                ps.setString(8, d.rol);
                ps.executeUpdate();
            }
            responder(response, 200, ok());

        } catch (SQLException e) {
            log("Error creando usuario", e);
            responder(response, 500, mensaje("No se pudo crear el usuario."));
        }
    }

    private void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = entero(request.getParameter("id"));
        Datos d = leerDatos(request);

        String error = (id <= 0) ? "Usuario no válido." : validar(d);
        if (error == null && id == idSesion(request) && !"administrador".equals(d.rol)) {
            error = "No puedes quitarte tu propio rol de administrador.";
        }
        if (error != null) {
            responder(response, 400, mensaje(error));
            return;
        }

        String sql = "UPDATE " + TABLA + " SET correo = ?, nombres = ?, apellidos = ?, "
                   + "tipo_documento = ?, numero_documento = ?, celular = ?, rol = ? "
                   + "WHERE idUsuarios = ?";

        try (Connection cn = ConexionBD.conectar()) {

            if (correoExiste(cn, d.correo, id)) {
                responder(response, 409, mensaje("Ya existe un usuario con ese correo."));
                return;
            }

            try (PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, d.correo);
                ps.setString(2, d.nombres);
                ps.setString(3, d.apellidos);
                ps.setString(4, d.tipoDoc);
                ps.setString(5, d.numDoc);
                ps.setString(6, d.celular);
                ps.setString(7, d.rol);
                ps.setInt(8, id);
                if (ps.executeUpdate() == 0) {
                    responder(response, 404, mensaje("El usuario no existe."));
                    return;
                }
            }
            responder(response, 200, ok());

        } catch (SQLException e) {
            log("Error editando usuario", e);
            responder(response, 500, mensaje("No se pudo guardar el usuario."));
        }
    }

    private void cambiarRol(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = entero(request.getParameter("id"));
        String rol = request.getParameter("rol");

        if (id <= 0 || !rolValido(rol)) {
            responder(response, 400, mensaje("Datos no válidos."));
            return;
        }
        if (id == idSesion(request)) {
            responder(response, 400, mensaje("No puedes cambiar tu propio rol."));
            return;
        }

        String sql = "UPDATE " + TABLA + " SET rol = ? WHERE idUsuarios = ?";

        try (Connection cn = ConexionBD.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, rol);
            ps.setInt(2, id);
            if (ps.executeUpdate() == 0) {
                responder(response, 404, mensaje("El usuario no existe."));
                return;
            }
            responder(response, 200, ok());

        } catch (SQLException e) {
            log("Error cambiando rol", e);
            responder(response, 500, mensaje("No se pudo cambiar el rol."));
        }
    }

    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = entero(request.getParameter("id"));

        if (id <= 0) {
            responder(response, 400, mensaje("Usuario no válido."));
            return;
        }
        if (id == idSesion(request)) {
            responder(response, 400, mensaje("No puedes eliminar tu propia cuenta."));
            return;
        }

        String sql = "DELETE FROM " + TABLA + " WHERE idUsuarios = ?";

        try (Connection cn = ConexionBD.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, id);
            if (ps.executeUpdate() == 0) {
                responder(response, 404, mensaje("El usuario no existe."));
                return;
            }
            responder(response, 200, ok());

        } catch (SQLIntegrityConstraintViolationException e) {
            // El usuario tiene solicitudes (u otros datos) que dependen de él
            responder(response, 409,
                    mensaje("No se puede eliminar: este usuario tiene solicitudes asociadas."));
        } catch (SQLException e) {
            if (e.getErrorCode() == 1451) {
                responder(response, 409,
                        mensaje("No se puede eliminar: este usuario tiene solicitudes asociadas."));
            } else {
                log("Error eliminando usuario", e);
                responder(response, 500, mensaje("No se pudo eliminar el usuario."));
            }
        }
    }

    // ---------------------------------------------------------------
    // Utilidades
    // ---------------------------------------------------------------
    private static class Datos {
        String nombres, apellidos, tipoDoc, numDoc, correo, celular, rol;
    }

    private Datos leerDatos(HttpServletRequest request) {
        Datos d = new Datos();
        d.nombres   = limpio(request.getParameter("nombres"));
        d.apellidos = limpio(request.getParameter("apellidos"));
        d.tipoDoc   = limpio(request.getParameter("tipoDoc"));
        d.numDoc    = limpio(request.getParameter("numDoc"));
        d.correo    = limpio(request.getParameter("correo"));
        d.celular   = limpio(request.getParameter("celular"));
        d.rol       = limpio(request.getParameter("rol"));
        return d;
    }

    /** Devuelve un mensaje de error, o null si los datos son válidos. */
    private String validar(Datos d) {
        if (d.nombres.isEmpty() || d.apellidos.isEmpty()) {
            return "Escribe los nombres y los apellidos.";
        }
        if (!d.tipoDoc.matches("CC|TI|CE|PP")) {
            return "Tipo de documento no válido.";
        }
        if (!d.numDoc.matches("[0-9]{5,15}")) {
            return "El documento debe tener entre 5 y 15 números.";
        }
        if (!d.correo.matches("[^\\s@]+@[^\\s@]+\\.[^\\s@]+")) {
            return "Escribe un correo válido.";
        }
        if (!d.celular.matches("[0-9]{10}")) {
            return "El celular debe tener 10 números.";
        }
        if (!rolValido(d.rol)) {
            return "Rol no válido.";
        }
        return null;
    }

    private boolean correoExiste(Connection cn, String correo, int idExcluido) throws SQLException {
        String sql = "SELECT 1 FROM " + TABLA + " WHERE correo = ? AND idUsuarios <> ?";
        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, correo);
            ps.setInt(2, idExcluido);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    private boolean esAdmin(HttpServletRequest request) {
        HttpSession sesion = request.getSession(false);
        return sesion != null && "administrador".equals(sesion.getAttribute("rol"));
    }

    private int idSesion(HttpServletRequest request) {
        HttpSession sesion = request.getSession(false);
        if (sesion == null) { return -1; }
        Object id = sesion.getAttribute("idUsuario");
        return (id instanceof Integer) ? (Integer) id : -1;
    }

    private boolean rolValido(String rol) {
        return "usuario".equals(rol) || "agente".equals(rol) || "administrador".equals(rol);
    }

    private int entero(String s) {
        try {
            return Integer.parseInt(s == null ? "" : s.trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private String limpio(String s) {
        return (s == null) ? "" : s.trim();
    }

    private String ok() {
        return "{\"ok\":true}";
    }

    private String mensaje(String texto) {
        return "{\"mensaje\":\"" + j(texto) + "\"}";
    }

    private void responder(HttpServletResponse response, int estado, String json) throws IOException {
        response.setStatus(estado);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-store");
        response.getWriter().write(json);
    }

    /** Escapa un texto para meterlo dentro de un JSON. */
    private static String j(String s) {
        if (s == null) { return ""; }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '"':  sb.append("\\\""); break;
                case '\\': sb.append("\\\\"); break;
                case '\n': sb.append("\\n");  break;
                case '\r': sb.append("\\r");  break;
                case '\t': sb.append("\\t");  break;
                default:
                    if (c < 0x20) {
                        sb.append(String.format("\\u%04x", (int) c));
                    } else {
                        sb.append(c);
                    }
            }
        }
        return sb.toString();
    }
}