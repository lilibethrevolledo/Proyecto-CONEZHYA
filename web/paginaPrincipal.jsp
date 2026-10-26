 
 

 <!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHA ? Conexión que soluciona</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<style>
  :root {
    --navy-deep: #0B2A4A;
    --navy-mid: #123B63;
    --blue-ocean: #1B5C8F;
    --teal: #1CA9A0;
    --mint: #3ED598;
    --bg-light: #F6FAF9;
    --ink: #0E1F30;
    --ink-soft: #52697A;
    --white: #FFFFFF;
    --line: #DCE7E5;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    font-family: 'Inter', sans-serif;
    color: var(--ink);
    background: var(--bg-light);
    line-height: 1.6;
  }

  h1, h2, h3 {
    font-family: 'Space Grotesk', sans-serif;
    font-weight: 600;
    line-height: 1.2;
    color: var(--navy-deep);
  }

  a { text-decoration: none; color: inherit; }
  img { display: block; max-width: 200%; }

  .wrap { max-width: 1190px; margin: 0 auto; padding: 0 50px; }

  /* ---------- NAV ---------- */
  header {
    position: sticky; top: 0; z-index: 50;
    background: var(--white);
    border-bottom: 1px solid var(--line);
  }
  nav.wrap {
    display: flex; align-items: center; justify-content: space-between;
    height: 84px;
  }
  .logo-mark { height: 86px; }
  .nav-links {
    display: flex; gap: 36px; list-style: none;
    font-size: 15px; font-weight: 500; color: var(--ink-soft);
  }
  .nav-links a:hover { color: var(--navy-deep); }
  .nav-links .active { color: var(--navy-deep); }
  .btn-login {
    display: inline-flex; align-items: center; gap: 8px;
    background: var(--navy-deep);
    color: var(--white);
    font-size: 14px; font-weight: 600;
    padding: 12px 22px;
    border-radius: 999px;
  }
  .btn-login:hover { background: var(--navy-mid); }
  .nav-toggle { display: none; }

  /* ---------- HERO ---------- */
  .hero {
    display: grid;
    grid-template-columns: 0.85fr 1.15fr;
    min-height: 560px;
  }
  .hero-panel {
    position: relative;
    background: linear-gradient(160deg, var(--navy-deep) 0%, var(--blue-ocean) 55%, var(--teal) 100%);
    overflow: hidden;
    display: flex; flex-direction: column; justify-content: space-between;
    padding: 56px 48px;
  }
  .hero-panel .logo-box {
    background: var(--white);
    border-radius: 14px;
    padding: 18px 22px;
    display: inline-block;
    width: fit-content;
  }
  .hero-panel .logo-box img { height: 42px; }
  .hero-panel .tagline {
    color: rgba(255,255,255,0.85);
    font-size: 15px;
    max-width: 260px;
    position: relative;
    z-index: 2;
  }
  svg.path-deco {
    position: absolute; inset: 0;
    width: 100%; height: 100%;
  }
  .dot {
    animation: pulse 2.6s ease-in-out infinite;
  }
  .dot:nth-child(2) { animation-delay: .3s; }
  .dot:nth-child(3) { animation-delay: .6s; }
  @keyframes pulse {
    0%, 100% { opacity: .55; r: 4; }
    50% { opacity: 1; r: 6; }
  }
  @media (prefers-reduced-motion: reduce) {
    .dot { animation: none; }
  }

  .hero-content {
    display: flex; flex-direction: column; justify-content: center;
    padding: 56px 64px;
    background: var(--white);
  }
  .hero-content h1 {
    font-size: 42px;
    max-width: 12ch;
    margin-bottom: 20px;
  }
  .hero-content p.sub {
    font-size: 17px;
    color: var(--ink-soft);
    max-width: 46ch;
    margin-bottom: 32px;
  }
  .cta-row { display: flex; gap: 16px; flex-wrap: wrap; }
  .btn-primary, .btn-secondary {
    display: inline-flex; align-items: center; gap: 10px;
    font-size: 15px; font-weight: 600;
    padding: 15px 26px;
    border-radius: 10px;
  }
  .btn-primary {
    background: var(--teal);
    color: var(--white);
  }
  .btn-primary:hover { background: #178f87; }
  .btn-secondary {
    background: #1ba79e;
    color: #ffffff;
    border: 1.5px solid #1ba79e;
}

.btn-secondary:hover {
    background: #178f87;
    color: #ffffff;
    border-color: #178f87;
}

  /* ---------- FEATURES STRIP ---------- */
  .features {
    background: var(--white);
    border-top: 1px solid var(--line);
    border-bottom: 1px solid var(--line);
  }
  .features .wrap {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    padding: 44px 32px;
  }
  .feature-item {
    padding: 0 28px;
    border-left: 1px solid var(--line);
  }
  .feature-item:first-child { border-left: none; padding-left: 0; }
  .feature-item .icon {
    width: 38px; height: 38px;
    margin-bottom: 14px;
    color: var(--teal);
  }
  .feature-item h3 { font-size: 16px; margin-bottom: 6px; }
  .feature-item p { font-size: 14px; color: var(--ink-soft); }

  /* ---------- PROCESO (líneas y puntos) ---------- */
  .process {
    padding: 90px 0;
  }
  .process .heading {
    text-align: center;
    max-width: 560px;
    margin: 0 auto 64px;
  }
  .process .heading h2 { font-size: 30px; margin-bottom: 12px; }
  .process .heading p { color: var(--ink-soft); font-size: 15px; }

  .process-track {
    display: flex; align-items: flex-start; justify-content: space-between;
    position: relative;
    max-width: 900px;
    margin: 0 auto;
  }
  .process-track::before {
    content: '';
    position: absolute;
    top: 27px; left: 60px; right: 60px;
    height: 2px;
    background-image: linear-gradient(to right, var(--teal) 40%, transparent 0%);
    background-size: 12px 2px;
    background-repeat: repeat-x;
  }
  .process-step {
    position: relative;
    z-index: 2;
    display: flex; flex-direction: column; align-items: center;
    text-align: center;
    width: 200px;
  }
  .process-step .node {
    width: 56px; height: 56px;
    border-radius: 50%;
    background: var(--white);
    border: 2px solid var(--teal);
    display: flex; align-items: center; justify-content: center;
    margin-bottom: 18px;
    color: var(--teal);
  }
  .process-step.done .node {
    background: var(--mint);
    border-color: var(--mint);
    color: var(--white);
  }
  .process-step h3 { font-size: 15px; margin-bottom: 6px; }
  .process-step p { font-size: 13px; color: var(--ink-soft); }

  /* ---------- CTA FINAL ---------- */
  .cta-final {
    background: linear-gradient(120deg, var(--navy-deep), var(--blue-ocean));
    padding: 64px 0;
  }
  .cta-final .wrap {
    display: flex; align-items: center; justify-content: space-between;
    gap: 24px; flex-wrap: wrap;
  }
  .cta-final h2 { color: var(--white); font-size: 26px; max-width: 18ch; }
  .cta-final .btn-primary { background: var(--mint); color: var(--navy-deep); }
  .cta-final .btn-primary:hover { background: #33c489; }

  /* ---------- FOOTER ---------- */
  footer {
    background: var(--navy-deep);
    color: rgba(255,255,255,0.7);
    padding: 48px 0 28px;
    font-size: 14px;
  }
  footer .wrap {
    display: flex; justify-content: space-between; align-items: flex-start;
    flex-wrap: wrap; gap: 24px;
    border-bottom: 1px solid rgba(255,255,255,0.12);
    padding-bottom: 32px; margin-bottom: 20px;
  }
  footer .foot-logo { height: 30px; margin-bottom: 12px; filter: brightness(0) invert(1); }
  footer .foot-links { display: flex; gap: 48px; flex-wrap: wrap; }
  footer .foot-links h4 { color: var(--white); font-size: 13px; margin-bottom: 12px; font-family: 'Inter'; font-weight: 600; }
  footer .foot-links ul { list-style: none; display: flex; flex-direction: column; gap: 8px; }
  footer .foot-links a:hover { color: var(--white); }
  footer .bottom-bar { text-align: center; font-size: 13px; }

  @media (max-width: 900px) {
    .hero { grid-template-columns: 1fr; }
    .hero-panel { padding: 40px 28px; }
    .hero-content { padding: 40px 28px; }
    .features .wrap { grid-template-columns: repeat(2, 1fr); row-gap: 32px; }
    .feature-item:nth-child(3) { border-left: none; padding-left: 0; }
    .process-track { flex-direction: column; align-items: flex-start; gap: 32px; }
    .process-track::before { display: none; }
    .process-step { flex-direction: row; text-align: left; width: 100%; gap: 16px; }
    .process-step .node { margin-bottom: 0; flex-shrink: 0; }
    .nav-links { display: none; }
  }
</style>
</head>
<body>

<header>
  <nav class="wrap">
    <img src="Logo2.jpeg" alt="Conezha" class="logo-mark">
    <ul class="nav-links">
      <li><a href="#" class="active">Inicio</a></li>
      <li><a href="#servicios">Servicios</a></li>
      <li><a href="#nosotros">Nosotros</a></li>
      <li><a href="#contacto">Contacto</a></li>
    </ul>

    <a href="index.jsp?id=4"><button class="btn-login">Iniciar sesión</button></a>
  </nav>
</header>

<section class="hero">
  <div class="hero-panel">
    

    <svg class="path-deco" viewBox="0 0 420 500" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M40 460 C 90 420, 60 360, 110 330 S 200 260, 180 200 S 260 120, 320 90" stroke="rgba(255,255,255,0.35)" stroke-width="1.5" stroke-dasharray="1 10" stroke-linecap="round"/>
      <circle class="dot" cx="40" cy="460" r="4" fill="#3ED598"/>
      <circle class="dot" cx="110" cy="330" r="4" fill="#ffffff"/>
      <circle class="dot" cx="180" cy="200" r="4" fill="#ffffff"/>
      <circle class="dot" cx="320" cy="90" r="5" fill="#3ED598"/>
    </svg>

    <p class="tagline">Conexión que soluciona, excelencia que sorprende.</p>
  </div>

  <div class="hero-content">
    <h1>Cada solicitud, bien conectada</h1>
    <p class="sub">Conezhya centraliza el registro, seguimiento y solución de solicitudes para que tu equipo responda a tiempo, siempre.</p>
    <div class="cta-row">
      
       
<a class="btn-secondary"
   href="${pageContext.request.contextPath}/Consultar%20estado%20de%20solicitud.jsp"
   title="Consultar estado de solicitud">
    <svg width="18" height="18"
         viewBox="0 0 24 24"
         fill="none"
         stroke="currentColor"
         stroke-width="2">

        <circle cx="11" cy="11" r="8"/>
        <path d="M21 21l-4.35-4.35"/>
    </svg>
    Consultar estado
</a>

    </div>
  </div>
</section>

<section class="features" id="servicios">
  <div class="wrap">
    <div class="feature-item">
      <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 2l8 4v6c0 5-3.5 8.5-8 10-4.5-1.5-8-5-8-10V6l8-4z"/></svg>
      <h3>Seguridad</h3>
      <p>Protegemos la información de tu equipo y tus clientes en cada paso.</p>
    </div>
    <div class="feature-item">
      <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
      <h3>Eficiencia</h3>
      <p>Agiliza el registro y la asignación de cada solicitud entrante.</p>
    </div>
    <div class="feature-item">
      <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M3 17l5-5 4 4 8-8"/><path d="M15 8h5v5"/></svg>
      <h3>Seguimiento</h3>
      <p>Consulta el estado real de cada caso, en cualquier momento.</p>
    </div>
    <div class="feature-item">
      <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="9" cy="8" r="3.2"/><circle cx="17" cy="9" r="2.6"/><path d="M3 20c0-3.3 2.7-5.5 6-5.5s6 2.2 6 5.5"/><path d="M15 15c2.6.2 4.5 2 4.5 5"/></svg>
      <h3>Cercanía</h3>
      <p>Mejoramos la comunicación entre tu equipo y las personas que atienden.</p>
    </div>
  </div>
</section>

<section class="process" id="nosotros">
  <div class="wrap">
    <div class="heading">
      <h2>Así avanza tu solicitud</h2>
      <p>Cada caso pasa por tres momentos claros, conectados de principio a fin.</p>
    </div>
    <div class="process-track">
      <div class="process-step done">
        <div class="node">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20l9-16H3l9 16z"/></svg>
        </div>
        <h3>Nueva solicitud</h3>
        <p>Se registra con los datos del caso y queda lista para asignarse.</p>
      </div>
      <div class="process-step">
        <div class="node">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
        </div>
        <h3>En proceso</h3>
        <p>Un responsable la atiende y actualiza su avance en tiempo real.</p>
      </div>
      <div class="process-step">
        <div class="node">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
        </div>
        <h3>Solucionada</h3>
        <p>Se cierra el caso y queda disponible en el historial de consulta.</p>
      </div>
    </div>
  </div>
</section>

<section class="cta-final" id="contacto">
  <div class="wrap">
    <h2>¿Tienes un caso por resolver?</h2>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-primary">Enviar solicitud</a>
  </div>
</section>

<footer>
  <div class="wrap">
    <div>
      
      <p style="max-width: 32ch;">Conexión que soluciona, excelencia que sorprende.</p>
    </div>
    <div class="foot-links">
      <div>
        <h4>Producto</h4>
        <ul>
          <li><a href="#servicios">Servicios</a></li>
          <li><a href="#nosotros">Nosotros</a></li>
        </ul>
      </div>
      <div>
        <h4>Cuenta</h4>
        <ul>
          <li><a href="login.html">Iniciar sesión</a></li>
          <li><a href="#">Regístrate</a></li>
        </ul>
      </div>
      <div>
        <h4>Contacto</h4>
        <ul>
          <li><a href="#contacto">Enviar solicitud</a></li>
          <li><a href="#">Soporte</a></li>
        </ul>
      </div>
    </div>
  </div>
  <p class="bottom-bar">© 2026 CONEZHYA. Todos los derechos reservados.</p>
</footer>

</body>
</html>
