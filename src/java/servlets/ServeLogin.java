/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;


import clases.Acceso;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ServeLogin")
public class ServeLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedula = request.getParameter("cedula");
        String contra = request.getParameter("contra");
        
        Acceso acceso = new Acceso();

String nombre = acceso.validar(cedula, contra);

if (nombre != null) {
    HttpSession session = request.getSession();
    session.setAttribute("usuario", nombre);
    response.sendRedirect("Bienvenido.jsp");
} else {
    response.sendRedirect("error.jsp");
}
    }
}