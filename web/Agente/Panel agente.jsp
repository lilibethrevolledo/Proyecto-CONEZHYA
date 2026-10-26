<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>CONEZHA · Panel del agente</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<style>
:root{--blue:#15639e;--teal:#13b4a0;--bg:#f4f8f9;--card:#fff;--line:#e3ecef;--text:#10232c;--muted:#5f7480;
--grad:linear-gradient(135deg,#13b4a0,#15639e);--side:linear-gradient(180deg,#0d3a61 0%,#13538c 45%,#14639c 72%,#0f7a91 100%);
--ok-bg:#ddf6f2;--ok:#0d8a7b;--wip-bg:#e1effb;--wip:#15639e;--pen-bg:#eaf0f4;--pen:#4f6676;--danger:#c0334a;
box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
:root{color-scheme:light}
*{box-sizing:border-box}html{scroll-padding-top:env(safe-area-inset-top,0px)}
body{margin:0;font-family:"Plus Jakarta Sans",system-ui,Segoe UI,sans-serif;background:var(--bg);color:var(--text);display:flex;min-height:100vh}
aside{width:258px;background:var(--side);color:#fff;padding:16px 14px;display:flex;flex-direction:column;position:sticky;top:0;height:100vh;transition:margin .25s;flex-shrink:0;overflow:hidden}
body.collapsed aside{margin-left:-258px}
.brand{background:#fff;border-radius:18px;height:80px;margin-bottom:22px;display:flex;align-items:center;justify-content:center;overflow:hidden;flex-shrink:0}
.brand img{width:100%;height:100%;object-fit:contain;display:block}
nav a{display:flex;align-items:center;gap:12px;padding:11px 14px;border-radius:12px;color:#e6f0fa;text-decoration:none;font-weight:600;font-size:15px;margin-bottom:6px;cursor:pointer}
nav a.on,nav a:hover{background:rgba(255,255,255,.16)}
.out{margin-top:auto}
.deco{position:absolute;left:0;bottom:0;width:100%;height:230px;pointer-events:none}
.brand,nav,.out{position:relative;z-index:1}
svg.i{width:18px;height:18px;fill:none;stroke:currentColor;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
main{flex:1;min-width:0}
header{height:64px;background:var(--card);border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;padding:0 28px}
.burger{width:42px;height:42px;border:1px solid var(--line);background:var(--card);color:var(--text);border-radius:10px;cursor:pointer;display:grid;place-items:center}
.me{display:flex;align-items:center;gap:12px;text-align:right}.me b{display:block;font-size:14px}.me span{font-size:12px;color:var(--muted)}
.av{width:38px;height:38px;border-radius:50%;background:var(--grad);color:#fff;display:grid;place-items:center;font-weight:700;font-size:13px;flex-shrink:0}
section{padding:28px}
h1{font-size:30px;margin:0 0 22px;font-weight:800}h2{font-size:20px;margin:30px 0 14px;font-weight:800}
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:16px}
.stat{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px;min-height:92px}
.stat small{font-size:13px;color:var(--muted)}.stat b{display:block;font-size:30px;font-weight:800;margin-top:4px}
.stat.main{background:var(--grad);color:#fff;border:0}.stat.main small{color:#e6fffb}
.tools{display:flex;gap:12px;margin-bottom:16px;flex-wrap:wrap}
input,select,textarea{font:inherit;color:var(--text);background:var(--card);border:1px solid var(--line);border-radius:12px;padding:12px 14px}
.tools input{flex:1;min-width:200px}
.btn{border:0;background:var(--grad);color:#fff;font:inherit;font-weight:700;border-radius:12px;padding:12px 20px;cursor:pointer}
.sm{border:1px solid var(--line);background:var(--card);color:var(--text);font:inherit;font-weight:600;font-size:13px;border-radius:9px;padding:7px 14px;cursor:pointer}
.sm.p{color:var(--blue);border-color:var(--blue)}
.wrap{background:var(--card);border:1px solid var(--line);border-radius:18px;overflow-x:auto}
table{width:100%;border-collapse:collapse;min-width:980px}td:last-child{white-space:nowrap}
th{font-size:12px;letter-spacing:.5px;color:var(--muted);text-align:left;padding:16px 18px;background:#f8fbfc;text-transform:uppercase}
td{padding:14px 18px;border-top:1px solid var(--line);font-size:14px;vertical-align:middle}
.rad{font-weight:700;color:var(--blue)}.u{display:flex;align-items:center;gap:10px;font-weight:700}
.pill{border:0;border-radius:99px;padding:8px 14px;font:inherit;font-weight:700;font-size:13px;cursor:pointer}
.s-Pendiente{background:var(--pen-bg);color:var(--pen)}.s-En-proceso{background:var(--wip-bg);color:var(--wip)}.s-Resuelta{background:var(--ok-bg);color:var(--ok)}
.empty{text-align:center;color:var(--muted);padding:30px}
.modal{position:fixed;inset:0;background:rgba(5,20,35,.55);display:none;place-items:center;padding:16px;z-index:20}
.modal.show{display:grid}
.box{background:var(--card);border-radius:20px;padding:26px;width:100%;max-width:520px;max-height:90vh;overflow:auto}
.box h3{margin:0 0 4px;font-size:20px}.box p{color:var(--muted);margin:4px 0 14px;font-size:14px}
.box .msg{background:var(--bg);border-radius:12px;padding:14px;font-size:14px;margin-bottom:14px}
.box label{font-size:13px;font-weight:700;display:block;margin:10px 0 6px}.box textarea,.box select{width:100%}
.acts{display:flex;justify-content:flex-end;gap:10px;margin-top:18px}
.sm:disabled{opacity:.45;cursor:not-allowed}
a.btn{text-decoration:none;display:inline-block}
.prev{background:var(--bg);border-radius:12px;padding:28px;text-align:center;font-weight:800;font-size:22px;color:var(--blue);margin-bottom:6px}
@media(max-width:900px){.stats{grid-template-columns:1fr 1fr}aside{position:fixed;z-index:10;margin-left:-258px}body:not(.collapsed) aside{margin-left:0}section{padding:18px}header{padding:0 16px}.me div{display:none}}
</style>
</head>
<body class="collapsed">
<aside>
  <svg class="deco" viewBox="0 0 258 230" preserveAspectRatio="xMidYMax slice" aria-hidden="true">
    <path d="M30,230 C62,208 58,166 103,146 S92,96 116,84 S172,76 189,58 S244,46 258,28" fill="none" stroke="#5fe6d4" stroke-opacity=".55" stroke-width="1.3"/>
    <path d="M0,218 C40,196 36,150 80,128 S74,84 98,70" fill="none" stroke="#5fe6d4" stroke-opacity=".25" stroke-width="1"/>
    <g fill="#3fe0cc"><circle cx="58" cy="216" r="3"/><circle cx="103" cy="146" r="3"/><circle cx="116" cy="84" r="3"/><circle cx="189" cy="58" r="3"/><circle cx="257" cy="28" r="3"/></g>
    <g fill="#3fe0cc" fill-opacity=".25"><circle cx="103" cy="146" r="7"/><circle cx="189" cy="58" r="7"/></g>
  </svg>
  <div class="brand"><img src="${pageContext.request.contextPath}/Logo2.jpeg" alt="CONEZHA"></div>
  <nav>
    <a class="on"><svg class="i" viewBox="0 0 24 24"><path d="M3 11l9-8 9 8v10H3z"/></svg>Inicio</a>
    <a><svg class="i" viewBox="0 0 24 24"><path d="M6 3h9l4 4v14H6z"/><path d="M9 12h7M9 16h7"/></svg>Solicitudes</a>
    <a><svg class="i" viewBox="0 0 24 24"><path d="M4 5h16v11H9l-5 4z"/></svg>Conversaciones</a>
    <a><svg class="i" viewBox="0 0 24 24"><path d="M5 20V10M12 20V4M19 20v-7"/></svg>Reportes</a>
    <a><svg class="i" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21c1-5 15-5 16 0"/></svg>Mi perfil</a>
  </nav>
  
<a class="out"
   href="../LogoutServlet"
   style="display:flex;gap:12px;padding:11px 14px;color:#fff;font-weight:600;cursor:pointer;text-decoration:none;">

    <svg class="i" viewBox="0 0 24 24">
        <path d="M9 4H5v16h4M16 8l4 4-4 4M20 12H9"/>
    </svg>

    Cerrar sesión

</a>

</aside>
<main>
  <header>
    <button class="burger" id="burger" aria-label="Menú"><svg class="i" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h16"/></svg></button>
    <div class="me"><div><b>Carmen Roa Lopez</b><span>Agente</span></div><div class="av">CR</div></div>
  </header>
  <section>
    <h1>Inicio</h1>
    <div class="stats">
      <div class="stat main"><small>Solicitudes asignadas</small><b id="n-all">0</b></div>
      <div class="stat"><small>Pendientes</small><b id="n-pen">0</b></div>
      <div class="stat"><small>En proceso</small><b id="n-wip">0</b></div>
      <div class="stat"><small>Resueltas</small><b id="n-ok">0</b></div>
    </div>
    <h2>Gestión de solicitudes</h2>
    <div class="tools">
      <input id="q" placeholder="Buscar por radicado, usuario o asunto">
      <select id="fs"><option value="">Todos los estados</option><option>Pendiente</option><option>En proceso</option><option>Resuelta</option></select>
      <select id="ft"><option value="">Todos los tipos</option><option>Queja</option><option>Reclamo</option><option>Petición</option><option>Sugerencia</option></select>
    </div>
    <div class="wrap"><table>
      <thead><tr><th>Radicado</th><th>Usuario</th><th>Tipo</th><th>Asunto</th><th>Estado</th><th>Fecha</th><th>Acciones</th></tr></thead>
      <tbody id="rows"></tbody>
    </table></div>
  </section>
</main>

<div class="modal" id="modal"><div class="box">
  <h3 id="m-rad"></h3><p id="m-meta"></p>
  <div class="msg" id="m-msg"></div>
  <label for="m-est">Estado de la solicitud</label>
  <select id="m-est"><option>Pendiente</option><option>En proceso</option><option>Resuelta</option></select>
  <label for="m-resp">Respuesta al usuario</label>
  <textarea id="m-resp" rows="4" placeholder="Escribe aquí la respuesta…"></textarea>
  <div class="acts"><button class="sm" id="m-x">Cancelar</button><button class="btn" id="m-ok">Guardar</button></div>
</div></div>

<div class="modal" id="adjm"><div class="box">
  <h3 id="a-name"></h3><p id="a-meta"></p>
  <div class="prev" id="a-prev"></div>
  <div class="acts"><button class="sm" id="a-x">Cerrar</button><a class="btn" id="a-open" target="_blank" rel="noopener">Abrir</a><a class="btn" id="a-dl">Descargar</a></div>
</div></div>

<script>
// Datos de ejemplo: aquí luego se reemplazan por los que vengan de MySQL (SolicitudesServlet)
var data=[
{r:"CNZ4821A",u:"Luisa Martinez Torres",t:"Queja",a:"Demora en la atención",m:"Llevo tres días esperando respuesta a mi caso anterior.",e:"Pendiente",f:"2026-10-22",adj:"captura_demora.png"},
{r:"CNZ3910B",u:"Miguel Ramirez Rodriguez",t:"Reclamo",a:"Cobro duplicado",m:"Me aparece el mismo cobro dos veces en mi cuenta.",e:"En proceso",f:"2026-10-21",adj:"factura_cobro.pdf"},
{r:"CNZ7742C",u:"Carlos Marcos Pérez",t:"Petición",a:"Actualización de datos",m:"Solicito actualizar mi número de celular.",e:"Pendiente",f:"2026-10-20"},
{r:"CNZ1205D",u:"Ana Gómez Díaz",t:"Sugerencia",a:"Mejorar el chat",m:"Sería útil poder adjuntar imágenes en las conversaciones.",e:"Resuelta",f:"2026-10-18",adj:"sugerencia_chat.jpg"},
{r:"CNZ5568E",u:"Luisa Martinez Torres",t:"Petición",a:"Certificado de servicio",m:"Necesito un certificado de mi último servicio.",e:"En proceso",f:"2026-10-17",adj:"certificado_anterior.pdf"}];
var cur=null,$=function(i){return document.getElementById(i)};
function ini(n){return n.split(" ").slice(0,2).map(function(w){return w[0]}).join("").toUpperCase()}
function esc(s){var d=document.createElement("div");d.textContent=s;return d.innerHTML}
function cls(e){return "s-"+e.replace(" ","-")}
function render(){
  var q=$("q").value.toLowerCase(),fs=$("fs").value,ft=$("ft").value,h="";
  data.forEach(function(x,i){
    if(fs&&x.e!==fs||ft&&x.t!==ft)return;
    if(q&&(x.r+x.u+x.a).toLowerCase().indexOf(q)<0)return;
    h+='<tr><td class="rad">'+x.r+'</td><td><div class="u"><div class="av">'+ini(x.u)+'</div>'+esc(x.u)+'</div></td><td>'+x.t+'</td><td>'+esc(x.a)+
    '</td><td><select class="pill '+cls(x.e)+'" data-i="'+i+'">'+["Pendiente","En proceso","Resuelta"].map(function(o){return '<option'+(o===x.e?' selected':'')+'>'+o+'</option>'}).join("")+
    '</select></td><td>'+x.f+'</td><td><button class="sm" data-v="'+i+'">Ver</button> <button class="sm p" data-v="'+i+'">Responder</button> <button class="sm" data-a="'+i+'"'+(x.adj?'':' disabled title="Sin archivo adjunto"')+'>Adjunto</button></td></tr>';
  });
  $("rows").innerHTML=h||'<tr><td colspan="7" class="empty">No hay solicitudes con esos filtros.</td></tr>';
  var c=function(e){return data.filter(function(x){return x.e===e}).length};
  $("n-all").textContent=data.length;$("n-pen").textContent=c("Pendiente");$("n-wip").textContent=c("En proceso");$("n-ok").textContent=c("Resuelta");
}
$("rows").addEventListener("change",function(ev){if(ev.target.dataset.i){data[ev.target.dataset.i].e=ev.target.value;render()}});
$("rows").addEventListener("click",function(ev){var a=ev.target.dataset.a;if(a!==undefined){openAdj(+a);return}var v=ev.target.dataset.v;if(v===undefined)return;
  cur=+v;var x=data[cur];$("m-rad").textContent="Solicitud "+x.r;$("m-meta").textContent=x.t+" · "+x.u+" · "+x.f;
  $("m-msg").textContent=x.a+" — "+x.m;$("m-est").value=x.e;$("m-resp").value="";$("modal").classList.add("show")});
$("m-x").onclick=function(){$("modal").classList.remove("show")};
$("m-ok").onclick=function(){data[cur].e=$("m-est").value;$("modal").classList.remove("show");render()};
["q","fs","ft"].forEach(function(i){$(i).addEventListener("input",render)});
var RUTA="uploads/"; // carpeta donde se guardan los adjuntos del servidor
function openAdj(i){var x=data[i],n=x.adj,ext=n.split(".").pop().toLowerCase(),url=RUTA+encodeURIComponent(n),p=$("a-prev");
  $("a-name").textContent=n;$("a-meta").textContent="Solicitud "+x.r+" · enviado por "+x.u;p.textContent=ext.toUpperCase();
  if(["png","jpg","jpeg","gif","webp"].indexOf(ext)>-1){var im=new Image();im.alt="";im.style.cssText="max-width:100%;border-radius:10px";im.onload=function(){p.textContent="";p.appendChild(im)};im.src=url}
  $("a-open").href=url;$("a-dl").href=url;$("a-dl").setAttribute("download",n);$("adjm").classList.add("show")}
$("a-x").onclick=function(){$("adjm").classList.remove("show")};
$("burger").onclick=function(){document.body.classList.toggle("collapsed")};
if(window.innerWidth>900)document.body.classList.remove("collapsed");
render();
</script>
</body>
</html>