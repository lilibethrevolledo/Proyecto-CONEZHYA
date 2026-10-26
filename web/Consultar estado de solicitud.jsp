<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
  <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Consultar estado de solicitud | CONEZHYA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Sora:wght@600;700;800&display=swap" rel="stylesheet">
<style>
  :root{
    /* Paleta tomada de la pantalla de bienvenida */
    --fondo-1:#0d2f55;      /* azul marino (arriba izquierda) */
    --fondo-2:#14599b;      /* azul medio (centro) */
    --fondo-3:#0f7b8a;      /* verde azulado (abajo derecha) */
    --teal:#14b8a6;
    --azul-boton:#155b94;
    --grad-boton:linear-gradient(135deg,#14b8a6 0%,#155b94 100%);
    --punto:#6ee7d3;        /* puntos y líneas del fondo */
    --titulo:#111c2b;
    --texto:#5b6675;
    --borde:#e3e8ef;
    --campo:#f4f7fa;
    --ok:#15935a;   --ok-bg:#e3f7ec;
    --proceso:#b87503; --proceso-bg:#fdf1d9;
    --recibida:#1d6fb5; --recibida-bg:#e1effb;
    --error:#c8403d;   --error-bg:#fdeceb;
  }
  *{box-sizing:border-box;margin:0;padding:0}
  html,body{height:100%}
  body{
    font-family:"Inter","Segoe UI",Arial,sans-serif;
    color:var(--texto);
    line-height:1.55;
    background:linear-gradient(135deg,var(--fondo-1) 0%,var(--fondo-2) 55%,var(--fondo-3) 100%);
    background-attachment:fixed;
    min-height:100vh;
    display:flex;flex-direction:column;
    position:relative;overflow-x:hidden;
  }
  a{color:inherit;text-decoration:none}
  :focus-visible{outline:3px solid var(--punto);outline-offset:3px}
  


  /* ---------- Líneas de fondo ---------- */
  .lineas{position:fixed;inset:0;width:100%;height:100%;z-index:0;pointer-events:none}
  .lineas path{fill:none;stroke:var(--punto);stroke-opacity:.38;stroke-width:1.6}
  .lineas circle{fill:var(--punto)}

  /* ---------- Navbar ---------- */
  header{position:relative;z-index:2;padding:18px 28px}
  .nav{max-width:1100px;margin:0 auto;display:flex;align-items:center;justify-content:space-between;gap:20px}
  .brand{display:flex;align-items:center;gap:10px;color:#fff;font-family:"Sora",sans-serif;font-weight:800;font-size:1.2rem;letter-spacing:.3px}
  .brand-logo{
    height:65px;width:auto;max-width:320px;display:block;
    object-fit:contain;border-radius:10px;background:#fff;padding:3px;
  }
  nav ul{display:flex;gap:26px;list-style:none;align-items:center}
  nav ul a:not(.btn){color:rgba(255,255,255,.82);font-weight:500;font-size:.93rem;transition:color .2s}
  nav ul a:not(.btn):hover{color:#fff}
  .btn{
    display:inline-flex;align-items:center;justify-content:center;
    background:var(--grad-boton);color:#fff;border:0;cursor:pointer;
    font:inherit;font-weight:600;padding:12px 28px;border-radius:12px;
    transition:transform .15s, box-shadow .2s, filter .2s;
  }
  .btn:hover{transform:translateY(-1px);box-shadow:0 8px 20px rgba(21,91,148,.35);filter:brightness(1.06)}
  .btn:disabled{opacity:.65;cursor:wait;transform:none;box-shadow:none}
  .btn-nav{
    padding:10px 26px;border-radius:12px;font-size:.93rem;color:#fff;
    background:var(--grad-boton);
    box-shadow:0 0 0 2px rgba(255,255,255,.35), 0 6px 16px rgba(4,20,45,.3);
  }
  .btn-nav:hover{box-shadow:0 0 0 2px rgba(255,255,255,.6), 0 8px 20px rgba(4,20,45,.4)}
  .btn-sec{
    background:#fff;color:var(--azul-boton);border:1.5px solid var(--azul-boton);
  }
  .btn-sec:hover{background:var(--campo);box-shadow:none;filter:none}

  /* ---------- Tarjeta central ---------- */
  main{flex:1;position:relative;z-index:1;display:grid;place-items:center;padding:24px 20px 56px}
  .card{
    width:100%;max-width:520px;
    background:#fff;border-radius:22px;
    padding:40px 40px 36px;
    text-align:center;
    box-shadow:0 30px 70px rgba(4,20,45,.4);
  }
  .avatar{
    width:64px;height:64px;border-radius:50%;margin:0 auto 20px;
    background:var(--grad-boton);display:grid;place-items:center;
    color:#fff;font-family:"Sora",sans-serif;font-weight:800;font-size:1.25rem;
  }
  .avatar svg{width:28px;height:28px}
  h1{
    font-family:"Sora",sans-serif;font-weight:800;color:var(--titulo);
    font-size:1.55rem;line-height:1.25;margin-bottom:14px;
  }
  .lead{font-size:.95rem;margin-bottom:22px}
  .lema{color:var(--teal);font-size:.9rem;font-weight:500;margin-bottom:26px}

  form{text-align:left}
  label{display:block;font-weight:600;color:var(--titulo);font-size:.9rem;margin-bottom:8px}
  input[type=text]{
    width:100%;
    background:var(--campo);border:1.5px solid var(--borde);color:var(--titulo);
    font:inherit;font-size:1.02rem;letter-spacing:.4px;
    padding:14px 16px;border-radius:12px;
    transition:border-color .2s, box-shadow .2s, background .2s;
  }
  input[type=text]::placeholder{color:#9aa6b6}
  input[type=text]:focus{outline:none;background:#fff;border-color:var(--teal);box-shadow:0 0 0 4px rgba(20,184,166,.18)}
  input[aria-invalid="true"]{border-color:var(--error)}
  .hint{font-size:.82rem;margin-top:8px}
  .error-msg{color:var(--error);font-size:.88rem;margin-top:8px;min-height:1.3em}
  form .btn{width:100%;margin-top:6px}

  /* ---------- Resultado ---------- */
  #resultado{margin-top:24px;text-align:left}
  .result{border-top:1px solid var(--borde);padding-top:24px;animation:aparecer .3s ease}
  @keyframes aparecer{from{opacity:0;transform:translateY(6px)}to{opacity:1;transform:none}}
  .result-top{display:flex;justify-content:space-between;align-items:center;gap:12px;flex-wrap:wrap;margin-bottom:18px}
  .radicado-label{font-size:.78rem}
  .radicado-num{font-family:"Sora",sans-serif;font-weight:700;color:var(--titulo);font-size:1.15rem}
  .badge{
    display:inline-flex;align-items:center;gap:8px;
    padding:7px 14px;border-radius:999px;font-weight:600;font-size:.85rem;
  }
  .badge::before{content:"";width:9px;height:9px;border-radius:50%;background:currentColor}
  .badge.resuelta{color:var(--ok);background:var(--ok-bg)}
  .badge.proceso{color:var(--proceso);background:var(--proceso-bg)}
  .badge.recibida{color:var(--recibida);background:var(--recibida-bg)}
  .badge.nofound{color:var(--error);background:var(--error-bg)}

  /* Línea de avance: es una secuencia real de estados */
  .steps{display:flex;list-style:none;margin:4px 0 22px}
  .steps li{flex:1;text-align:center;position:relative;font-size:.78rem;font-weight:500}
  .steps li::before{
    content:"";display:block;width:16px;height:16px;border-radius:50%;
    margin:0 auto 6px;background:#fff;border:2px solid var(--borde);position:relative;z-index:1;
  }
  .steps li::after{content:"";position:absolute;top:7px;left:calc(50% + 11px);width:calc(100% - 22px);height:2px;background:var(--borde)}
  .steps li:last-child::after{display:none}
  .steps li.hecho{color:var(--titulo)}
  .steps li.hecho::before{background:var(--grad-boton);border-color:transparent}
  .steps li.hecho::after{background:var(--teal)}
  .steps li.actual::before{box-shadow:0 0 0 4px rgba(20,184,166,.25)}

  dl.datos{display:grid;grid-template-columns:1fr 1fr;gap:14px 20px;margin-bottom:20px}
  dl.datos .ancho{grid-column:1 / -1}
  dl.datos dt{font-size:.75rem}
  dl.datos dd{font-weight:600;color:var(--titulo);font-size:.95rem}

  .respuesta{
    background:var(--campo);border-left:4px solid var(--teal);
    border-radius:10px;padding:14px 16px;font-size:.9rem;
  }
  .respuesta strong{display:block;color:var(--titulo);margin-bottom:3px}
  .result-actions{margin-top:20px;display:flex;gap:10px;flex-wrap:wrap}
  .result-actions .btn{flex:1 1 150px;padding:11px 16px;font-size:.92rem}
  .empty p{margin-top:10px;font-size:.92rem}

  .ayuda{margin-top:22px;font-size:.84rem;text-align:center}
  .ayuda a{color:var(--azul-boton);font-weight:600}

  footer{
    position:relative;z-index:1;text-align:center;padding:18px 24px;
    color:rgba(255,255,255,.8);font-size:.85rem;
  }

  @media (max-width:720px){
    nav ul li:not(:last-child){display:none}
    .card{padding:30px 22px 28px}
    dl.datos{grid-template-columns:1fr}
  }
  @media (prefers-reduced-motion:reduce){
    *{animation:none!important;transition:none!important}
   
    


  }
</style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/paginaPrincipal.jsp"
   style="position:absolute; top:24px; left:24px;
          display:flex; align-items:center; gap:6px;
          color:#FFFFFF; font-family:Arial,sans-serif;
          font-size:14px; font-weight:600;
          text-decoration:none; z-index:10;">

    <svg width="20" height="20"
         viewBox="0 0 24 24"
         fill="none"
         stroke="currentColor"
         stroke-width="2">
        <path d="M19 12H5"/>
        <path d="M12 19l-7-7 7-7"/>
    </svg>

    Volver
</a>

<!-- Líneas onduladas con puntos, como en la pantalla de bienvenida -->
<svg class="lineas" viewBox="0 0 1334 609" preserveAspectRatio="xMidYMid slice" aria-hidden="true" focusable="false">
  <!-- arriba izquierda -->
  <path d="M54 44 C 130 62, 210 66, 280 56 S 410 36, 484 44"/>
  <circle cx="54" cy="44" r="3.5"/><circle cx="280" cy="56" r="4.5"/><circle cx="484" cy="44" r="3.5"/>
  <!-- abajo izquierda -->
  <path d="M0 528 C 90 518, 190 540, 280 520 S 400 478, 445 474"/>
  <circle cx="280" cy="520" r="4"/>
  <!-- derecha -->
  <path d="M885 470 C 940 462, 975 440, 1004 452 S 1160 424, 1253 418"/>
  <circle cx="1004" cy="452" r="4.5"/><circle cx="1253" cy="418" r="5.5"/>
</svg>

<header>
  <div class="nav">
    <a class="brand" beans aria-label="CONEZHYA, ir al inicio">
      <img class="brand-logo" src="Logo2.jpeg" alt="Logo de CONEZHYA">
    </a>
    <nav aria-label="Principal">
      <ul>
        
        <li><a class="btn btn-nav" href="${pageContext.request.contextPath}/index.jsp">Iniciar sesión</a></li>
      </ul>
    </nav>
  </div>
</header>

<main>
  <section class="card">
    <div class="avatar" aria-hidden="true">
      <svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></svg>
    </div>
    <h1>Consulta el estado de tu solicitud</h1>
    <p class="lead">No necesitas cuenta. Escribe tu número de radicado y te decimos si tu solicitud ya fue resuelta.</p>
    <p class="lema">Conexión que soluciona, excelencia que sorprende.</p>

    <form id="formConsulta" novalidate>
      <label for="radicado">Número de radicado</label>
      <input id="radicado" name="radicado" type="text" inputmode="text"
             placeholder="Ej: CNZ-2026-0001" autocomplete="off" maxlength="30"
             aria-describedby="ayudaRadicado errorRadicado" required>
      <p class="hint" id="ayudaRadicado">Lo encuentras en la confirmación que recibiste al enviar tu solicitud.</p>
      <p class="error-msg" id="errorRadicado" role="alert"></p>
      <button type="submit" class="btn" id="btnConsultar">Consultar estado</button>
    </form>

    <div id="resultado" aria-live="polite"></div>

    <p class="ayuda">¿Tienes cuenta? <a href="${pageContext.request.contextPath}/index.jsp">Inicia sesión</a> y revisa "Mis solicitudes".</p>
  </section>
</main>

<footer>CONEZHYA — Conexión que soluciona, excelencia que sorprende.</footer>

<script>
/* ==========================================================
   DATOS DE PRUEBA (solo para ver el diseño funcionando)
   Cuando conectes la base de datos, borra este objeto y usa
   la versión con XMLHttpRequest de consultarEstado().
   Estados usados: "Recibida", "En proceso", "Resuelta"
   ========================================================== */
var DEMO = {
  "CNZ-2026-0001": {tipo:"Petición", asunto:"Cambio de datos de contacto", estado:"Resuelta",
    fecha:"2026-10-02", respuesta:"Tu solicitud fue atendida y los datos quedaron actualizados.", fechaRespuesta:"2026-10-05"},
  "CNZ-2026-0002": {tipo:"Queja", asunto:"Demora en la atención", estado:"En proceso",
    fecha:"2026-10-15", respuesta:"", fechaRespuesta:""},
  "CNZ-2026-0003": {tipo:"Reclamo", asunto:"Cobro duplicado", estado:"Recibida",
    fecha:"2026-10-22", respuesta:"", fechaRespuesta:""}
};

/* ==========================================================
   CONSULTA
   alTerminar(error, datos): datos es null si no existe el radicado.

   Para conectar con NetBeans/MySQL, reemplaza el cuerpo por:

   var xhr = new XMLHttpRequest();
   xhr.open("GET", "ConsultarEstadoServlet?radicado=" + encodeURIComponent(radicado));
   xhr.onload = function(){
     if(xhr.status === 404){ alTerminar(null, null); return; }
     if(xhr.status !== 200){ alTerminar(new Error("servidor"), null); return; }
     alTerminar(null, JSON.parse(xhr.responseText));
   };
   xhr.onerror = function(){ alTerminar(new Error("red"), null); };
   xhr.send();

   El JSON debe tener: tipo, asunto, estado, fecha, respuesta, fechaRespuesta.
   Importante: devuelve SOLO esos campos (sin nombre, correo ni
   documento del solicitante), porque esta consulta es pública.
   ========================================================== */
function consultarEstado(radicado, alTerminar){
  setTimeout(function(){
    alTerminar(null, DEMO[radicado] || null);
  }, 600);
}

var form = document.getElementById("formConsulta");
var input = document.getElementById("radicado");
var errorEl = document.getElementById("errorRadicado");
var resultado = document.getElementById("resultado");
var btn = document.getElementById("btnConsultar");

function esc(s){
  if(s === null || s === undefined){ s = ""; }
  var mapa = {"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"};
  return String(s).replace(/[&<>"']/g, function(c){ return mapa[c]; });
}

function fmtFecha(iso){
  if(!iso){ return "—"; }
  var p = iso.split("-");
  return p[2] + "/" + p[1] + "/" + p[0];
}

function pintarResultado(radicado, d){
  if(!d){
    resultado.innerHTML =
      '<div class="result empty">' +
        '<span class="badge nofound">No encontrado</span>' +
        '<p>No hay ninguna solicitud con el radicado <strong>' + esc(radicado) + '</strong>. ' +
        'Revisa que esté escrito igual que en tu confirmación.</p>' +
      '</div>';
    return;
  }

  var orden = ["Recibida", "En proceso", "Resuelta"];
  var idx = orden.indexOf(d.estado);
  if(idx < 0){ idx = 0; }

  var clases = ["recibida", "proceso", "resuelta"];
  var textos = ["Recibida: sin resolver", "En proceso: sin resolver", "Resuelta"];

  var pasos = "";
  for(var i = 0; i < orden.length; i++){
    var c = "";
    if(i <= idx){ c += "hecho "; }
    if(i === idx){ c += "actual"; }
    pasos += '<li class="' + c + '">' + orden[i] + '</li>';
  }

  var bloqueRespuesta;
  if(d.estado === "Resuelta"){
    bloqueRespuesta =
      '<div class="respuesta"><strong>Respuesta del ' + fmtFecha(d.fechaRespuesta) + '</strong>' +
      (esc(d.respuesta) || "Tu solicitud fue resuelta.") + '</div>';
  } else {
    var titulo = (d.estado === "En proceso") ? "Estamos trabajando en tu solicitud" : "Recibimos tu solicitud";
    bloqueRespuesta =
      '<div class="respuesta"><strong>' + titulo + '</strong>' +
      'Aún no tiene respuesta final. Vuelve a consultar más adelante con el mismo radicado.</div>';
  }

  resultado.innerHTML =
    '<div class="result">' +
      '<div class="result-top">' +
        '<div>' +
          '<div class="radicado-label">Radicado</div>' +
          '<div class="radicado-num">' + esc(radicado) + '</div>' +
        '</div>' +
        '<span class="badge ' + clases[idx] + '">' + textos[idx] + '</span>' +
      '</div>' +
      '<ol class="steps" aria-label="Avance de la solicitud">' + pasos + '</ol>' +
      '<dl class="datos">' +
        '<div><dt>Tipo de solicitud</dt><dd>' + esc(d.tipo) + '</dd></div>' +
        '<div><dt>Fecha de radicación</dt><dd>' + fmtFecha(d.fecha) + '</dd></div>' +
        '<div class="ancho"><dt>Asunto</dt><dd>' + esc(d.asunto) + '</dd></div>' +
      '</dl>' +
      bloqueRespuesta +
      '<div class="result-actions">' +
        '<button type="button" class="btn btn-sec" id="btnOtra">Consultar otro radicado</button>' +
        '<a class="btn" href="nueva-solicitud.html">Nueva solicitud</a>' +
      '</div>' +
    '</div>';

  document.getElementById("btnOtra").addEventListener("click", function(){
    resultado.innerHTML = "";
    input.value = "";
    input.focus();
  });
}

form.addEventListener("submit", function(e){
  e.preventDefault();
  var radicado = input.value.trim().toUpperCase();
  errorEl.textContent = "";
  input.removeAttribute("aria-invalid");
  resultado.innerHTML = "";

  if(!radicado){
    errorEl.textContent = "Escribe tu número de radicado para consultar.";
    input.setAttribute("aria-invalid", "true");
    input.focus();
    return;
  }
  if(!/^[A-Z0-9\-]{4,30}$/.test(radicado)){
    errorEl.textContent = "Usa solo letras, números y guiones (por ejemplo CNZ-2026-0001).";
    input.setAttribute("aria-invalid", "true");
    input.focus();
    return;
  }

  btn.disabled = true;
  btn.textContent = "Consultando…";

  consultarEstado(radicado, function(error, datos){
    btn.disabled = false;
    btn.textContent = "Consultar estado";
    if(error){
      errorEl.textContent = "No pudimos consultar en este momento. Inténtalo de nuevo en unos minutos.";
      return;
    }
    pintarResultado(radicado, datos);
  });
});
</script>
</body>
</html>