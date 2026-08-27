<%-- 
    Document   : Conezhya
    Created on : 13/08/2026, 4:17:08?p.?m.
    Author     : Lilibeth
--%>

index.jsp

<!DOCTYPE html> 
<html lang="es"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>CONEZHYA - Inicio de Sesión</title> 
<link rel="stylesheet" href="style.css"> 
</head> 
<body> 
<div class="contenedor"> 
<!-- Barra Azul --> 
<div class="barra-izquierda"></div> 
<!-- Contenido --> 
        <div class="contenido"> 
 
            <div class="logo"> 
                <img src="Logo2.jpeg"> 
            </div> 
 
            <h1>Inicio Sesión</h1> 
 
            <form id="loginForm"> 
 
                <div class="fila"> 
                    <label>Usuario</label> 
                    <input type="text" id="usuario" required> 
                </div> 
 
                <div class="fila"> 
                    <label>Contraseña</label> 
                    <input type="password" id="password" required> 
                </div> 
 
                <button type="submit" class="btn"> 
                    Aceptar 
                </button> 
 
            </form> 
 
            <div class="links"> 
    <a href="#">Olvidé contraseña</a> 
    <a href="#">Regístrame</a> 
</div> 
 
            <div class="slogan"> 
                Conexión que soluciona, excelencia que sorprende. 
            </div> 
 
        </div> 
 
    </div> 
 
    <script src="script.js"></script> 
 
</body> 
</html>

