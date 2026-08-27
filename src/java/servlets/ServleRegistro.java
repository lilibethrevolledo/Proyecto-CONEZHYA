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

@WebServlet("/ServleRegistro")
public class ServleRegistro extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String nombre = request.getParameter("nombre");
        String cedula = request.getParameter("cedula");
 String correo = request.getParameter("correo");
 String celular = request.getParameter("celular");
 String contra = request.getParameter("contra");
 
Acceso acceso = new Acceso();

if (acceso.registrar(nombre, cedula, correo, celular, contra)) {
    response.sendRedirect("Index.jsp");
} else {
    response.getWriter().println("No fue posible registrar el usuario.");
}
    }
}
