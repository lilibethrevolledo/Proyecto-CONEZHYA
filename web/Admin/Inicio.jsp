<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHYA · Inicio del administrador</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
  --navy-deep: #0B2F4F;
  --blue: #155E9E;
  --teal: #12B8A0;
  --teal-light: #6FE7D0;
  --bg: #F4F8F9;
  --text-dark: #10202C;
  --text-muted: #5B6B76;
  --border: #DCE6E9;
  --radius: 10px;
  --sidebar-w: 260px;
  --ok: #15935a;
  --error: #c8403d;
}

* { box-sizing: border-box; }
html, body { height: 100%; margin: 0; }

body {
  font-family: 'Inter', sans-serif;
  color: var(--text-dark);
  background: var(--bg);
}

h1, h2, h3 { font-family: 'Sora', sans-serif; margin: 0; }
a { color: inherit; text-decoration: none; }
:focus-visible { outline: 2px solid var(--teal); outline-offset: 2px; }

/* ---------- Barra lateral ---------- */
.sidebar {
  position: fixed;
  top: 0; left: 0; bottom: 0;
  width: var(--sidebar-w);
  background: linear-gradient(160deg, var(--navy-deep) 0%, var(--blue) 65%, #0E7C90 100%);
  color: #fff;
  display: flex;
  flex-direction: column;
  padding: 24px 16px;
  overflow: hidden;
  z-index: 30;
  transition: transform 0.25s ease;
}

.sidebar__logo {
  background: rgba(255, 255, 255, 0.94);
  border-radius: 14px;
  padding: 10px 14px;
  margin-bottom: 28px;
  position: relative;
  z-index: 2;
}
.sidebar__logo img { display: block; width: 100%; height: auto; }

.sidebar nav { position: relative; z-index: 2; }
.sidebar nav ul { list-style: none; margin: 0; padding: 0; display: grid; gap: 4px; }

.sidebar nav a {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 14px;
  border-radius: var(--radius);
  font-size: 14px;
  font-weight: 500;
  color: rgba(255, 255, 255, 0.82);
  transition: background 0.15s ease, color 0.15s ease;
}
.sidebar nav a:hover { background: rgba(255, 255, 255, 0.1); color: #fff; }
.sidebar nav a.activo { background: rgba(255, 255, 255, 0.18); color: #fff; font-weight: 600; }
.sidebar nav svg { width: 18px; height: 18px; flex: none; }
.sidebar__salir { margin-top: auto; padding-top: 16px; position: relative; z-index: 2; }

.sidebar__weave {
  position: absolute;
  bottom: -20px; right: -50px;
  width: 260px; height: 260px;
  z-index: 1;
  pointer-events: none;
}

/* ---------- Contenido ---------- */
.contenido {
  margin-left: var(--sidebar-w);
  min-height: 100vh;
  transition: margin-left 0.25s ease;
}
body.sidebar-cerrada .sidebar { transform: translateX(-100%); }
body.sidebar-cerrada .contenido { margin-left: 0; }

.topbar {
  position: sticky;
  top: 0;
  z-index: 20;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 14px 28px;
  background: #fff;
  border-bottom: 1px solid var(--border);
}

.btn-menu {
  display: grid;
  place-items: center;
  width: 42px; height: 42px;
  background: #fff;
  border: 1px solid var(--border);
  border-radius: var(--radius);
  cursor: pointer;
  color: var(--navy-deep);
}
.btn-menu:hover { border-color: var(--teal); color: var(--teal); }
.btn-menu svg { width: 20px; height: 20px; }

.usuario-chip { display: flex; align-items: center; gap: 12px; font-size: 14px; font-weight: 600; }
.avatar {
  width: 38px; height: 38px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--teal) 0%, var(--blue) 100%);
  color: #fff;
  font-family: 'Sora', sans-serif;
  font-weight: 700;
  font-size: 14px;
  display: grid;
  place-items: center;
  flex: none;
}
.usuario-chip small { display: block; color: var(--text-muted); font-weight: 500; font-size: 12px; }

main { padding: 32px 28px 56px; max-width: 1200px; }

.cabecera { margin-bottom: 24px; }
.cabecera h1 { font-size: 26px; font-weight: 700; }
.cabecera p { margin: 6px 0 0; color: var(--text-muted); font-size: 14px; }

/* Resumen */
.resumen {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 16px;
  margin-bottom: 24px;
}
.dato {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 14px;
  padding: 18px 20px;
}
.dato span { display: block; font-size: 13px; color: var(--text-muted); }
.dato strong { display: block; margin-top: 4px; font-family: 'Sora', sans-serif; font-size: 28px; }
.dato.destacado { background: linear-gradient(135deg, var(--teal) 0%, var(--blue) 100%); border: 0; }
.dato.destacado span, .dato.destacado strong { color: #fff; }

/* Título de sección */
.seccion-titulo { margin: 8px 0 16px; }
.seccion-titulo h2 { font-size: 19px; font-weight: 600; }
.seccion-titulo p { margin: 4px 0 0; color: var(--text-muted); font-size: 14px; }

/* Barra de herramientas */
.herramientas {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-bottom: 16px;
}
.herramientas input[type=search],
.herramientas select {
  padding: 12px 14px;
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  border: 1px solid var(--border);
  border-radius: var(--radius);
  background: #fff;
  color: var(--text-dark);
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}
.herramientas input[type=search] { flex: 1 1 260px; }
.herramientas input:focus, .herramientas select:focus {
  outline: none;
  border-color: var(--teal);
  box-shadow: 0 0 0 3px rgba(18, 184, 160, 0.15);
}

.btn-primary {
  padding: 12px 22px;
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  font-weight: 600;
  color: #fff;
  background: linear-gradient(135deg, var(--teal) 0%, var(--blue) 100%);
  border: none;
  border-radius: var(--radius);
  cursor: pointer;
  transition: filter 0.15s ease, transform 0.1s ease;
}
.btn-primary:hover { filter: brightness(1.06); }
.btn-primary:active { transform: scale(0.99); }
.btn-primary:disabled { opacity: 0.6; cursor: wait; }

.btn-sec {
  padding: 12px 22px;
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  font-weight: 600;
  color: var(--blue);
  background: #fff;
  border: 1.5px solid var(--blue);
  border-radius: var(--radius);
  cursor: pointer;
}
.btn-sec:hover { background: var(--bg); }

.btn-mini {
  padding: 7px 14px;
  font-family: 'Inter', sans-serif;
  font-size: 13px;
  font-weight: 600;
  color: var(--blue);
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 8px;
  cursor: pointer;
}
.btn-mini:hover { border-color: var(--teal); color: var(--teal); }
.btn-mini.peligro { color: var(--error); }
.btn-mini.peligro:hover { border-color: var(--error); background: #FDECEB; color: var(--error); }
.btn-mini:disabled { opacity: 0.45; cursor: not-allowed; }
.btn-mini:disabled:hover { border-color: var(--border); background: #fff; color: var(--blue); }
.btn-mini.peligro:disabled:hover { color: var(--error); }
.acciones-fila { display: flex; gap: 8px; }

.btn-peligro {
  padding: 12px 22px;
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  font-weight: 600;
  color: #fff;
  background: var(--error);
  border: none;
  border-radius: var(--radius);
  cursor: pointer;
  transition: filter 0.15s ease;
}
.btn-peligro:hover { filter: brightness(1.08); }
.btn-peligro:disabled { opacity: 0.6; cursor: wait; }
.modal-chico { max-width: 440px; }

/* Tabla */
.tabla-wrap {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 16px;
  overflow-x: auto;
}
table { width: 100%; border-collapse: collapse; min-width: 760px; }
th {
  text-align: left;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.4px;
  text-transform: uppercase;
  color: var(--text-muted);
  padding: 14px 18px;
  background: #F8FBFC;
  border-bottom: 1px solid var(--border);
}
td {
  padding: 14px 18px;
  font-size: 14px;
  border-bottom: 1px solid var(--border);
  vertical-align: middle;
}
tbody tr:last-child td { border-bottom: 0; }
tbody tr:hover { background: #FAFDFD; }

.celda-nombre { display: flex; align-items: center; gap: 12px; font-weight: 600; }
.celda-nombre .avatar { width: 34px; height: 34px; font-size: 12px; }
.muted { color: var(--text-muted); }

/* Selector de rol con aspecto de etiqueta */
.rol-select {
  appearance: none;
  -webkit-appearance: none;
  padding: 7px 30px 7px 14px;
  font-family: 'Inter', sans-serif;
  font-size: 13px;
  font-weight: 600;
  border: 0;
  border-radius: 999px;
  cursor: pointer;
  background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='10' height='6' viewBox='0 0 10 6'><path d='M1 1l4 4 4-4' fill='none' stroke='%235B6B76' stroke-width='1.6'/></svg>");
  background-repeat: no-repeat;
  background-position: right 12px center;
}
.rol-usuario       { background-color: #E1EFFB; color: #1d6fb5; }
.rol-agente        { background-color: #DDF6F2; color: #0C8C7A; }
.rol-administrador { background-color: #DCE6F0; color: var(--navy-deep); }
.rol-select:disabled { cursor: not-allowed; opacity: 0.85; }

.vacio { text-align: center; padding: 40px 20px; color: var(--text-muted); font-size: 14px; }

/* Ventana de formulario */
.fondo-modal {
  position: fixed;
  inset: 0;
  background: rgba(6, 20, 33, 0.55);
  display: none;
  align-items: center;
  justify-content: center;
  padding: 20px;
  z-index: 50;
}
.fondo-modal.abierto { display: flex; }

.modal {
  width: 100%;
  max-width: 560px;
  max-height: 92vh;
  overflow-y: auto;
  background: #fff;
  border-radius: 20px;
  padding: 32px;
  box-shadow: 0 24px 60px rgba(6, 20, 33, 0.35);
}
.modal h2 { font-size: 20px; margin-bottom: 4px; }
.modal .sub { margin: 0 0 22px; color: var(--text-muted); font-size: 14px; }

.grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 0 16px; }
.campo { margin-bottom: 16px; }
.campo label { display: block; font-size: 13px; font-weight: 500; margin-bottom: 6px; }
.campo input, .campo select {
  width: 100%;
  padding: 12px 14px;
  font-family: 'Inter', sans-serif;
  font-size: 14px;
  border: 1px solid var(--border);
  border-radius: var(--radius);
  background: #fff;
  color: var(--text-dark);
}
.campo input:focus, .campo select:focus {
  outline: none;
  border-color: var(--teal);
  box-shadow: 0 0 0 3px rgba(18, 184, 160, 0.15);
}
.campo input[aria-invalid="true"] { border-color: var(--error); }
.error-form { color: var(--error); font-size: 13px; min-height: 1.3em; margin: 0 0 8px; }
.acciones-modal { display: flex; gap: 12px; justify-content: flex-end; margin-top: 8px; }

/* Aviso */
.aviso {
  position: fixed;
  right: 24px;
  bottom: 24px;
  max-width: 340px;
  padding: 14px 18px;
  background: var(--navy-deep);
  color: #fff;
  border-radius: 12px;
  font-size: 14px;
  box-shadow: 0 12px 30px rgba(6, 20, 33, 0.3);
  opacity: 0;
  transform: translateY(10px);
  pointer-events: none;
  transition: opacity 0.2s ease, transform 0.2s ease;
  z-index: 60;
}
.aviso.visible { opacity: 1; transform: none; }
.aviso.error { background: var(--error); }

@media (max-width: 900px) {
  .contenido { margin-left: 0; }
  .sidebar { box-shadow: 0 0 40px rgba(0, 0, 0, 0.3); }
  main { padding: 24px 16px 48px; }
  .topbar { padding: 12px 16px; }
  .usuario-chip small { display: none; }
  .grid-2 { grid-template-columns: 1fr; }
}
@media (prefers-reduced-motion: reduce) {
  * { transition: none !important; }
}
</style>
</head>
<body>

<!-- ============ BARRA LATERAL (administrador) ============ -->
<aside class="sidebar" id="sidebar" aria-label="Menú del administrador">
  <div class="sidebar__logo"><img src="../Logo2.jpeg" alt="Logo CONEZHYA"></div>

  <nav>
    <ul>
      <li><a href="#" class="activo" aria-current="page">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M3 11l9-8 9 8"/><path d="M5 10v10h14V10"/></svg>
        Inicio</a></li>
      <li><a href="#">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M14 3H6a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"/><path d="M14 3v6h6"/><path d="M8 13h8M8 17h5"/></svg>
        Solicitudes</a></li>
      <li><a href="#">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 20V10M10 20V4M16 20v-7M22 20H2"/></svg>
        Reportes</a></li>
    </ul>
  </nav>

  <div class="sidebar__salir">
    <nav>
      <ul>
        <li><a href="../LogoutServlet">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="M16 17l5-5-5-5M21 12H9"/></svg>
          Cerrar sesión</a></li>
      </ul>
    </nav>
  </div>

  <svg class="sidebar__weave" viewBox="0 0 420 420" aria-hidden="true">
    <g stroke="#6FE7D0" stroke-opacity="0.35" stroke-width="1.4" fill="none">
      <path d="M20 400 C 90 340, 120 300, 90 260 S 40 190, 110 160"/>
      <path d="M110 170 C 200 135, 190 150, 230 120"/>
      <path d="M230 120 C 270 95, 300 100, 340 70"/>
    </g>
    <g fill="#6FE7D0">
      <circle cx="20" cy="380" r="4"/><circle cx="90" cy="260" r="3.5"/>
      <circle cx="110" cy="160" r="4"/><circle cx="230" cy="120" r="3.5"/>
      <circle cx="340" cy="70" r="4.5"/>
    </g>
  </svg>
</aside>

<!-- ============ CONTENIDO ============ -->
<div class="contenido">
  <header class="topbar">
    <button type="button" class="btn-menu" id="btnMenu" aria-label="Mostrar u ocultar el menú" aria-controls="sidebar" aria-expanded="true">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
    </button>

    <div class="usuario-chip">
      <div>
        <span id="nombreActivo">Administrador</span>
        <small>Administrador</small>
      </div>
      <div class="avatar" id="avatarActivo">AD</div>
    </div>
  </header>

  <main>
    <div class="cabecera">
      <h1>Inicio</h1>
      
    </div>

    <section class="resumen" aria-label="Resumen de usuarios">
      <div class="dato destacado"><span>Total de usuarios</span><strong id="cTotal">0</strong></div>
      <div class="dato"><span>Usuarios</span><strong id="cUsuarios">0</strong></div>
      <div class="dato"><span>Agentes</span><strong id="cAgentes">0</strong></div>
      <div class="dato"><span>Administradores</span><strong id="cAdmins">0</strong></div>
    </section>

    <div class="seccion-titulo">
      <h2>Gestión de usuarios</h2>
      
    </div>

    <div class="herramientas">
      <input type="search" id="buscar" placeholder="Buscar por nombre, correo o documento" aria-label="Buscar usuarios">
      <select id="filtroRol" aria-label="Filtrar por rol">
        <option value="">Todos los roles</option>
        <option value="usuario">Usuario</option>
        <option value="agente">Agente</option>
        <option value="administrador">Administrador</option>
      </select>
      <button type="button" class="btn-primary" id="btnNuevo">+ Nuevo usuario</button>
    </div>

    <div class="tabla-wrap">
      <table>
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Documento</th>
            <th>Celular</th>
            <th>Rol</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody id="cuerpoTabla"></tbody>
      </table>
      <p class="vacio" id="mensajeVacio" hidden>No hay usuarios que coincidan con la búsqueda.</p>
    </div>
  </main>
</div>

<!-- ============ VENTANA: NUEVO / EDITAR ============ -->
<div class="fondo-modal" id="fondoModal">
  <div class="modal" role="dialog" aria-modal="true" aria-labelledby="tituloModal">
    <h2 id="tituloModal">Nuevo usuario</h2>
    <p class="sub" id="subModal">Completa los datos de la cuenta.</p>

    <form id="formUsuario" novalidate>
      <input type="hidden" id="fId">

      <div class="grid-2">
        <div class="campo"><label for="fNombres">Nombres</label><input id="fNombres" type="text" maxlength="60" required></div>
        <div class="campo"><label for="fApellidos">Apellidos</label><input id="fApellidos" type="text" maxlength="60" required></div>
      </div>

      <div class="grid-2">
        <div class="campo">
          <label for="fTipoDoc">Tipo de documento</label>
          <select id="fTipoDoc">
            <option value="CC">CC</option>
            <option value="TI">TI</option>
            <option value="CE">CE</option>
            <option value="PP">Pasaporte</option>
          </select>
        </div>
        <div class="campo"><label for="fNumDoc">Número de documento</label><input id="fNumDoc" type="text" inputmode="numeric" maxlength="15" required></div>
      </div>

      <div class="grid-2">
        <div class="campo"><label for="fCorreo">Correo electrónico</label><input id="fCorreo" type="email" maxlength="100" required></div>
        <div class="campo"><label for="fCelular">Celular</label><input id="fCelular" type="text" inputmode="numeric" maxlength="10" required></div>
      </div>

      <div class="grid-2">
        <div class="campo" id="campoClave">
          <label for="fClave">Contraseña inicial</label>
          <input id="fClave" type="password" maxlength="50" autocomplete="new-password">
        </div>
        <div class="campo">
          <label for="fRol">Rol</label>
          <select id="fRol">
            <option value="usuario">Usuario</option>
            <option value="agente">Agente</option>
            <option value="administrador">Administrador</option>
          </select>
        </div>
      </div>

      <p class="error-form" id="errorForm" role="alert"></p>

      <div class="acciones-modal">
        <button type="button" class="btn-sec" id="btnCancelar">Cancelar</button>
        <button type="submit" class="btn-primary" id="btnGuardar">Guardar</button>
      </div>
    </form>
  </div>
</div>

<!-- ============ VENTANA: CONFIRMAR ELIMINACIÓN ============ -->
<div class="fondo-modal" id="fondoEliminar">
  <div class="modal modal-chico" role="alertdialog" aria-modal="true" aria-labelledby="tituloEliminar" aria-describedby="textoEliminar">
    <h2 id="tituloEliminar">Eliminar usuario</h2>
    <p class="sub" id="textoEliminar"></p>
    <div class="acciones-modal">
      <button type="button" class="btn-sec" id="btnCancelarEliminar">Cancelar</button>
      <button type="button" class="btn-peligro" id="btnConfirmarEliminar">Eliminar</button>
    </div>
  </div>
</div>

<div class="aviso" id="aviso" role="status" aria-live="polite"></div>

<script>
/* ==========================================================
   CONEXIÓN CON LA BASE DE DATOS (a través de UsuariosServlet)
   Todas las funciones avisan al terminar: alTerminar(error, datos)
   ========================================================== */
var URL_SERVLET = "../UsuariosServlet";

/* Datos de la persona que inició sesión (se llenan al cargar la página) */
var USUARIO_ACTUAL_ID = 0;
var NOMBRE_ACTUAL = "";

function formulario(obj){
  var partes = [];
  for(var k in obj){
    if(obj.hasOwnProperty(k) && obj[k] !== null && obj[k] !== undefined){
      partes.push(encodeURIComponent(k) + "=" + encodeURIComponent(obj[k]));
    }
  }
  return partes.join("&");
}

function peticion(metodo, url, cuerpo, alTerminar){
  var xhr = new XMLHttpRequest();
  xhr.open(metodo, url);
  if(metodo === "POST"){
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
  }
  xhr.onload = function(){
    var datos = null;
    try { datos = JSON.parse(xhr.responseText); } catch(e) { datos = null; }
    if(xhr.status >= 200 && xhr.status < 300 && datos !== null){
      alTerminar(null, datos);
      return;
    }
    var msg = (datos && datos.mensaje) ? datos.mensaje : "";
    alTerminar({status: xhr.status, mensaje: msg, conflicto: xhr.status === 409}, null);
  };
  xhr.onerror = function(){
    alTerminar({status: 0, mensaje: "", conflicto: false}, null);
  };
  xhr.send(cuerpo);
}

function cargarUsuarios(alTerminar){
  peticion("GET", URL_SERVLET + "?accion=listar", null, alTerminar);
}

function cambiarRol(id, rol, alTerminar){
  peticion("POST", URL_SERVLET, formulario({accion: "cambiarRol", id: id, rol: rol}), function(error){
    alTerminar(error);
  });
}

function guardarUsuario(d, alTerminar){
  var datos = {
    accion: d.id ? "editar" : "crear",
    id: d.id,
    nombres: d.nombres,
    apellidos: d.apellidos,
    tipoDoc: d.tipoDoc,
    numDoc: d.numDoc,
    correo: d.correo,
    celular: d.celular,
    clave: d.clave,
    rol: d.rol
  };
  peticion("POST", URL_SERVLET, formulario(datos), function(error){
    alTerminar(error);
  });
}

function eliminarUsuario(id, alTerminar){
  peticion("POST", URL_SERVLET, formulario({accion: "eliminar", id: id}), function(error){
    alTerminar(error);
  });
}

/* ==========================================================
   INTERFAZ
   ========================================================== */
var usuarios = [];
var cuerpo = document.getElementById("cuerpoTabla");
var mensajeVacio = document.getElementById("mensajeVacio");
var buscar = document.getElementById("buscar");
var filtroRol = document.getElementById("filtroRol");

function iniciales(nombres, apellidos){
  var a = (nombres || "").charAt(0);
  var b = (apellidos || "").charAt(0);
  var r = (a + b).toUpperCase();
  return r || "?";
}

function texto(s){ return (s === null || s === undefined) ? "" : String(s); }

function mostrarAviso(msg, esError){
  var el = document.getElementById("aviso");
  el.textContent = msg;
  el.className = "aviso visible" + (esError ? " error" : "");
  clearTimeout(mostrarAviso.t);
  mostrarAviso.t = setTimeout(function(){ el.className = "aviso"; }, 3200);
}

function celda(contenido, clase){
  var td = document.createElement("td");
  if(clase){ td.className = clase; }
  if(typeof contenido === "string"){ td.textContent = contenido; }
  else if(contenido){ td.appendChild(contenido); }
  return td;
}

function pintarContadores(){
  var u = 0, a = 0, ad = 0;
  for(var i = 0; i < usuarios.length; i++){
    if(usuarios[i].rol === "agente"){ a++; }
    else if(usuarios[i].rol === "administrador"){ ad++; }
    else { u++; }
  }
  document.getElementById("cTotal").textContent = usuarios.length;
  document.getElementById("cUsuarios").textContent = u;
  document.getElementById("cAgentes").textContent = a;
  document.getElementById("cAdmins").textContent = ad;
}

function coincide(u){
  var q = buscar.value.trim().toLowerCase();
  var rol = filtroRol.value;
  if(rol && u.rol !== rol){ return false; }
  if(!q){ return true; }
  var base = (u.nombres + " " + u.apellidos + " " + u.correo + " " + u.numDoc).toLowerCase();
  return base.indexOf(q) !== -1;
}

function crearSelectorRol(u){
  var sel = document.createElement("select");
  sel.className = "rol-select rol-" + u.rol;
  sel.setAttribute("aria-label", "Rol de " + u.nombres + " " + u.apellidos);
  var opciones = [["usuario","Usuario"],["agente","Agente"],["administrador","Administrador"]];
  for(var i = 0; i < opciones.length; i++){
    var op = document.createElement("option");
    op.value = opciones[i][0];
    op.textContent = opciones[i][1];
    if(opciones[i][0] === u.rol){ op.selected = true; }
    sel.appendChild(op);
  }
  /* Tu propia cuenta no se puede degradar: evitas quedarte sin acceso de administrador */
  if(u.id === USUARIO_ACTUAL_ID){
    sel.disabled = true;
    sel.title = "No puedes cambiar tu propio rol";
  }
  sel.addEventListener("change", function(){
    var nuevo = sel.value;
    var nombre = u.nombres + " " + u.apellidos;
    if(!window.confirm("¿Cambiar el rol de " + nombre + " a \"" + nuevo + "\"?")){
      sel.value = u.rol;
      return;
    }
    sel.disabled = true;
    cambiarRol(u.id, nuevo, function(error){
      sel.disabled = false;
      if(error){
        sel.value = u.rol;
        mostrarAviso(error.mensaje || "No se pudo cambiar el rol. Inténtalo de nuevo.", true);
        return;
      }
      u.rol = nuevo;
      mostrarAviso("Rol actualizado: " + nombre + " ahora es " + nuevo + ".");
      pintarTabla();
    });
  });
  return sel;
}

function pintarTabla(){
  pintarContadores();
  cuerpo.innerHTML = "";
  var mostrados = 0;

  for(var i = 0; i < usuarios.length; i++){
    var u = usuarios[i];
    if(!coincide(u)){ continue; }
    mostrados++;

    var tr = document.createElement("tr");

    var caja = document.createElement("div");
    caja.className = "celda-nombre";
    var av = document.createElement("div");
    av.className = "avatar";
    av.textContent = iniciales(u.nombres, u.apellidos);
    var nom = document.createElement("span");
    nom.textContent = texto(u.nombres) + " " + texto(u.apellidos);
    caja.appendChild(av);
    caja.appendChild(nom);

    var btnEditar = document.createElement("button");
    btnEditar.type = "button";
    btnEditar.className = "btn-mini";
    btnEditar.textContent = "Editar";
    (function(usuario){
      btnEditar.addEventListener("click", function(){ abrirModal(usuario); });
    })(u);

    tr.appendChild(celda(caja));
    tr.appendChild(celda(texto(u.correo), "muted"));
    tr.appendChild(celda(texto(u.tipoDoc) + " " + texto(u.numDoc)));
    tr.appendChild(celda(texto(u.celular)));
    tr.appendChild(celda(crearSelectorRol(u)));
    var btnEliminar = document.createElement("button");
    btnEliminar.type = "button";
    btnEliminar.className = "btn-mini peligro";
    btnEliminar.textContent = "Eliminar";
    btnEliminar.setAttribute("aria-label", "Eliminar a " + texto(u.nombres) + " " + texto(u.apellidos));
    /* Tu propia cuenta no se puede eliminar */
    if(u.id === USUARIO_ACTUAL_ID){
      btnEliminar.disabled = true;
      btnEliminar.title = "No puedes eliminar tu propia cuenta";
    }
    (function(usuario){
      btnEliminar.addEventListener("click", function(){ abrirEliminar(usuario); });
    })(u);

    var acciones = document.createElement("div");
    acciones.className = "acciones-fila";
    acciones.appendChild(btnEditar);
    acciones.appendChild(btnEliminar);
    tr.appendChild(celda(acciones));
    cuerpo.appendChild(tr);
  }
  mensajeVacio.hidden = mostrados !== 0;
}

function recargar(){
  cargarUsuarios(function(error, datos){
    if(error){
      mostrarAviso("No se pudieron cargar los usuarios.", true);
      return;
    }
    usuarios = datos;
    pintarTabla();
  });
}

/* ----- Menú lateral ----- */
var btnMenu = document.getElementById("btnMenu");
function actualizarMenu(){
  btnMenu.setAttribute("aria-expanded", String(!document.body.classList.contains("sidebar-cerrada")));
}
btnMenu.addEventListener("click", function(){
  document.body.classList.toggle("sidebar-cerrada");
  actualizarMenu();
});
if(window.innerWidth <= 900){ document.body.classList.add("sidebar-cerrada"); }
actualizarMenu();

/* ----- Ventana nuevo / editar ----- */
var fondoModal = document.getElementById("fondoModal");
var form = document.getElementById("formUsuario");
var errorForm = document.getElementById("errorForm");
var btnGuardar = document.getElementById("btnGuardar");

function campo(id){ return document.getElementById(id); }

function abrirModal(u){
  errorForm.textContent = "";
  var inputs = form.querySelectorAll("input");
  for(var i = 0; i < inputs.length; i++){ inputs[i].removeAttribute("aria-invalid"); }

  if(u){
    campo("tituloModal").textContent = "Editar usuario";
    campo("subModal").textContent = "Actualiza los datos de la cuenta.";
    campo("fId").value = u.id;
    campo("fNombres").value = u.nombres;
    campo("fApellidos").value = u.apellidos;
    campo("fTipoDoc").value = u.tipoDoc;
    campo("fNumDoc").value = u.numDoc;
    campo("fCorreo").value = u.correo;
    campo("fCelular").value = u.celular;
    campo("fRol").value = u.rol;
    campo("fRol").disabled = (u.id === USUARIO_ACTUAL_ID);
    campo("fClave").value = "";
    campo("campoClave").hidden = true;
  } else {
    campo("tituloModal").textContent = "Nuevo usuario";
    campo("subModal").textContent = "Para crear un agente, elige el rol \"Agente\".";
    form.reset();
    campo("fId").value = "";
    campo("fRol").disabled = false;
    campo("campoClave").hidden = false;
  }
  fondoModal.classList.add("abierto");
  campo("fNombres").focus();
}

function cerrarModal(){ fondoModal.classList.remove("abierto"); }

document.getElementById("btnNuevo").addEventListener("click", function(){ abrirModal(null); });
document.getElementById("btnCancelar").addEventListener("click", cerrarModal);
fondoModal.addEventListener("click", function(e){ if(e.target === fondoModal){ cerrarModal(); } });
document.addEventListener("keydown", function(e){
  if(e.key === "Escape"){ cerrarModal(); cerrarEliminar(); }
});

function marcarError(id, msg){
  campo(id).setAttribute("aria-invalid", "true");
  campo(id).focus();
  errorForm.textContent = msg;
}

form.addEventListener("submit", function(e){
  e.preventDefault();
  errorForm.textContent = "";
  var inputs = form.querySelectorAll("input");
  for(var i = 0; i < inputs.length; i++){ inputs[i].removeAttribute("aria-invalid"); }

  var esNuevo = campo("fId").value === "";
  var d = {
    id: esNuevo ? null : parseInt(campo("fId").value, 10),
    nombres: campo("fNombres").value.trim(),
    apellidos: campo("fApellidos").value.trim(),
    tipoDoc: campo("fTipoDoc").value,
    numDoc: campo("fNumDoc").value.trim(),
    correo: campo("fCorreo").value.trim(),
    celular: campo("fCelular").value.trim(),
    clave: campo("fClave").value,
    rol: campo("fRol").value
  };

  if(!d.nombres){ marcarError("fNombres", "Escribe los nombres."); return; }
  if(!d.apellidos){ marcarError("fApellidos", "Escribe los apellidos."); return; }
  if(!/^[0-9]{5,15}$/.test(d.numDoc)){ marcarError("fNumDoc", "El documento debe tener entre 5 y 15 números."); return; }
  if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(d.correo)){ marcarError("fCorreo", "Escribe un correo válido."); return; }
  if(!/^[0-9]{10}$/.test(d.celular)){ marcarError("fCelular", "El celular debe tener 10 números."); return; }
  if(esNuevo && d.clave.length < 6){ marcarError("fClave", "La contraseña debe tener al menos 6 caracteres."); return; }

  for(var j = 0; j < usuarios.length; j++){
    if(usuarios[j].id !== d.id && usuarios[j].correo.toLowerCase() === d.correo.toLowerCase()){
      marcarError("fCorreo", "Ya existe un usuario con ese correo."); return;
    }
  }

  btnGuardar.disabled = true;
  btnGuardar.textContent = "Guardando…";
  guardarUsuario(d, function(error){
    btnGuardar.disabled = false;
    btnGuardar.textContent = "Guardar";
    if(error){
      errorForm.textContent = error.mensaje || "No se pudo guardar. Inténtalo de nuevo.";
      return;
    }
    cerrarModal();
    mostrarAviso(esNuevo ? "Usuario creado correctamente." : "Datos actualizados correctamente.");
    recargar();
  });
});

buscar.addEventListener("input", pintarTabla);
filtroRol.addEventListener("change", pintarTabla);

/* ----- Eliminar usuario ----- */
var fondoEliminar = document.getElementById("fondoEliminar");
var usuarioAEliminar = null;

function abrirEliminar(u){
  usuarioAEliminar = u;
  document.getElementById("textoEliminar").textContent =
    "¿Seguro que quieres eliminar a " + texto(u.nombres) + " " + texto(u.apellidos) +
    " (" + texto(u.correo) + ")? Esta acción no se puede deshacer.";
  fondoEliminar.classList.add("abierto");
  document.getElementById("btnCancelarEliminar").focus();
}

function cerrarEliminar(){
  fondoEliminar.classList.remove("abierto");
  usuarioAEliminar = null;
}

document.getElementById("btnCancelarEliminar").addEventListener("click", cerrarEliminar);
fondoEliminar.addEventListener("click", function(e){ if(e.target === fondoEliminar){ cerrarEliminar(); } });

document.getElementById("btnConfirmarEliminar").addEventListener("click", function(){
  if(!usuarioAEliminar){ return; }
  var u = usuarioAEliminar;
  var btn = this;
  btn.disabled = true;
  btn.textContent = "Eliminando…";
  eliminarUsuario(u.id, function(error){
    btn.disabled = false;
    btn.textContent = "Eliminar";
    cerrarEliminar();
    if(error){
      if(error.conflicto){
        mostrarAviso("No se puede eliminar: este usuario tiene solicitudes asociadas.", true);
      } else {
        mostrarAviso(error.mensaje || "No se pudo eliminar el usuario. Inténtalo de nuevo.", true);
      }
      return;
    }
    mostrarAviso("Usuario eliminado correctamente.");
    recargar();
  });
});

/* ----- Arranque ----- */
peticion("GET", URL_SERVLET + "?accion=yo", null, function(error, yo){
  if(error || !yo){
    /* Sin sesión válida o sin permiso: volver al inicio de sesión */
    window.location.href = "../index.jsp";
    return;
  }
  USUARIO_ACTUAL_ID = yo.id;
  NOMBRE_ACTUAL = (texto(yo.nombre) + " " + texto(yo.apellido)).trim() || "Administrador";
  document.getElementById("nombreActivo").textContent = NOMBRE_ACTUAL;
  document.getElementById("avatarActivo").textContent = iniciales(yo.nombre, yo.apellido);
  recargar();
});
</script>
</body>
</html>
