<%-- 
    Document   : conezhya
    Created on : 14/08/2026, 11:40:02?a.?m.
    Author     : Lilibeth
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%-- CAMBIO ROL: decide a qué panel va el botón "Iniciar" según el rol de la sesión --%>
<%
    String rol = (String) session.getAttribute("rol");
    String destino = "/usuario/Inicio2.jsp";   // panel de usuario (por defecto)

    // Cuando existan los paneles de admin y agente, quita las dos barras //
     if ("administrador".equals(rol)) { destino = "/Admin/Inicio.jsp"; }
     else if ("agente".equals(rol))   { destino = "/Agente/Panel%20agente.jsp"; }
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHA · Bienvenido</title>
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
}

* { box-sizing: border-box; }

html, body { height: 100%; margin: 0; }

body {
  font-family: 'Inter', sans-serif;
  color: var(--text-dark);
  background: var(--bg);
}

h1, h2 { font-family: 'Sora', sans-serif; margin: 0; }

@keyframes rise {
  from { opacity: 0; transform: translateY(12px); }
  to   { opacity: 1; transform: translateY(0); }
}

.btn-primary {
  width: 100%;
  margin-top: 8px;
  padding: 13px;
  font-family: 'Inter', sans-serif;
  font-size: 15px;
  font-weight: 600;
  color: #FFFFFF;
  background: linear-gradient(135deg, var(--teal) 0%, var(--blue) 100%);
  border: none;
  border-radius: var(--radius);
  cursor: pointer;
  transition: filter 0.15s ease, transform 0.1s ease;
}
.btn-primary:hover { filter: brightness(1.06); }
.btn-primary:active { transform: scale(0.99); }
.btn-primary:focus-visible { outline: 2px solid var(--navy-deep); outline-offset: 2px; }

/* ---------- Pantalla de bienvenida ---------- */

.welcome {
  position: relative;
  overflow: hidden;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px 20px;
  background: linear-gradient(160deg, var(--navy-deep) 0%, var(--blue) 65%, #0E7C90 100%);
}

.welcome__weave {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

.welcome-card {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 440px;
  background: #FFFFFF;
  border-radius: 20px;
  padding: 44px 36px;
  text-align: center;
  box-shadow: 0 24px 60px rgba(6, 20, 33, 0.35);
  animation: rise 0.6s ease-out;
}

.welcome-card__avatar {
  width: 64px;
  height: 64px;
  margin: 0 auto 20px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--teal) 0%, var(--blue) 100%);
  color: #FFFFFF;
  font-family: 'Sora', sans-serif;
  font-weight: 700;
  font-size: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  letter-spacing: 0.5px;
}

.welcome-card h1 {
  font-size: 22px;
  font-weight: 700;
  color: var(--text-dark);
  margin-bottom: 18px;
}

.welcome-card__text {
  font-size: 14px;
  line-height: 1.6;
  color: var(--text-muted);
  margin: 0 0 14px;
}

.welcome-card__text strong { color: var(--text-dark); }

.welcome-card__tagline {
  font-size: 13px;
  color: var(--teal);
  font-weight: 500;
  margin: 20px 0 28px;
}

.welcome-card__btn {
  display: inline-block;
  width: auto;
  padding: 12px 32px;
  text-decoration: none;
}

@media (max-width: 480px) {
  .welcome-card { padding: 36px 24px; }
}

@media (prefers-reduced-motion: reduce) {
  .welcome-card { animation: none; }
}
</style>
</head>
<body>

  <main class="welcome">
    <svg class="welcome__weave" viewBox="0 0 1200 700" preserveAspectRatio="xMidYMid slice" aria-hidden="true">
      <g stroke="#6FE7D0" stroke-opacity="0.25" stroke-width="1.3" fill="none">
        <path d="M-20 560 C 100 520, 160 580, 260 540 S 420 480, 500 520"/>
        <path d="M500 520 C 580 555, 620 500, 700 510"/>
        <path d="M700 510 C 780 520, 810 470, 900 480"/>
        <path d="M900 480 C 980 490, 1020 440, 1120 450"/>
        <path d="M60 120 C 140 150, 180 100, 260 130"/>
        <path d="M260 130 C 330 155, 360 110, 440 120"/>
      </g>
      <g fill="#6FE7D0">
        <circle cx="-20" cy="560" r="3.5"/>
        <circle cx="260" cy="540" r="3"/>
        <circle cx="500" cy="520" r="4"/>
        <circle cx="700" cy="510" r="3"/>
        <circle cx="900" cy="480" r="3.5"/>
        <circle cx="1120" cy="450" r="4.5"/>
        <circle cx="60" cy="120" r="3"/>
        <circle cx="260" cy="130" r="3.5"/>
        <circle cx="440" cy="120" r="3"/>
      </g>
    </svg>

    <div class="welcome-card">
      <div class="welcome-card__avatar" id="avatar">CN</div>

      <h1>¡Bienvenido(a), <span id="username-hero">Usuario</span>!</h1>

      <p class="welcome-card__text">
        Nos complace darte la bienvenida a <strong>CONEZHYA</strong>, tu plataforma de conexión y soluciones de confianza.
      </p>

      <p class="welcome-card__text">
        Aquí podrás revisar tus solicitudes, hablar con nuestro equipo de soporte y mantener tu perfil siempre actualizado.
      </p>

      <p class="welcome-card__tagline">Conexión que soluciona, excelencia que sorprende.</p>

      <!-- CAMBIO ROL: el destino depende del rol (ver bloque al inicio del archivo) -->
      <a href="<%= request.getContextPath() + destino %>" class="btn-primary welcome-card__btn">Iniciar</a>
    </div>
  </main>

<!-- El nombre sale de la sesión, no de localStorage -->
<script>
  const nombre   = "${sessionScope.nombre}";
  const apellido = "${sessionScope.apellido}";
  const usuario  = (nombre + " " + apellido).trim() || "Usuario";

  document.getElementById('username-hero').textContent = usuario;

  const initials = ((nombre[0] || "") + (apellido[0] || "")).toUpperCase();
  document.getElementById('avatar').textContent = initials || 'CN';
</script>
</body>
</html>