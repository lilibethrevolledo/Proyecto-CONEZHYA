
<!DOCTYPE html>
<html lang="es">
<head>
    <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CONEZHYA | Panel</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Sora:wght@600;700&display=swap" rel="stylesheet">

<style>
/* =========================================================
   CONEZHA · Panel del usuario
   Paleta: navy #0a1f44 · azul #2f6bef · degradado teal→azul
   ========================================================= */
:root{
  --navy:#0a1f44;
  --navy-soft:#12305f;
  --blue:#2f6bef;
  --teal:#14b8a6;
  --azul:#1e5aa0;
  --mint:#5eead4;
  --grad:linear-gradient(135deg,#14b8a6 0%,#1e5aa0 100%);
  --bg:#f3f5f9;
  --white:#fff;
  --text:#0f1f3a;
  --muted:#64748b;
  --line:#e6ebf2;
  --side:264px;
  --side-min:84px;
  --radius:16px;
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--text);line-height:1.5}
a{color:inherit;text-decoration:none}
button{font-family:inherit;border:0;cursor:pointer;background:none;color:inherit}
svg.i{width:20px;height:20px;flex:none;fill:none;stroke:currentColor;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
:focus-visible{outline:2px solid var(--teal);outline-offset:2px}

/* ---------- Estructura general ---------- */
.app{display:grid;grid-template-columns:var(--side) 1fr;min-height:100vh;transition:grid-template-columns .25s ease}
body.collapsed .app{grid-template-columns:var(--side-min) 1fr}

/* ---------- Barra lateral ---------- */
.sidebar{position:sticky;top:0;height:100vh;background:var(--navy);color:#cbd5ea;display:flex;flex-direction:column;overflow:hidden;z-index:40}
.brand{padding:20px 16px;border-bottom:1px solid rgba(255,255,255,.08)}
.logo{display:flex;align-items:center;gap:10px;background:#fff;border-radius:12px;padding:10px 12px;min-height:56px}
.logo .mark{width:34px;height:34px;border-radius:10px;background:var(--grad);display:grid;place-items:center;flex:none}
.logo .mark svg{width:20px;height:20px;fill:none;stroke:#fff;stroke-width:2.2;stroke-linecap:round;stroke-linejoin:round}
.logo b{display:block;font-family:'Sora',sans-serif;font-size:17px;letter-spacing:.2px;color:var(--navy);line-height:1.1}
.logo small{display:block;font-size:9px;color:var(--azul);white-space:nowrap}
.logo img{display:block;max-height:40px;max-width:100%;margin:0 auto}
.logo-fallback{align-items:center;gap:10px}
body.collapsed .logo img{display:none}
body.collapsed .logo-fallback{display:flex!important}

.menu{flex:1;padding:18px 12px;display:flex;flex-direction:column;gap:4px;overflow-y:auto}
.item{display:flex;align-items:center;gap:14px;width:100%;padding:13px 16px;border-radius:12px;font-size:15px;font-weight:500;color:#cbd5ea;text-align:left;white-space:nowrap;transition:background .15s,color .15s}
.item:hover{background:rgba(255,255,255,.07);color:#fff}
.item.active{background:var(--blue);color:#fff;box-shadow:0 6px 16px rgba(47,107,239,.35)}
.item .i{opacity:.95}
.divider{height:1px;background:rgba(255,255,255,.09);margin:12px 6px}
.side-foot{padding:16px 18px;border-top:1px solid rgba(255,255,255,.08);font-size:12px;color:#7f93b8;line-height:1.4}

/* Barra plegada (computador) */
body.collapsed .item{justify-content:center;padding:13px 0}
body.collapsed .item span,body.collapsed .side-foot,body.collapsed .logo div{display:none}
body.collapsed .logo{justify-content:center;padding:10px 0}

/* ---------- Zona principal ---------- */
.main{min-width:0;display:flex;flex-direction:column}
.topbar{position:sticky;top:0;z-index:30;height:72px;background:#fff;border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;gap:16px;padding:0 28px}
.top-left{display:flex;align-items:center;gap:14px;min-width:0}
.burger{width:44px;height:44px;border-radius:12px;display:grid;place-items:center;color:var(--navy);transition:background .15s}
.burger:hover{background:var(--bg)}
.burger .i{width:24px;height:24px}
.page-title{font-family:'Sora',sans-serif;font-size:20px;font-weight:700;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}

.user-chip{display:flex;align-items:center;gap:12px;padding:6px 8px 6px 16px;border:1px solid var(--line);border-radius:999px;background:#fff}
.user-chip .who{text-align:right;line-height:1.2}
.user-chip .who b{display:block;font-size:14px;font-weight:600}
.user-chip .who small{display:flex;align-items:center;justify-content:flex-end;gap:6px;color:var(--muted);font-size:12px}
.user-chip .who small::before{content:"";width:8px;height:8px;border-radius:50%;background:#22c55e}
.avatar{width:42px;height:42px;border-radius:50%;background:var(--grad);color:#fff;display:grid;place-items:center;font-family:'Sora',sans-serif;font-weight:700;font-size:14px;flex:none}

.content{width:100%;max-width:1180px;margin:0 auto;padding:30px 28px 48px}
.view{display:none}
.view.show{display:block}
.view-head{margin-bottom:24px}
.view-head h2{font-family:'Sora',sans-serif;font-size:26px;line-height:1.2}
.view-head p{color:var(--muted);margin-top:6px}

/* ---------- Tarjetas ---------- */
.card{background:#fff;border:1px solid var(--line);border-radius:var(--radius);box-shadow:0 2px 10px rgba(15,31,58,.04)}
.card-pad{padding:24px}
.card-head{display:flex;align-items:center;justify-content:space-between;gap:12px;padding:20px 24px;border-bottom:1px solid var(--line)}
.card-head h3{font-family:'Sora',sans-serif;font-size:17px}
.link{color:var(--azul);font-weight:600;font-size:14px}
.link:hover{text-decoration:underline}

.hero{position:relative;overflow:hidden;border:0;color:#fff;padding:36px;background:linear-gradient(135deg,#0a1f44 0%,#14407a 55%,#1b7a94 100%);margin-bottom:22px}
.hero svg.waves{position:absolute;inset:0;width:100%;height:100%;opacity:.55;pointer-events:none}
.hero-body{position:relative;max-width:560px}
.hero h2{font-family:'Sora',sans-serif;font-size:28px;line-height:1.2;margin-bottom:10px}
.hero p{color:#d3e2f6;margin-bottom:22px}

.btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:13px 28px;border-radius:12px;background:var(--grad);color:#fff;font-weight:600;font-size:15px;transition:filter .15s,transform .15s}
.btn:hover{filter:brightness(1.08)}
.btn:active{transform:scale(.98)}
.btn.white{background:#fff;color:var(--navy)}

.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:22px}
.stat{display:flex;align-items:center;gap:16px;padding:20px}
.stat .ico{width:48px;height:48px;border-radius:14px;display:grid;place-items:center;flex:none}
.stat .ico.a{background:#dbe7ff;color:var(--blue)}
.stat .ico.b{background:#fff2d6;color:#b46f00}
.stat .ico.c{background:#d9f5f0;color:#0b7a6e}
.stat .ico.d{background:#ece3ff;color:#6b3fd1}
.stat b{display:block;font-family:'Sora',sans-serif;font-size:26px;line-height:1.1}
.stat span{color:var(--muted);font-size:13px}



/* ---------- Inicio: actividad y resumen ---------- */
.grid2{display:grid;grid-template-columns:1.5fr 1fr;gap:16px;align-items:start}
.side-col{display:grid;gap:16px}
.muted{color:var(--muted);font-size:13px}
.mini-title{font-family:'Sora',sans-serif;font-size:16px;margin-bottom:14px}
.timeline{list-style:none;padding:6px 24px}
.timeline li{display:grid;grid-template-columns:14px 1fr auto;gap:14px;align-items:start;padding:16px 0;border-bottom:1px solid var(--line)}
.timeline li:last-child{border:0}
.timeline .dot{width:10px;height:10px;border-radius:50%;margin-top:6px}
.dot.ok{background:#14b8a6}.dot.pro{background:#2f6bef}.dot.pen{background:#f5a524}.dot.new{background:#8b5cf6}
.timeline b{display:block;font-size:14px}
.timeline span{display:block;color:var(--muted);font-size:13px}
.timeline time{color:var(--muted);font-size:12px;white-space:nowrap}
.bar{margin-bottom:14px}
.bar:last-child{margin-bottom:0}
.bar-top{display:flex;justify-content:space-between;font-size:14px;margin-bottom:6px}
.track{height:8px;border-radius:99px;background:var(--bg);overflow:hidden}
.track i{display:block;height:100%;border-radius:99px}
.notice{background:linear-gradient(135deg,#eaf6f5,#eaf1ff);border-color:#d6e8ee}
.notice p{font-size:14px}
.notice p+p{margin-top:6px}

/* ---------- Tabla ---------- */
.table-wrap{overflow-x:auto}
table{width:100%;border-collapse:collapse;font-size:14px;min-width:620px}
th,td{padding:15px 24px;text-align:left;border-bottom:1px solid var(--line);white-space:nowrap}
th{font-size:13px;font-weight:600;color:var(--muted);background:#f8fafc}
tbody tr{transition:background .15s}
tbody tr:hover{background:#eaf1ff}
.tag{display:inline-block;padding:4px 12px;border-radius:999px;font-size:12px;font-weight:600}
.tag.ok{background:#d9f5f0;color:#0b7a6e}
.tag.pro{background:#dbe7ff;color:#1e4fb8}
.tag.pen{background:#fff2d6;color:#9a6200}
.table-foot{padding:16px 24px}

.banner{position:relative;overflow:hidden;margin-top:22px;padding:24px;border-radius:var(--radius);color:#fff;display:flex;align-items:center;gap:16px;background:linear-gradient(135deg,#0a1f44,#1e5aa0)}
.banner .check{width:44px;height:44px;border-radius:50%;background:rgba(255,255,255,.18);display:grid;place-items:center;flex:none}
.banner b{display:block}
.banner span{color:#cfe0f5;font-size:14px}

/* ---------- Formulario ---------- */
.form{display:grid;gap:18px}
.form .row{display:grid;grid-template-columns:1fr 1fr;gap:18px}
label{display:block;font-size:14px;font-weight:600;margin-bottom:6px}
input,select,textarea{width:100%;padding:13px 14px;border:1px solid #d3dae6;border-radius:12px;font:inherit;font-size:15px;background:#fff;color:var(--text)}
input:focus,select:focus,textarea:focus{outline:2px solid var(--teal);border-color:transparent}
textarea{min-height:130px;resize:vertical}
input[type=file]{padding:10px;background:#f8fafc}
.form .btn{justify-self:start}

/* ---------- Conversaciones ---------- */
.chat{display:flex;flex-direction:column;gap:12px;padding:24px;min-height:260px}
.msg{max-width:75%;padding:12px 16px;border-radius:16px;font-size:14px}
.msg.in{background:var(--bg);border-bottom-left-radius:4px;align-self:flex-start}
.msg.out{background:var(--blue);color:#fff;border-bottom-right-radius:4px;align-self:flex-end}
.compose{display:flex;gap:10px;padding:16px 24px;border-top:1px solid var(--line)}
.compose .btn{padding:12px 24px}

/* ---------- Perfil / Ayuda ---------- */
.profile-top{display:flex;align-items:center;gap:18px;padding:24px;border-bottom:1px solid var(--line)}
.profile-top .avatar{width:68px;height:68px;font-size:22px}
.profile-top b{font-family:'Sora',sans-serif;font-size:20px;display:block}
.profile-top span{color:var(--muted)}
.data{display:grid;grid-template-columns:1fr 1fr;gap:0}
.data div{padding:18px 24px;border-bottom:1px solid var(--line)}
.data span{display:block;font-size:13px;color:var(--muted)}
.data b{font-weight:600}
.faq{padding:8px 24px}
.faq details{border-bottom:1px solid var(--line);padding:16px 0}
.faq details:last-child{border:0}
.faq summary{cursor:pointer;font-weight:600;list-style:none;display:flex;justify-content:space-between;gap:12px}
.faq summary::after{content:"+";color:var(--azul);font-size:20px;line-height:1}
.faq details[open] summary::after{content:"–"}
.faq p{color:var(--muted);margin-top:10px;font-size:14px}

.overlay{display:none}

/* ---------- Tablet / celular ---------- */
@media (max-width:1000px){
  .stats{grid-template-columns:repeat(2,1fr)}
  .grid2{grid-template-columns:1fr}
}
@media (max-width:860px){
  .app,body.collapsed .app{grid-template-columns:1fr}
  .sidebar{position:fixed;inset:0 auto 0 0;width:var(--side);transform:translateX(-100%);transition:transform .25s ease;box-shadow:none}
  body.open .sidebar{transform:none;box-shadow:12px 0 40px rgba(0,0,0,.35)}
  body.open .overlay{display:block;position:fixed;inset:0;background:rgba(5,15,35,.55);z-index:35}
  body.collapsed .item{justify-content:flex-start;padding:13px 16px}
  body.collapsed .item span,body.collapsed .side-foot,body.collapsed .logo div{display:block}
  body.collapsed .logo{justify-content:flex-start;padding:10px 12px}
  .topbar{padding:0 16px}
  .content{padding:22px 16px 40px}
  .user-chip .who{display:none}
  .user-chip{padding:4px}
  .hero{padding:26px}
  .form .row,.data{grid-template-columns:1fr}
}
@media (max-width:480px){
  .stats{grid-template-columns:1fr}
}
@media (prefers-reduced-motion:reduce){*{transition:none!important}}
</style>
</head>

<body>
<div class="app">

  <!-- ================= BARRA LATERAL ================= -->
  <aside class="sidebar" id="sidebar">
    <div class="brand">
      <div class="logo">
        <img src="<%= request.getContextPath() %>/Logo2.jpeg" alt="Logo de CONEZHYA">
      </div>
    </div>

    <nav class="menu">
      <button class="item active" data-view="inicio" title="Inicio">
        <svg class="i" viewBox="0 0 24 24"><path d="M3 11l9-8 9 8"/><path d="M5 10v10h14V10"/><path d="M10 20v-6h4v6"/></svg><span>Inicio</span>
      </button>
      
<a class="item"
   href="${pageContext.request.contextPath}/usuario/Mis%20solicitudes.jsp"
   title="Mis solicitudes">

    <svg class="i" viewBox="0 0 24 24">
        <path d="M9 4h6a1 1 0 011 1v1H8V5a1 1 0 011-1z"/>
        <path d="M8 6H6a1 1 0 00-1 1v13a1 1 0 001 1h12a1 1 0 001-1V7a1 1 0 00-1-1h-2"/>
        <path d="M9 12h6M9 16h6"/>
    </svg>

    <span>Mis solicitudes</span>

</a>

      
<a class="item"
   href="${pageContext.request.contextPath}/usuario/Nueva%20solicitud.jsp"
   title="Nueva solicitud">

    <svg class="i" viewBox="0 0 24 24">
        <circle cx="12" cy="12" r="9"/>
        <path d="M12 8v8M8 12h8"/>
    </svg>

    <span>Nueva solicitud</span>

</a>

      <button class="item" data-view="conversaciones" title="Mis conversaciones">
        <svg class="i" viewBox="0 0 24 24"><path d="M21 12a8 8 0 01-11.6 7.1L4 20l1-4.6A8 8 0 1121 12z"/></svg><span>Mis conversaciones</span>
      </button>
     
<a class="item"
   href="${pageContext.request.contextPath}/Perfil.jsp"
   title="Mi perfil">

    <svg class="i" viewBox="0 0 24 24">
        <circle cx="12" cy="8" r="4"/>
        <path d="M4 21a8 8 0 0116 0"/>
    </svg>

    <span>Mi perfil</span>

</a>

     
<a class="item"
   href="${pageContext.request.contextPath}/usuario/Ayuda.jsp"
   title="Ayuda">

    <svg class="i" viewBox="0 0 24 24">
        <circle cx="12" cy="12" r="9"/>
        <path d="M9.5 9.5a2.5 2.5 0 114 2c-.9.6-1.5 1.1-1.5 2.2"/>
        <path d="M12 17.5h.01"/>
    </svg>

    <span>Ayuda</span>

</a>

      <div class="divider"></div>

      <a class="item" href="${pageContext.request.contextPath}/LogoutServlet" title="Cerrar sesión">
        <svg class="i" viewBox="0 0 24 24"><path d="M15 4h3a2 2 0 012 2v12a2 2 0 01-2 2h-3"/><path d="M10 17l-5-5 5-5"/><path d="M5 12h11"/></svg><span>Cerrar sesión</span>
      </a>
    </nav>

    <div class="side-foot">Conexión que soluciona,<br>excelencia que sorprende.</div>
  </aside>
  <div class="overlay" id="overlay"></div>

  <!-- ================= ZONA PRINCIPAL ================= -->
  <div class="main">

    <header class="topbar">
      <div class="top-left">
        <button class="burger" id="burger" aria-label="Mostrar u ocultar el menú">
          <svg class="i" viewBox="0 0 24 24"><path d="M4 6h16M4 12h16M4 18h16"/></svg>
        </button>
        <h1 class="page-title" id="pageTitle">Inicio</h1>
      </div>

      <!-- Usuario activo (arriba a la derecha) -->
      <div class="user-chip">
        <div class="who"><b id="userName">Usuario</b><small>Sesión activa</small></div>
        <div class="avatar" id="userAvatar">CN</div>
      </div>
    </header>

    <main class="content">

      <!-- ===== INICIO ===== -->
      <section class="view show" id="inicio">
        <div class="card hero">
          <svg class="waves" viewBox="0 0 800 260" preserveAspectRatio="none" aria-hidden="true">
            <path d="M0 200 C120 150 220 230 340 190 S560 120 800 170" fill="none" stroke="#5eead4" stroke-opacity=".5" stroke-width="1.5"/>
            <path d="M0 80 C140 40 260 110 400 70 S640 30 800 60" fill="none" stroke="#5eead4" stroke-opacity=".35" stroke-width="1.5"/>
            <circle cx="340" cy="190" r="5" fill="#5eead4"/><circle cx="560" cy="135" r="4" fill="#5eead4"/><circle cx="400" cy="70" r="4" fill="#5eead4"/><circle cx="780" cy="165" r="5" fill="#5eead4"/>
          </svg>
          <div class="hero-body">
            <h2>¡Hola, <span class="firstName">Usuario</span>!</h2>
            
          </div>
        </div>

        <div class="stats">
          <div class="card stat"><div class="ico a"><svg class="i" viewBox="0 0 24 24"><path d="M9 4h6a1 1 0 011 1v1H8V5a1 1 0 011-1z"/><path d="M8 6H6a1 1 0 00-1 1v13a1 1 0 001 1h12a1 1 0 001-1V7a1 1 0 00-1-1h-2"/></svg></div><div><b>4</b><span>Solicitudes</span></div></div>
          <div class="card stat"><div class="ico b"><svg class="i" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg></div><div><b>2</b><span>En proceso</span></div></div>
          <div class="card stat"><div class="ico c"><svg class="i" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M8 12.5l3 3 5-6"/></svg></div><div><b>1</b><span>Resueltas</span></div></div>
         
        </div>

        <div class="grid2">
          <div class="card">
            <div class="card-head"><h3>Actividad reciente</h3></div>
            <ul class="timeline">
              <li><i class="dot pro"></i><div><b>RAD-0004 pasó a "En proceso"</b><span>Tu solicitud "Actualizar mis datos" está siendo revisada.</span></div><time>Hace 2 días</time></li>
              <li><i class="dot new"></i><div><b>Soporte respondió tu mensaje</b><span>Tienes 3 mensajes nuevos en tus conversaciones.</span></div><time>Hace 3 días</time></li>
              <li><i class="dot pen"></i><div><b>RAD-0003 quedó pendiente</b><span>Estamos esperando más información para continuar.</span></div><time>15/10/2026</time></li>
              <li><i class="dot ok"></i><div><b>RAD-0001 fue resuelta</b><span>"No puedo ingresar a mi cuenta" se cerró con éxito.</span></div><time>02/10/2026</time></li>
            </ul>
          </div>

          <div class="side-col">
            <div class="card card-pad">
              <h3 class="mini-title">Solicitudes por estado</h3>
              <div class="bar"><div class="bar-top"><span>Resueltas</span><b>1</b></div><div class="track"><i style="width:25%;background:#14b8a6"></i></div></div>
              <div class="bar"><div class="bar-top"><span>En proceso</span><b>2</b></div><div class="track"><i style="width:50%;background:#2f6bef"></i></div></div>
              <div class="bar"><div class="bar-top"><span>Pendientes</span><b>1</b></div><div class="track"><i style="width:25%;background:#f5a524"></i></div></div>
            </div>
            <div class="card card-pad notice">
              <h3 class="mini-title">Horario de atención</h3>
              <p>Lunes a viernes, de 8:00 a. m. a 6:00 p. m.</p>
              <p class="muted">Los mensajes enviados fuera de horario se responden el siguiente día hábil.</p>
            </div>
          </div>
        </div>
      </section>

      

      

      
        </div>
      </section>

    </main>
  </div>
</div>

<script>
  /* ====== DATOS DEL USUARIO ACTIVO ======
     Cambia estos tres valores por los del usuario que inició sesión. */
  const nombre   = "Carlos Marcos";
  const apellido = "Pinilla Pimienta";
  const correo   = "CarlosP456@hotmail.com";

  const completo  = (nombre + " " + apellido).trim() || "Usuario";
  const iniciales = ((nombre[0] || "") + (apellido[0] || "")).toUpperCase() || "CN";
  const poner = (sel, txt) => document.querySelectorAll(sel).forEach(e => e.textContent = txt);

  poner('#userName', completo);
  poner('#userAvatar', iniciales);
  poner('.pAvatar', iniciales);
  poner('.pCompleto', completo);
  poner('.firstName', nombre.split(" ")[0] || "Usuario");
  poner('.pNombre', nombre || "-");
  poner('.pApellido', apellido || "-");
  poner('.pCorreo', correo || "-");

  /* ====== BARRA LATERAL (tres rayitas) ====== */
  const body = document.body;
  const esMovil = () => window.matchMedia('(max-width:860px)').matches;
  document.getElementById('burger').addEventListener('click', () => {
    if (esMovil()) body.classList.toggle('open');
    else body.classList.toggle('collapsed');
  });
  document.getElementById('overlay').addEventListener('click', () => body.classList.remove('open'));

  /* ====== CAMBIO DE SECCIONES ====== */
 

  /* ====== CHAT DE DEMOSTRACIÓN ====== */
  function enviarMsg(e){
    e.preventDefault();
    const input = document.getElementById('msgText');
    if (!input.value.trim()) return;
    const m = document.createElement('div');
    m.className = 'msg out';
    m.textContent = input.value;
    document.getElementById('chat').appendChild(m);
    input.value = '';
  }
</script>
</body>
</html>