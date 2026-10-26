package servlets;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AutenticacionFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String ruta = request.getRequestURI().substring(request.getContextPath().length());

        // Páginas públicas (no requieren sesión)
        boolean publico = ruta.equals("/")
                || ruta.equals("/index.jsp")
                || ruta.equals("/paginaPrincipal.jsp")
               
                || ruta.equals("/LoginServlet")
                || ruta.equals("/ServleRegistro")
                || ruta.equals("/Registro%20de%20nuevo%20usuario.jsp")
                || ruta.equals("/Consultar%20estado%20de%20solicitud.jsp")
                || ruta.equals("/Registro de nuevo usuario.jsp")
                || ruta.equals("/consultar-estado.html")
                || ruta.equals("/ConsultarEstadoServlet")
                || ruta.equals("/Logo2.jpeg")
                || ruta.endsWith(".css")
                || ruta.startsWith("/css/")
                || ruta.startsWith("/js/")
                || ruta.startsWith("/img/")
                || ruta.startsWith("/imagenes/");

        HttpSession sesion = request.getSession(false);
        boolean logueado = sesion != null && sesion.getAttribute("idUsuario") != null;

        if (publico || logueado) {
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            // Control por rol: solo se revisa en páginas no públicas (ya hay sesión)
            if (!publico) {
                String rol = (String) sesion.getAttribute("rol");

                if (ruta.startsWith("/admin/") && !"administrador".equals(rol)) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN);
                    return;
                }
                if (ruta.startsWith("/agente/")
                        && !("agente".equals(rol) || "administrador".equals(rol))) {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN);
                    return;
                }
            }

            chain.doFilter(req, res);
        } else {
            // Sin sesión: mandar al login (index.jsp)
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}