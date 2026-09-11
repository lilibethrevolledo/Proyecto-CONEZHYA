<%-- 
    Document   : conezhya
    Created on : 14/08/2026, 11:40:02?a.?m.
    Author     : Lilibeth
--%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHA · Bienvenido</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
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

      <a href="index.jsp" class="btn-primary welcome-card__btn">Cerrar sesión</a>
    </div>
  </main>

<script>
  const usuario = localStorage.getItem('conezha_usuario') || 'Usuario';
  document.getElementById('username-hero').textContent = usuario;

  const initials = usuario
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map(w => w[0])
    .join('')
    .toUpperCase();
  document.getElementById('avatar').textContent = initials || 'CN';
</script>
</body>
</html>

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

html, body {
  height: 100%;
  margin: 0;
}

body {
  font-family: 'Inter', sans-serif;
  color: var(--text-dark);
  background: var(--bg);
}

h1, h2 {
  font-family: 'Sora', sans-serif;
  margin: 0;
}

.page {
  min-height: 100vh;
  display: grid;
  grid-template-columns: 42% 58%;
}

/* ---------- Brand panel (index.html) ---------- */

.brand {
  position: relative;
  overflow: hidden;
  background: linear-gradient(160deg, var(--navy-deep) 0%, var(--blue) 65%, #0E7C90 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 48px;
}

.brand__content {
  position: relative;
  z-index: 2;
  animation: rise 0.6s ease-out;
}

@keyframes rise {
  from { opacity: 0; transform: translateY(12px); }
  to   { opacity: 1; transform: translateY(0); }
}

.brand__logo-card {
  position: relative;
  z-index: 2;
  display: inline-block;
  background: rgba(255, 255, 255, 0.94);
  border-radius: 18px;
  padding: 28px 36px;
}

.brand__logo {
  display: block;
  width: 320px;
  max-width: 60vw;
  height: auto;
}

.brand__weave {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
}

/* ---------- Form panel (index.html) ---------- */

.panel {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 48px 24px;
}

.login {
  width: 100%;
  max-width: 340px;
}

.login h2 {
  font-size: 24px;
  font-weight: 600;
}

.login__subtitle {
  margin: 8px 0 32px;
  color: var(--text-muted);
  font-size: 14px;
}

.field {
  margin-bottom: 18px;
}

.field label {
  display: block;
  font-size: 13px;
  font-weight: 500;
  color: var(--text-dark);
  margin-bottom: 6px;
}

.field input {
  width: 100%;
  padding: 12px 14px;
  font-size: 14px;
  font-family: 'Inter', sans-serif;
  border: 1px solid var(--border);
  border-radius: var(--radius);
  background: #FFFFFF;
  color: var(--text-dark);
  outline: none;
  transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.field input::placeholder {
  color: #9AABB3;
}

.field input:focus,
.field input:focus-visible {
  border-color: var(--teal);
  box-shadow: 0 0 0 3px rgba(18, 184, 160, 0.15);
}

.password-field {
  position: relative;
}

.password-field input {
  padding-right: 42px;
}

.toggle-password {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  background: none;
  border: none;
  cursor: pointer;
  color: var(--text-muted);
  padding: 4px;
  display: flex;
  border-radius: 6px;
}

.toggle-password:hover {
  color: var(--teal);
}

.toggle-password:focus-visible {
  outline: 2px solid var(--teal);
  outline-offset: 2px;
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

.btn-primary:hover {
  filter: brightness(1.06);
}

.btn-primary:active {
  transform: scale(0.99);
}

.btn-primary:focus-visible {
  outline: 2px solid var(--navy-deep);
  outline-offset: 2px;
}

.login__links {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  font-size: 13px;
}

.login__links a {
  color: var(--blue);
  text-decoration: none;
}

.login__links a:hover {
  color: var(--teal);
  text-decoration: underline;
}

.panel__footer {
  margin-top: 40px;
  font-size: 12.5px;
  color: var(--text-muted);
  text-align: center;
}

/* ---------- Responsive (index.html) ---------- */

@media (max-width: 900px) {
  .page {
    grid-template-columns: 1fr;
  }

  .brand {
    padding: 32px 24px;
    min-height: 200px;
  }

  .brand__logo {
    width: 220px;
  }

  .brand__logo-card {
    padding: 20px 24px;
  }

  .panel {
    padding: 32px 20px 40px;
  }
}

/* ---------- Reduced motion ---------- */

@media (prefers-reduced-motion: reduce) {
  .brand__content {
    animation: none;
  }
}

/* ---------- Welcome screen (bienvenida.html) ---------- */

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

.welcome-card__text strong {
  color: var(--text-dark);
}

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
  .welcome-card {
    padding: 36px 24px;
  }
}