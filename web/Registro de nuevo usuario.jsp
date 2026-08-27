<%-- 
    Document   : Registro de nuevo usuario
    Created on : 19/08/2026, 9:18:13?p.?m.
    Author     : User
--%>

<!DOCTYPE html> 
<html lang="es"> 
<head> 
<meta charset="UTF-8"> 
<title>CONEZHYA - Registro</title> 
<link rel="stylesheet" href="style.css"> 
</head> 
<body> 
 
    <div class="contenedor"> 
 
        <div class="barra-izquierda"></div> 
 
        <div class="contenido"> 
 
            <div class="logo"> 
                <img src="Logo2.jpg" alt="Logo CONEZHYA"> 
            </div> 
 
            <div class="ayuda"> 
                ? 
            </div> 
 
            <div class="titulo"> 
                <span class="icono">?</span> 
                <h1>Registro</h1> 
            </div> 
 
            <form id="formRegistro"> 
 
                <div class="fila"> 
                    <label>Nombres</label> 
                    <input type="text" id="nombres"> 
                </div> 
 
                <div class="fila"> 
                    <label>Apellidos</label> 
                    <input type="text" id="apellidos"> 
                </div> 
 
                <div class="fila"> 
                    <label>Documento</label> 
 
                    <select id="documento"> 
                        <option>Cédula de ciudadanía</option> 
                        <option>Tarjeta de identidad</option> 
                        <option>Cédula extranjera</option> 
                        <option>Pasaporte</option> 
                    </select> 
                </div> 
 
                <div class="fila"> 
                    <label>Número</label> 
                    <input type="text" id="numero"> 
                </div> 
 
                <div class="fila"> 
                    <label>Fecha de Nacimiento</label> 
                    <input type="text" placeholder="DD/MM/AAAA"> 
                </div> 
 
                <div class="check"> 
    <input type="checkbox" id="datos"> 
    <label for="datos"> 
        Acepto el tratamiento de datos personales. 
    </label> 
</div> 
                <button type="submit" class="btn"> 
                    Registrarme 
                </button> 
 
            </form> 
 
        </div> 
 
    </div> 
 
    <script src="script.js"></script> 
 
</body> 
 
</html>

<style>
   * {
    margin:0; 
    padding:0; 
    box-sizing:border-box; 
    font-family: Arial, Helvetica, sans-serif; 
} 
 
body{ 
    background:#ececec; 
    display:flex; 
    justify-content:center; 
    align-items:center; 
    min-height:100vh; 
} 
 
.contenedor{ 
    width:1200px; 
    height:650px; 
    min-height:700px; 
    background:white; 
    border:1px solid #999; 
    display:flex; 
} 
 
.barra-izquierda{ 
    width:90px; 
    background:#00559e; 
} 
 
.contenido{ 
    flex:1; 
    position:relative; 
    padding-top:40px; 
} 
 
.logo{ 
    margin-left:10px; 
} 
 
.logo.img{ 
    margin-bottom: 100px; 
    position: relative; 
    top: 38px; 
} 
 
.ayuda{ 
    position:absolute; 
    top:25px; 
    right:25px; 
 
    width:30px; 
    height:30px; 
 
    border:2px solid #1f74ff; 
    border-radius:50%; 
 
    color:#1f74ff; 
 
    display:flex; 
    justify-content:center; 
    align-items:center; 
 
    font-weight:bold; 
    cursor:pointer; 
} 
 
.titulo{ 
    display:flex; 
    justify-content:center; 
    align-items:center; 
    gap:10px; 
    margin-top:20px; 
    margin-bottom:30px; 
} 
     
 
.icono{ 
    font-size:24px; 
    line-height: 1; 
 
} 
 
.titulo h1{ 
    margin: 0; 
    font-size: 24px; 
    font-weight: normal; 
    line-height: 1; 
} 
 
form{ 
    width: 450px; 
    margin: 0 auto; 
} 
 
.fila{ 
    display:flex; 
    align-items:center; 
    justify-content:center; 
    margin-bottom:15px; 
} 
 
.fila label{ 
    width:140px; 
    text-align:right; 
    margin-right:15px; 
    font-size:14px; 
} 
 
.fila select{ 
    width:250px; 
    height:30px; 
    font-size:14px; 
    border:1px solid #777; 
    padding-left:8px; 
} 
 
.check{ 
    display:flex; 
    align-items:center; 
    justify-content:center; 
    gap:5px; 
} 
 
.check input{ 
    width:18px; 
    height:18px; 
} 
 
.check label{ 
    width:auto; 
    margin:0; 
    padding:0; 
    white-space:nowrap; 
} 
 
.btn{ 
    display:block; 
    margin:20px auto; 
    width:110px; 
    height:35px; 
    background:#b7d7a8; 
    border:1px solid #5f8050; 
    border-radius:5px; 
    cursor:pointer; 
display:block; 
} 
.btn:hover{ 
background:#a7cb97;
*{ 
    margin:0; 
    padding:0; 
    box-sizing:border-box; 
    font-family: Arial, Helvetica, sans-serif; 
} 
 
body{ 
    background:#ececec; 
    display:flex; 
    justify-content:center; 
    align-items:center; 
    min-height:100vh; 
} 
 
.contenedor{ 
    width:1200px; 
    height:650px; 
    min-height:700px; 
    background:white; 
    border:1px solid #999; 
    display:flex; 
} 
 
.barra-izquierda{ 
    width:90px; 
    background:#00559e; 
} 
 
.contenido{ 
    flex:1; 
    position:relative; 
    padding-top:40px; 
} 
 
.logo{ 
    margin-left:10px; 
} 
 
.logo.img{ 
    margin-bottom: 100px; 
    position: relative; 
    top: 38px; 
} 
 
.ayuda{ 
    position:absolute; 
    top:25px; 
    right:25px; 
 
    width:30px; 
    height:30px; 
 
    border:2px solid #1f74ff; 
    border-radius:50%; 
 
    color:#1f74ff; 
 
    display:flex; 
    justify-content:center; 
    align-items:center; 
 
    font-weight:bold; 
    cursor:pointer; 
} 
 
.titulo{ 
    display:flex; 
    justify-content:center; 
    align-items:center; 
    gap:10px; 
    margin-top:20px; 
    margin-bottom:30px; 
} 
     
 
.icono{ 
    font-size:24px; 
    line-height: 1; 
 
} 
 
.titulo h1{ 
    margin: 0; 
    font-size: 24px; 
    font-weight: normal; 
    line-height: 1; 
} 


.form {
    width: 450px;
    margin: 0 auto;
}

.fila {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
}

.fila label {
    width: 140px;
    text-align: right;
    margin-right: 15px;
    font-size: 14px;
}

.fila select {
    width: 250px;
    height: 30px;
    font-size: 14px;
    border: 1px solid #777;
    padding-left: 8px;
}

.check {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
}

.check input {
    width: 18px;
    height: 18px;
}

.check label {
    width: auto;
    margin: 0;
    padding: 0;
    white-space: nowrap;
}

.btn {
    display: block;
    margin: 20px auto;
    width: 110px;
    height: 35px;
    background: #b7d7a8;
    border: 1px solid #5f8050;
    border-radius: 5px;
    cursor: pointer;
}

.btn:hover {
    background: #a7cb97;
}

}
