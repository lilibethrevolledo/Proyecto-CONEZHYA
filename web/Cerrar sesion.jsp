<%-- 
    Document   : Cerrar sesion
    Created on : 18/08/2026, 4:01:35?p.?m.
    Author     : User
--%>

<%

session.invalidate();

response.sendRedirect("index.jsp");

%>
