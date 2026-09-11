<%-- 
    Document   : Registro de nuevo usuario
    Created on : 19/08/2026, 9:18:13?p.?m.
    Author     : User
--%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONEZHYA · Registro</title>
<style>
  :root{
    --azul-oscuro:#0b2f4e;
    --azul-medio:#134a72;
    --teal:#1a9e97;
    --teal-claro:#22b3a6;
    --texto-oscuro:#0f2436;
    --texto-gris:#5b6b78;
    --borde:#dfe6ea;
    --error:#d9534f;
  }
  *{box-sizing:border-box;}
  body{
    margin:0;
    min-height:100vh;
    font-family:'Segoe UI', Arial, sans-serif;
    background:
      radial-gradient(circle at 15% 20%, rgba(255,255,255,0.05), transparent 40%),
      linear-gradient(135deg, var(--azul-oscuro) 0%, var(--azul-medio) 45%, var(--teal) 100%);
    display:flex;
    align-items:center;
    justify-content:center;
    padding:40px 16px;
    position:relative;
    overflow-x:hidden;
  }
  /* líneas decorativas como en la imagen de referencia */
  body::before, body::after{
    content:"";
    position:absolute;
    width:520px;
    height:2px;
    background:rgba(255,255,255,0.15);
    border-radius:2px;
  }
  body::before{ top:8%; left:-10%; transform:rotate(-4deg); }
  body::after{ bottom:8%; right:-10%; transform:rotate(-4deg); }

  .card{
    background:#ffffff;
    width:100%;
    max-width:380px;
    border-radius:16px;
    padding:28px 26px 22px;
    box-shadow:0 30px 60px rgba(6, 30, 50, 0.35);
    position:relative;
    z-index:1;
  }
  .logo{
    display:block;
    max-width:110px;
    max-height:70px;
    width:auto;
    height:auto;
    margin:0 auto 14px;
    object-fit:contain;
  }
  h1{
    text-align:center;
    color:var(--texto-oscuro);
    font-size:19px;
    margin:0 0 6px;
  }
  p.sub{
    text-align:center;
    color:var(--texto-gris);
    font-size:12.5px;
    line-height:1.45;
    margin:0 auto 18px;
    max-width:320px;
  }
  form{
    display:flex;
    flex-direction:column;
    gap:11px;
  }
  .campo{
    display:flex;
    flex-direction:column;
    gap:4px;
  }
  label{
    font-size:12px;
    font-weight:600;
    color:var(--texto-oscuro);
  }
  input, select{
    border:1.5px solid var(--borde);
    border-radius:8px;
    padding:8px 11px;
    font-size:13px;
    color:var(--texto-oscuro);
    outline:none;
    transition:border-color .15s ease, box-shadow .15s ease;
    font-family:inherit;
    background:#fff;
  }
  input::placeholder{ color:#a9b6c0; }
  input:focus, select:focus{
    border-color:var(--teal);
    box-shadow:0 0 0 3px rgba(26,158,151,0.15);
  }
  input.invalido, select.invalido{
    border-color:var(--error);
  }
  .msg-error{
    font-size:11px;
    color:var(--error);
    min-height:13px;
  }
  .fila-doble{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:10px;
  }
  .fila-cedula{
    display:grid;
    grid-template-columns:112px 1fr;
    gap:10px;
  }
  select{
    cursor:pointer;
    appearance:none;
    -webkit-appearance:none;
    background-image:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='10' height='6'><path d='M0 0l5 6 5-6z' fill='%235b6b78'/></svg>");
    background-repeat:no-repeat;
    background-position:right 10px center;
    padding-right:26px;
  }
  @media (max-width:420px){
    .fila-doble{ grid-template-columns:1fr; }
    .fila-cedula{ grid-template-columns:1fr; }
    .card{ padding:24px 18px 20px; }
  }
  button{
    margin-top:4px;
    background:linear-gradient(135deg, var(--teal), var(--teal-claro));
    color:#fff;
    border:none;
    border-radius:8px;
    padding:10px;
    font-size:13.5px;
    font-weight:600;
    cursor:pointer;
    transition:transform .12s ease, box-shadow .12s ease, opacity .12s ease;
    box-shadow:0 10px 20px rgba(26,158,151,0.3);
  }
  button:hover{ transform:translateY(-1px); box-shadow:0 14px 24px rgba(26,158,151,0.38); }
  button:active{ transform:translateY(0); }
  .lema{
    text-align:center;
    color:var(--teal);
    font-size:11.5px;
    font-weight:600;
    margin-top:16px;
  }
  .exito{
    display:none;
    text-align:center;
    padding:6px 0 0;
  }
  .exito .icono{
    width:56px;height:56px;border-radius:50%;
    background:rgba(26,158,151,0.12);
    color:var(--teal);
    display:flex;align-items:center;justify-content:center;
    margin:0 auto 14px;
    font-size:28px;
  }
  .exito h2{
    color:var(--texto-oscuro);
    font-size:20px;
    margin:0 0 8px;
  }
  .exito p{
    color:var(--texto-gris);
    font-size:14px;
    margin:0 0 22px;
  }
  .exito button{ width:100%; }
</style>
</head>
<body>

<div class="card">

  <div id="vistaFormulario">
    <img src="Logo2.jpeg" alt="Logo CONEZHYA" class="logo">
    <h1>Crea tu cuenta</h1>
    <p class="sub">
      Regístrate para gestionar tus solicitudes,
      hablar con nuestro equipo de soporte y mantener tu perfil siempre actualizado.
    </p>

    <form id="formRegistro" novalidate>

      <div class="fila-doble">
        <div class="campo">
          <label for="nombres">Nombres</label>
          <input type="text" id="nombres" placeholder="Ej: Andrés" autocomplete="given-name">
          <div class="msg-error" id="err-nombres"></div>
        </div>
        <div class="campo">
          <label for="apellidos">Apellidos</label>
          <input type="text" id="apellidos" placeholder="Ej: Gómez" autocomplete="family-name">
          <div class="msg-error" id="err-apellidos"></div>
        </div>
      </div>

      <div class="fila-cedula">
        <div class="campo">
          <label for="tipoDocumento">Tipo</label>
          <select id="tipoDocumento">
            <option value="CC">C.C.</option>
            <option value="CE">C.E.</option>
            <option value="TI">T.I.</option>
            <option value="PA">Pasaporte</option>
            <option value="NIT">NIT</option>
          </select>
        </div>
        <div class="campo">
          <label for="cedula">Número de documento</label>
          <input type="text" id="cedula" placeholder="Ej: 1032789456" inputmode="numeric" autocomplete="off">
          <div class="msg-error" id="err-cedula"></div>
        </div>
      </div>

      <div class="campo">
        <label for="correo">Correo electrónico</label>
        <input type="email" id="correo" placeholder="tucorreo@ejemplo.com" autocomplete="email">
        <div class="msg-error" id="err-correo"></div>
      </div>

      <div class="campo">
        <label for="celular">Celular</label>
        <input type="tel" id="celular" placeholder="Ej: 3001234567" inputmode="numeric" autocomplete="tel">
        <div class="msg-error" id="err-celular"></div>
      </div>

      <button type="submit">Crear cuenta</button>
    </form>

    <div class="lema">Conexión que soluciona, excelencia que sorprende.</div>
  </div>

  <div class="exito" id="vistaExito">
    <div class="icono">?</div>
    <h2>¡Registro exitoso!</h2>
    <p>Tu cuenta ha sido creada correctamente. Ya puedes iniciar sesión en CONEZHYA.</p>
    <a href="index.jsp">
    <button type="button" id="btnVolver">Volver a inicio de sesión</button>
</a>
  </div>

</div>

<script>
  const form = document.getElementById('formRegistro');
  const vistaFormulario = document.getElementById('vistaFormulario');
  const vistaExito = document.getElementById('vistaExito');
  const btnVolver = document.getElementById('btnVolver');

  const campos = {
    nombres: { input: document.getElementById('nombres'), err: document.getElementById('err-nombres') },
    apellidos: { input: document.getElementById('apellidos'), err: document.getElementById('err-apellidos') },
    cedula: { input: document.getElementById('cedula'), err: document.getElementById('err-cedula') },
    correo: { input: document.getElementById('correo'), err: document.getElementById('err-correo') },
    celular: { input: document.getElementById('celular'), err: document.getElementById('err-celular') },
  };

  function limpiarError(nombre){
    campos[nombre].input.classList.remove('invalido');
    campos[nombre].err.textContent = '';
  }

  function marcarError(nombre, mensaje){
    campos[nombre].input.classList.add('invalido');
    campos[nombre].err.textContent = mensaje;
  }

  Object.keys(campos).forEach(nombre=>{
    campos[nombre].input.addEventListener('input', ()=> limpiarError(nombre));
  });

  form.addEventListener('submit', function(e){
    e.preventDefault();
    let valido = true;

    const tipoDocumento = document.getElementById('tipoDocumento').value;
    const nombres = campos.nombres.input.value.trim();
    const apellidos = campos.apellidos.input.value.trim();
    const cedula = campos.cedula.input.value.trim();
    const correo = campos.correo.input.value.trim();
    const celular = campos.celular.input.value.trim();

    if(nombres.length < 2){
      marcarError('nombres', 'Ingresa un nombre válido.');
      valido = false;
    }
    if(apellidos.length < 2){
      marcarError('apellidos', 'Ingresa un apellido válido.');
      valido = false;
    }
    if(!/^\d{6,12}$/.test(cedula)){
      marcarError('cedula', 'La cédula debe tener entre 6 y 12 dígitos.');
      valido = false;
    }
    if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(correo)){
      marcarError('correo', 'Ingresa un correo electrónico válido.');
      valido = false;
    }
    if(!/^\d{7,10}$/.test(celular)){
      marcarError('celular', 'Ingresa un número de celular válido.');
      valido = false;
    }

    if(!valido) return;

    // Aquí se enviarían los datos al backend (fetch/AJAX)
    const datosRegistro = { tipoDocumento, nombres, apellidos, cedula, correo, celular };
    console.log('Datos de registro:', datosRegistro);

    vistaFormulario.style.display = 'none';
    vistaExito.style.display = 'block';
  });

  btnVolver.addEventListener('click', function(){
    form.reset();
    vistaExito.style.display = 'none';
    vistaFormulario.style.display = 'block';
  });
</script>

</body>
</html>