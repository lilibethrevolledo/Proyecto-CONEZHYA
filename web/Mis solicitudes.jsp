<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHA - Mis solicitudes</title>
<style>
  :root{
    --navy-dark:#0c1f3f;
    --navy:#0f2a52;
    --navy-light:#15366a;
    --blue-accent:#2f6fed;
    --teal:#16b8a6;
    --gradient:linear-gradient(135deg,#1c3f7a 0%,#16b8a6 100%);
    --bg:#f3f5f9;
    --text-dark:#0c1f3f;
    --text-muted:#6b7686;
    --border:#e2e6ee;
    --pending:#e07a1f;
    --solved:#1fa672;
    --white:#ffffff;
  }
  *{box-sizing:border-box;margin:0;padding:0;}
  body{
    font-family:'Segoe UI',Arial,sans-serif;
    background:var(--bg);
    color:var(--text-dark);
    display:flex;
    min-height:100vh;
  }

  /* SIDEBAR */
  .sidebar{
    width:250px;
    background:var(--navy-dark);
    color:#cfd8ea;
    display:flex;
    flex-direction:column;
    flex-shrink:0;
  }
  .brand{
    display:flex;
    align-items:center;
    gap:10px;
    padding:22px 20px;
    font-size:20px;
    font-weight:700;
    color:var(--white);
    border-bottom:1px solid rgba(255,255,255,0.08);
  }
  .brand-icon{
    width:30px;height:30px;
    border-radius:8px;
    background:var(--gradient);
    display:flex;align-items:center;justify-content:center;
    font-size:14px;
  }
  .nav{
    flex:1;
    padding:16px 10px;
    display:flex;
    flex-direction:column;
    gap:4px;
  }
  .nav a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:11px 14px;
    border-radius:8px;
    color:#b9c4dc;
    text-decoration:none;
    font-size:14.5px;
    transition:background .15s ease, color .15s ease;
  }
  .nav a:hover{background:rgba(255,255,255,0.06);color:var(--white);}
  .nav a.active{
    background:var(--blue-accent);
    color:var(--white);
    font-weight:600;
  }
  .nav .icon{width:18px;text-align:center;}
  .logout{
    padding:16px 20px 22px;
    border-top:1px solid rgba(255,255,255,0.08);
  }
  .logout a{
    display:flex;align-items:center;gap:10px;
    color:#b9c4dc;text-decoration:none;font-size:14.5px;
  }
  .logout a:hover{color:var(--white);}

  /* MAIN */
  .main{
    flex:1;
    display:flex;
    flex-direction:column;
    min-width:0;
  }
  .topbar{
    background:var(--white);
    border-bottom:1px solid var(--border);
    padding:18px 32px;
    display:flex;
    align-items:center;
    justify-content:space-between;
  }
  .topbar h1{
    font-size:19px;
    letter-spacing:.3px;
    color:var(--navy-dark);
  }
  .topbar-left{display:flex;align-items:center;gap:16px;}
  .menu-btn{
    width:32px;height:32px;
    border:none;background:transparent;
    display:flex;align-items:center;justify-content:center;
    color:var(--navy-dark);cursor:pointer;
  }
  .logout-btn{
    display:flex;
    align-items:center;
    gap:8px;
    background:var(--gradient);
    color:var(--white);
    border:none;
    padding:10px 22px;
    border-radius:24px;
    font-size:13.5px;
    font-weight:600;
    cursor:pointer;
    transition:opacity .15s ease;
  }
  .logout-btn:hover{opacity:.9;}
  .logout-btn .icon{font-size:14px;}

  .content{
    padding:32px;
    flex:1;
  }

  .panel{
    background:var(--white);
    border:1px solid var(--border);
    border-radius:14px;
    overflow:hidden;
  }
  .panel-header{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:18px 22px;
    border-bottom:1px solid var(--border);
  }
  .panel-header h2{
    font-size:15px;
    color:var(--navy-dark);
  }
  .filters{
    display:flex;
    gap:10px;
  }
  .filters select, .filters input{
    border:1px solid var(--border);
    border-radius:20px;
    padding:7px 14px;
    font-size:13px;
    color:var(--text-dark);
    background:var(--white);
  }

  table{
    width:100%;
    border-collapse:collapse;
  }
  thead th{
    background:#eef2f9;
    text-align:left;
    font-size:12.5px;
    text-transform:none;
    color:var(--navy-dark);
    font-weight:700;
    padding:12px 18px;
    border-bottom:1px solid var(--border);
  }
  tbody td{
    padding:14px 18px;
    font-size:13.5px;
    border-bottom:1px solid var(--border);
    color:var(--text-dark);
  }
  tbody tr:hover{background:#f5f8fd;}
  tbody tr.selected{background:#dbe8fd;}
  .rodicado{color:var(--blue-accent);font-weight:600;}

  .status{
    display:inline-flex;
    align-items:center;
    gap:6px;
    padding:4px 12px;
    border-radius:20px;
    font-size:12.5px;
    font-weight:600;
  }
  .status::before{
    content:"";
    width:7px;height:7px;
    border-radius:50%;
  }
  .status.pendiente{color:var(--pending);background:#fdf1e4;}
  .status.pendiente::before{background:var(--pending);}
  .status.solucionado{color:var(--solved);background:#e7f7f0;}
  .status.solucionado::before{background:var(--solved);}

  .panel-footer{
    padding:16px 22px;
  }
  .panel-footer a{
    color:var(--blue-accent);
    font-size:13.5px;
    text-decoration:underline;
    font-weight:500;
  }

  .feedback{
    position:relative;
    margin-top:26px;
    background:linear-gradient(135deg,#0c1f3f 0%,#1c3f7a 55%,#16b8a6 100%);
    border-radius:14px;
    padding:22px 28px;
    display:flex;
    align-items:flex-start;
    gap:16px;
    color:var(--white);
    overflow:hidden;
    isolation:isolate;
  }
  .feedback .decor{
    position:absolute;
    inset:0;
    width:100%;
    height:100%;
    z-index:0;
    opacity:.9;
    pointer-events:none;
  }
  .feedback .check{
    position:relative;
    z-index:1;
    width:30px;height:30px;
    border-radius:50%;
    background:rgba(255,255,255,0.2);
    display:flex;align-items:center;justify-content:center;
    flex-shrink:0;
    font-size:15px;
  }
  .feedback p{position:relative;z-index:1;font-size:13.5px;line-height:1.5;}
  .feedback strong{display:block;font-size:14.5px;margin-bottom:4px;}

  /* SIDEBAR COLAPSADO */
  .sidebar.collapsed{
    width:74px;
  }
  .sidebar.collapsed .brand span,
  .sidebar.collapsed .nav a span.label,
  .sidebar.collapsed .logout a span.label{
    display:none;
  }
  .sidebar.collapsed .brand{
    justify-content:center;
    padding:22px 0;
  }
  .sidebar.collapsed .brand img{
  display:none;
}
  .sidebar.collapsed .nav a,
  .sidebar.collapsed .logout a{
    justify-content:center;
    padding:11px 0;
  }

  .empty-state{
    padding:48px 20px;
    text-align:center;
    color:var(--text-muted);
    display:none;
  }
</style>
</head>
<body>

  <aside class="sidebar" id="sidebar">
    <div class="brand">
       <img src="Logo2.jpeg" alt="Conezha"
        style="width:210px !important; height:auto !important; max-width:210px !important;">
    </div>
    <nav class="nav">
      <a href="#"><span class="icon">&#8962;</span><span class="label">Inicio</span></a>
      <a href="#" class="active"><span class="icon">&#9776;</span><span class="label">Mis solicitudes</span></a>
      <a href="#"><span class="icon">&#65291;</span><span class="label">Nueva solicitud</span></a>
      
      <a href="#"><span class="icon">&#128172;</span><span class="label">Mis conversaciones</span></a>
      <a href="#"><span class="icon">&#128276;</span><span class="label">Notificaciones</span></a>
      <a href="#"><span class="icon">&#128100;</span><span class="label">Mi perfil</span></a>
      <a href="#"><span class="icon">&#63;</span><span class="label">Ayuda</span></a>
    </nav>
    <div class="logout">
      
    </div>
  </aside>

  <div class="main">
    <header class="topbar">
      <div class="topbar-left">
        <button class="menu-btn" id="menuToggle">&#9776;</button>
        <h1>MIS SOLICITUDES</h1>
      </div>
     
      <button type="button" class="logout-btn" id="Logoutbtn" onclick="window.location.href='pagina principal.jsp'">Cerrar Sesión</button>
    </header>

    <div class="content">
      <section class="panel">
        <div class="panel-header">
          <h2>Historial de solicitudes</h2>
          <div class="filters">
            <select>
              <option>Todos los estados</option>
              <option>Pendiente</option>
              <option>Solucionado</option>
            </select>
            <input type="text" placeholder="Buscar por radicado...">
          </div>
        </div>

        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>Radicado</th>
              <th>Tipo</th>
              <th>Asunto</th>
              <th>Estado</th>
              <th>Fecha</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td class="rodicado">CNZ-2026-0064</td>
              <td>Petición</td>
              <td>Información sobre facturación</td>
              <td><span class="status pendiente">Pendiente</span></td>
              <td>6/06/2026</td>
            </tr>
            <tr class="selected">
              <td>2</td>
              <td class="rodicado">CNZ-2026-0055</td>
              <td>Queja</td>
              <td>Pedido no recibido</td>
              <td><span class="status pendiente">Pendiente</span></td>
              <td>5/06/2026</td>
            </tr>
            <tr>
              <td>3</td>
              <td class="rodicado">CNZ-2026-0022</td>
              <td>Reclamo</td>
              <td>Cobro extra</td>
              <td><span class="status solucionado">Solucionado</span></td>
              <td>23/03/2026</td>
            </tr>
            <tr>
              <td>4</td>
              <td class="rodicado">CNZ-2026-0011</td>
              <td>Sugerencia</td>
              <td>Mejora en el proceso de registro</td>
              <td><span class="status solucionado">Solucionado</span></td>
              <td>10/02/2026</td>
            </tr>
          </tbody>
        </table>

        <div class="panel-footer">
          <a href="#">Ver todas mis solicitudes</a>
        </div>
      </section>

      <div class="feedback">
        <svg class="decor" viewBox="0 0 1000 220" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M0,40 C120,90 260,0 400,50 C540,100 640,10 780,55 C860,80 930,40 1000,60"
                fill="none" stroke="rgba(255,255,255,0.18)" stroke-width="1.5"/>
          <path d="M0,170 C140,120 280,200 420,150 C560,100 660,190 800,145 C880,120 940,165 1000,150"
                fill="none" stroke="rgba(255,255,255,0.12)" stroke-width="1.5"/>
          <circle cx="60" cy="45" r="3" fill="rgba(255,255,255,0.35)"/>
          <circle cx="340" cy="60" r="2.5" fill="rgba(255,255,255,0.25)"/>
          <circle cx="620" cy="20" r="3" fill="rgba(255,255,255,0.3)"/>
          <circle cx="900" cy="55" r="2.5" fill="rgba(255,255,255,0.25)"/>
          <circle cx="120" cy="185" r="2.5" fill="rgba(255,255,255,0.25)"/>
          <circle cx="470" cy="140" r="3" fill="rgba(255,255,255,0.3)"/>
          <circle cx="760" cy="185" r="2.5" fill="rgba(255,255,255,0.25)"/>
          <circle cx="960" cy="130" r="3" fill="rgba(255,255,255,0.3)"/>
        </svg>
        <div class="check">&#10003;</div>
        <p>
          <strong>Tu opinión es importante.</strong>
          En Conezhya trabajamos para brindarte un servicio rápido, eficiente y transparente.
        </p>
      </div>
    </div>
  </div>

  <script>
    const sidebar = document.getElementById('sidebar');
    const menuToggle = document.getElementById('menuToggle');
    menuToggle.addEventListener('click', () => {
      sidebar.classList.toggle('collapsed');
    });
  </script>
</body>
</html>