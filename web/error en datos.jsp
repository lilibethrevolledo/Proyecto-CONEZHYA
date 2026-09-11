<%-- 
    Document   : error en datos
    Created on : 14/08/2026, 11:52:28?a.?m.
    Author     : User
--%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHYA · Gestión de Clientes</title>
<link rel="stylesheet" href="clientes.css">
</head>
<body>

<div class="contenedor">

  <h1 class="titulo-app">CONEZHYA</h1>

  <div class="panel">
    <div class="panel-header">Gestión de Clientes</div>

    <div class="panel-body">
      <button class="btn-nuevo">Nuevo Cliente</button>

      <div class="tabla-wrapper">
        <table class="tabla-clientes">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombres</th>
              <th>Apellidos</th>
              <th>Email</th>
              <th>Celular</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Andres</td>
              <td>Gomez</td>
              <td>andres@gmail.com</td>
              <td>3001234567</td>
              <td class="col-acciones">
                <button class="btn-actualizar">Actualizar</button>
                <button class="btn-eliminar">Eliminar</button>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>Laura</td>
              <td>Martinez</td>
              <td>laura@gmail.com</td>
              <td>3012345678</td>
              <td class="col-acciones">
                <button class="btn-actualizar">Actualizar</button>
                <button class="btn-eliminar">Eliminar</button>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>Sofia</td>
              <td>Rodriguez</td>
              <td>sofia@gmail.com</td>
              <td>3023456789</td>
              <td class="col-acciones">
                <button class="btn-actualizar">Actualizar</button>
                <button class="btn-eliminar">Eliminar</button>
              </td>
            </tr>
            <tr>
              <td>4</td>
              <td>Diego</td>
              <td>Hernandez</td>
              <td>diego@gmail.com</td>
              <td>3104567890</td>
              <td class="col-acciones">
                <button class="btn-actualizar">Actualizar</button>
                <button class="btn-eliminar">Eliminar</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>

</body>
</html>
<style>

:root{
  --azul-oscuro:#0b2f4e;
  --azul-medio:#134a72;
  --teal:#1a9e97;
  --teal-claro:#22b3a6;
  --texto-oscuro:#0f2436;
  --texto-gris:#5b6b78;
  --borde:#dfe6ea;
  --amarillo:#f0ad4e;
  --amarillo-hover:#e0982f;
  --rojo:#d9534f;
  --rojo-hover:#c9302c;
  --fila-alterna:#f5f9f9;
}

*{ box-sizing:border-box; }

body{
  margin:0;
  min-height:100vh;
  font-family:'Segoe UI', Arial, sans-serif;
  background:
    radial-gradient(circle at 15% 20%, rgba(255,255,255,0.05), transparent 40%),
    linear-gradient(135deg, var(--azul-oscuro) 0%, var(--azul-medio) 45%, var(--teal) 100%);
  padding:36px 16px;
}

.contenedor{
  max-width:900px;
  margin:0 auto;
}

.titulo-app{
  color:#ffffff;
  text-align:center;
  font-size:26px;
  letter-spacing:0.5px;
  margin:0 0 22px;
}

.panel{
  background:#ffffff;
  border-radius:16px;
  overflow:hidden;
  box-shadow:0 30px 60px rgba(6, 30, 50, 0.35);
}

.panel-header{
  background:linear-gradient(135deg, var(--teal), var(--teal-claro));
  color:#ffffff;
  text-align:center;
  font-size:17px;
  font-weight:600;
  padding:14px 20px;
}

.panel-body{
  padding:22px 24px 26px;
}

.btn-nuevo{
  background:linear-gradient(135deg, var(--azul-medio), var(--azul-oscuro));
  color:#ffffff;
  border:none;
  border-radius:8px;
  padding:9px 18px;
  font-size:13.5px;
  font-weight:600;
  cursor:pointer;
  margin-bottom:16px;
  transition:transform .12s ease, box-shadow .12s ease;
  box-shadow:0 8px 16px rgba(11,47,78,0.25);
}
.btn-nuevo:hover{ transform:translateY(-1px); }

.tabla-wrapper{
  overflow-x:auto;
  border-radius:10px;
  border:1px solid var(--borde);
}

.tabla-clientes{
  width:100%;
  border-collapse:collapse;
  font-size:13.5px;
}

.tabla-clientes thead th{
  background:var(--azul-oscuro);
  color:#ffffff;
  text-align:left;
  padding:11px 14px;
  font-weight:600;
  white-space:nowrap;
}

.tabla-clientes tbody td{
  padding:10px 14px;
  color:var(--texto-oscuro);
  border-bottom:1px solid var(--borde);
  white-space:nowrap;
}

.tabla-clientes tbody tr:nth-child(even){
  background:var(--fila-alterna);
}

.tabla-clientes tbody tr:hover{
  background:rgba(26,158,151,0.08);
}

.col-acciones{
  display:flex;
  gap:8px;
}

.btn-actualizar, .btn-eliminar{
  border:none;
  border-radius:6px;
  padding:6px 12px;
  font-size:12.5px;
  font-weight:600;
  color:#ffffff;
  cursor:pointer;
  transition:transform .12s ease, opacity .12s ease;
}

.btn-actualizar{
  background:var(--amarillo);
}
.btn-actualizar:hover{
  background:var(--amarillo-hover);
  transform:translateY(-1px);
}

.btn-eliminar{
  background:var(--rojo);
}
.btn-eliminar:hover{
  background:var(--rojo-hover);
  transform:translateY(-1px);
}

@media (max-width:600px){
  .panel-body{ padding:16px 14px 20px; }
  .tabla-clientes{ font-size:12.5px; }
}