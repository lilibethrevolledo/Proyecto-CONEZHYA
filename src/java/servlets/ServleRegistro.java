package servlets;

import conexion.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ServleRegistro", urlPatterns = {"/ServleRegistro"})
public class ServleRegistro extends HttpServlet {

    private static final String PAGINA_REGISTRO = "/Registro de nuevo usuario.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombres = limpiar(request.getParameter("nombres"));
        String apellidos = limpiar(request.getParameter("apellidos"));
        String tipoDocumento = limpiar(request.getParameter("tipoDocumento"));
        String numeroDocumento = limpiar(request.getParameter("numeroDocumento"));
        String correo = limpiar(request.getParameter("correo"));
        String celular = limpiar(request.getParameter("celular"));
        String contrasena = request.getParameter("contrasena");
        String confirmar = request.getParameter("confirmar");

        if (nombres.isEmpty() || apellidos.isEmpty() || tipoDocumento.isEmpty()
                || numeroDocumento.isEmpty() || correo.isEmpty() || celular.isEmpty()
                || contrasena == null || contrasena.isEmpty()) {
            volverConError(request, response, "Debes completar todos los campos.");
            return;
        }

        if (!contrasena.equals(confirmar)) {
            volverConError(request, response, "Las contraseñas no coinciden.");
            return;
        }

        if (contrasena.length() > 45) {
            volverConError(request, response,
                    "La contraseña es demasiado larga (máximo 45 caracteres).");
            return;
        }

        String sql = "INSERT INTO adso_sena.usuarios "
                   + "(nombres, apellidos, tipo_documento, numero_documento, "
                   + "correo, celular, `contraseña`) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection cn = ConexionBD.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, nombres);
            ps.setString(2, apellidos);
            ps.setString(3, tipoDocumento);
            ps.setString(4, numeroDocumento);
            ps.setString(5, correo);
            ps.setString(6, celular);
            ps.setString(7, contrasena);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/index.jsp?registro=ok");

        } catch (SQLIntegrityConstraintViolationException e) {
            volverConError(request, response,
                    "Ese correo o número de documento ya está registrado.");

        } catch (SQLException e) {
            log("Error registrando usuario", e);
            volverConError(request, response, "Error al guardar en la base de datos.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private String limpiar(String valor) {
        return valor == null ? "" : valor.trim();
    }

    private void volverConError(HttpServletRequest request, HttpServletResponse response,
                                String mensaje) throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher(PAGINA_REGISTRO).forward(request, response);
    }
}