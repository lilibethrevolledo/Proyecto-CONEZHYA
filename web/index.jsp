<%-- 
    Document   : Conezhya
    Created on : 13/08/2026, 4:17:08?p.?m.
    Author     : Lilibeth
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CONEZHYA · Iniciar sesión</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@500;600;700&family=Inter:wght@400;500;600&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/styles.css">
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

<div class="page">

    <aside class="brand">

        <div class="brand__content">

            <div class="brand__mark"
                 aria-hidden="true">

                <div class="brand__content">

                    <div class="brand__logo-card">

                        <img class="brand__logo"
                             src="${pageContext.request.contextPath}/Logo2.jpeg"
                             alt="Logo CONEZHYA">

                    </div>

                </div>

            </div>

        </div>

        <svg class="brand__weave"
             viewBox="0 0 420 420"
             aria-hidden="true">

            <g stroke="#6FE7D0"
               stroke-opacity="0.35"
               stroke-width="1.4"
               fill="none">

                <path d="M20 400 C 90 340, 120 300, 90 260 S 40 190, 110 160"/>
                <path d="M110 170 C 200 135, 190 150, 230 120"/>
                <path d="M230 120 C 270 95, 300 100, 340 70"/>
                <path d="M100 260 C 150 250, 170 220, 230 210"/>

            </g>

            <g fill="#6FE7D0">
                <circle cx="20" cy="380" r="4"/>
                <circle cx="90" cy="260" r="3.5"/>
                <circle cx="110" cy="160" r="4"/>
                <circle cx="230" cy="120" r="3.5"/>
                <circle cx="230" cy="210" r="3"/>
                <circle cx="340" cy="70" r="4.5"/>
            </g>

        </svg>

    </aside>

    <main class="panel">

        <div class="login">

            <h2>Inicia sesión</h2>

            <p class="login__subtitle">
                Ingresa tus datos para continuar
            </p>

            <form action="${pageContext.request.contextPath}/LoginServlet"
                  method="post">

                <div class="field">

                    <label for="usuario">
                        Usuario
                    </label>

                    <input id="usuario"
                           name="correo"
                           type="email"
                           autocomplete="username"
                           placeholder="Escribe tu correo"
                           required>

                </div>

                <div class="field">

                    <label for="password">
                        Contraseña
                    </label>

                    <div class="password-field">

                        <input id="password"
                               name="contrasena"
                               type="password"
                               autocomplete="current-password"
                               placeholder="Escribe tu contraseña"
                               required>

                        <button type="button"
                                class="toggle-password"
                                aria-label="Mostrar contraseña"
                                aria-pressed="false">

                            <svg viewBox="0 0 24 24"
                                 width="18"
                                 height="18">

                                <path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7-11-7-11-7Z"
                                      fill="none"
                                      stroke="currentColor"
                                      stroke-width="1.6"/>

                                <circle cx="12"
                                        cy="12"
                                        r="3"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="1.6"/>
                            </svg>

                        </button>

                    </div>

                </div>

                <!-- Mensaje de error del Servlet -->

                <p class="login__error"
                   role="alert"
                   style="color:#d32f2f; font-size:13px;">
                    ${error}
                </p>
<% if ("ok".equals(request.getParameter("registro"))) { %>
<p style="color:green; font-size:13px;">
    Registro exitoso. Ya puedes iniciar sesión.
</p>
<% } %>

<p style="color:green;">
    ${mensaje}
</p>

                <button type="submit"
                        class="btn-primary">
                    Ingresar
                </button>

                <div class="login__links">

                    <a href="#">
                        ¿Olvidaste tu contraseña?
                    </a>

                    <a href="${pageContext.request.contextPath}/Registro%20de%20nuevo%20usuario.jsp">
                        Regístrate aquí
                    </a>

                </div>

            </form>

        </div>

        <p class="panel__footer">
            Conexión que soluciona, excelencia que sorprende.
        </p>

    </main>

</div>

<script>
document.querySelector(".toggle-password")
    .addEventListener("click", function () {

        const campo = document.getElementById("password");

        const visible = campo.type === "text";

        campo.type = visible ? "password" : "text";

        this.setAttribute(
            "aria-pressed",
            String(!visible)
        );

        this.setAttribute(
            "aria-label",
            visible ? "Mostrar contraseña" : "Ocultar contraseña"
        );
    });
</script>

</body>
</html>


<script>
  const toggle = document.querySelector('.toggle-password');
  const passwordInput = document.getElementById('password');
  toggle.addEventListener('click', () => {
    const isHidden = passwordInput.type === 'password';
    passwordInput.type = isHidden ? 'text' : 'password';
    toggle.setAttribute('aria-pressed', String(isHidden));
    toggle.setAttribute('aria-label', isHidden ? 'Ocultar contraseña' : 'Mostrar contraseña');
  });
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

/* ---------- Brand panel ---------- */

.brand {
  position: relative;
  overflow: hidden;
  background: linear-gradient(160deg, var(--navy-deep) 0%, var(--blue) 65%, #0E7C90 100%);
  display: flex;
  align-items: center;
  padding: 48px;
}

.brand__content {
  position: relative;
  z-index: 2;
  max-width: 320px;
  animation: rise 0.6s ease-out;
}

@keyframes rise {
  from { opacity: 0; transform: translateY(12px); }
  to   { opacity: 1; transform: translateY(0); }
}

.brand__mark {
  width: 200px;
  height: 60px;
  margin-bottom: 30px;
}
.brand__mark {
  width: 200px;
  height: 60px;
  margin-bottom: 30px;
}

.brand__logo-card {
  display: inline-block;
  background: rgba(270, 255, 270, 0.94);
  border-radius: 14px;
  padding: 15px 20px;   /* más padding para que acompañe el tamaño nuevo */
}

.brand__logo {
  display: block;
  width: 320px;         /* antes 220px */
  max-width: 60vw;       /* para que no se desborde en pantallas chicas */
  height: auto;
}
.brand__content {
  transform: translateY(-10px);   /* ajusta el número: más negativo = más arriba */
}
.brand__name {
  color: #FFFFFF;
  font-size: 28px;
  font-weight: 700;
  letter-spacing: 0.5px;
}

.brand__tagline {
  margin-top: 14px;
  color: rgba(255, 255, 255, 0.78);
  font-size: 15px;
  line-height: 1.55;
}

.brand__weave {
  position: absolute;
  bottom: -10px;
  right: -60px;
  width: 340px;
  height: 340px;
  z-index: 1;
}
.brand__content {
  transform: translateX(20px);   /* ajusta el número: más alto = más a la derecha */
}


/* ---------- Form panel ---------- */

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

/* ---------- Responsive ---------- */

@media (max-width: 900px) {
  .page {
    grid-template-columns: 1fr;
  }

  .brand {
    padding: 32px 24px;
    min-height: 200px;
  }

  .brand__content {
    max-width: none;
  }

  .brand__weave {
    width: 220px;
    height: 220px;
    bottom: -60px;
    right: -50px;
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