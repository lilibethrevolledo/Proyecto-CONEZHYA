package servlets;

import conexion.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        if (correo == null || correo.isBlank()
                || contrasena == null || contrasena.isBlank()) {

            request.setAttribute("error",
                    "Debes completar todos los campos.");

            request.getRequestDispatcher("/index.jsp")
                    .forward(request, response);
            return;
        }

        String sql = "SELECT idUsuarios, nombres, apellidos, rol "
                   + "FROM adso_sena.usuarios "
                   + "WHERE correo = ? AND `contraseña` = ?";

        try (Connection cn = ConexionBD.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, correo);
            ps.setString(2, contrasena);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    request.getSession().invalidate();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("idUsuario", rs.getInt("idUsuarios"));
                    sesion.setAttribute("correo", correo);

                    sesion.setAttribute("nombre", rs.getString("nombres"));
                    sesion.setAttribute("apellido", rs.getString("apellidos"));

                    String rol = rs.getString("rol");
                    if (rol == null || rol.isBlank()) {
                        rol = "usuario";
                    }
                    sesion.setAttribute("rol", rol);

                    sesion.setMaxInactiveInterval(30 * 60);

                    response.sendRedirect(
                            request.getContextPath() + "/Inicio.jsp");
                    return;

                } else {
                    request.setAttribute("error",
                            "Correo o contraseña incorrectos.");
                }
            }

        } catch (SQLException e) {

            log("Error consultando MySQL", e);

            request.setAttribute("error",
                    "Error al consultar la base de datos.");
        }

        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath() + "/index.jsp");
    }
}