<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Conezha - Nueva Solicitud</title>
<style>
    .contenedor-volver {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 40px;
        margin-bottom: 20px;
    }

    .contenedor-volver .btn-volver {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;

        padding: 12px 30px;
        background: linear-gradient(135deg, #13b8a6, #1476ad);
        color: white !important;

        font-size: 16px;
        font-weight: bold;
        text-decoration: none !important;

        border-radius: 10px;
        border: none;
        cursor: pointer;
    }

  :root{
    --navy:#0e1f45;
    --navy-2:#163a6b;
    --teal:#22b6a3;
    --teal-2:#2fd6ae;
    --texto-gris:#5a6472;
    --borde:#e3e7ec;
    --fondo:#ffffff;
    --error:#e0483f;
    --exito:#1fae7c;
  }
  *{box-sizing:border-box;}
  body{
    margin:0;
    font-family:'Segoe UI', Arial, sans-serif;
    background:#fff;
    color:var(--navy);
  }

  /* NAVBAR */
  nav{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:16px 48px;
    border-bottom:1px solid var(--borde);
  }
  .logo{display:flex;align-items:center;gap:10px;}
  .logo-mark{
    width:38px;height:38px;border-radius:50%;
    background:conic-gradient(from 200deg, var(--teal), var(--navy-2), var(--teal));
    flex-shrink:0;
  }
  .logo-text{line-height:1.1;}
  .logo-text .nombre{font-weight:800;font-size:19px;color:var(--navy);letter-spacing:0.3px;}
  .logo-text .slogan{font-size:10px;color:var(--texto-gris);}
  .nav-links{display:flex;gap:34px;}
  .nav-links a{text-decoration:none;color:var(--navy);font-size:14.5px;font-weight:500;}
  .nav-links a.activo{font-weight:700;}
  .btn-sesion{
    background:var(--navy);color:#fff;border:none;padding:10px 22px;
    border-radius:24px;font-size:13.5px;font-weight:600;cursor:pointer;
  }

  /* LAYOUT PRINCIPAL DIVIDIDO */
  .split{
    display:flex;
    min-height:640px;
  }
.header {
    height: 75px !important;
    min-height: 75px !important;
    padding-top: 0 !important;
    padding-bottom: 0 !important;

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.header img {
    width: 200px !important;
    height: auto !important;
    max-height: 60px !important;
}
  /* PANEL IZQUIERDO DECORATIVO */
  .panel-decorativo{
    position:relative;
    flex:0 0 40%;
    background:linear-gradient(200deg, var(--navy) 0%, var(--navy-2) 45%, var(--teal) 100%);
    color:#fff;
    padding:56px 44px;
    overflow:hidden;
  }
  .panel-decorativo h1{
    font-size:28px;
    font-weight:800;
    margin:0 0 14px;
    line-height:1.25;
    position:relative;
    z-index:2;
  }
  .panel-decorativo p{
    font-size:14px;
    color:#dbeff0;
    line-height:1.6;
    max-width:300px;
    position:relative;
    z-index:2;
  }
  .lista-pasos{
    margin-top:40px;
    position:relative;
    z-index:2;
  }
  .paso{
    display:flex;
    align-items:flex-start;
    gap:12px;
    margin-bottom:22px;
  }
  .paso .num{
    width:26px;height:26px;border-radius:50%;
    background:rgba(255,255,255,0.16);
    border:1px solid rgba(255,255,255,0.4);
    display:flex;align-items:center;justify-content:center;
    font-size:12px;font-weight:700;flex-shrink:0;
  }
  .paso .txt{font-size:12.5px;color:#e4f3f2;line-height:1.5;padding-top:3px;}
  .paso .txt strong{display:block;color:#fff;font-size:13.5px;margin-bottom:2px;}

  /* trayecto punteado decorativo, igual espiritu que el hero */
  .trayecto{
    position:absolute;
    inset:0;
    z-index:1;
    opacity:0.9;
  }
  .punto{
    position:absolute;
    width:9px;height:9px;
    border-radius:50%;
    background:#fff;
    box-shadow:0 0 10px 2px rgba(255,255,255,0.6);
  }
  .punto.teal{background:var(--teal-2);box-shadow:0 0 10px 2px rgba(47,214,174,0.7);}

  /* PANEL DERECHO / FORMULARIO */
  .panel-form{
    flex:1;
    padding:48px 56px 60px;
    display:flex;
    justify-content:center;
  }
  .tarjeta{
    width:100%;
    max-width:520px;
  }
  .tarjeta h2{
    font-size:22px;
    margin:0 0 6px;
    color:var(--navy);
  }
  .tarjeta > p.subtitulo{
    font-size:13px;
    color:var(--texto-gris);
    margin:0 0 26px;
  }

  .aviso{
    display:flex;
    gap:12px;
    background:#fdf7e8;
    border:1px solid #f2e0a3;
    border-radius:10px;
    padding:14px 16px;
    margin-bottom:26px;
    font-size:12.5px;
    color:#6b5c22;
    line-height:1.55;
  }
  .aviso .icono{color:#d9a527;font-size:17px;flex-shrink:0;}
  .aviso strong{display:block;color:var(--navy);margin-bottom:2px;font-size:13px;}

  .campo{margin-bottom:22px;}
  .campo label{
    display:flex;
    align-items:center;
    gap:7px;
    font-size:13px;
    font-weight:700;
    color:var(--navy);
    margin-bottom:7px;
  }
  .campo label .ico{
    color:var(--teal);
    font-size:14px;
  }
  .input-wrap{
    position:relative;
  }
  .input-wrap .ico-input{
    position:absolute;
    left:13px;
    top:50%;
    transform:translateY(-50%);
    color:#9aa4b1;
    font-size:14px;
    pointer-events:none;
  }
  .campo input[type="text"]{
    width:100%;
    padding:11px 14px 11px 38px;
    border:1px solid var(--borde);
    border-radius:8px;
    font-size:13.5px;
    color:var(--navy);
    background:#fbfcfd;
    outline:none;
    transition:border-color 0.15s ease, background 0.15s ease;
  }
  header {
    height: 100px;
    display: flex;
    align-items: center;
    padding: 0 10%;
}

.logo {
    width: 240px;
    height: auto;
    object-fit: contain;
}
  .campo select{
    width:100%;
    padding:11px 14px 11px 38px;
    border:1px solid var(--borde);
    border-radius:8px;
    font-size:13.5px;
    color:var(--navy);
    background:#fbfcfd;
    outline:none;
    appearance:none;
    -webkit-appearance:none;
  }
  .input-wrap .caret{
    position:absolute;
    right:14px;
    top:50%;
    transform:translateY(-50%);
    color:#9aa4b1;
    font-size:11px;
    pointer-events:none;
  }
  .campo input[type="text"]:focus,
  .campo select:focus,
  .campo textarea:focus{
    border-color:var(--teal);
    background:#fff;
    box-shadow:0 0 0 3px rgba(34,182,163,0.12);
  }
  .campo textarea{
    width:100%;
    min-height:120px;
    padding:12px 14px;
    border:1px solid var(--borde);
    border-radius:8px;
    font-size:13.5px;
    color:var(--navy);
    background:#fbfcfd;
    resize:vertical;
    font-family:inherit;
    outline:none;
  }
  .contador{
    display:flex;
    justify-content:flex-end;
    font-size:11px;
    color:#9aa4b1;
    margin-top:5px;
  }
  .contador.limite{color:var(--error);}
  .error-msg{
    color:var(--error);
    font-size:11.5px;
    margin-top:6px;
    display:flex;
    align-items:center;
    gap:5px;
  }

  /* ZONA DE ARCHIVOS DRAG & DROP */
  .zona-archivo{
    border:1.5px dashed var(--borde);
    border-radius:10px;
    padding:22px 16px;
    text-align:center;
    cursor:pointer;
    background:#fbfcfd;
    transition:border-color 0.15s ease, background 0.15s ease;
  }
  .zona-archivo.dragover{
    border-color:var(--teal);
    background:#f0fbf9;
  }
  .zona-archivo .ico-nube{
    font-size:22px;
    color:var(--teal);
    display:block;
    margin-bottom:6px;
  }
  .zona-archivo .principal{
    font-size:13px;
    font-weight:600;
    color:var(--navy);
  }
  .zona-archivo .secundario{
    font-size:11.5px;
    color:var(--texto-gris);
    margin-top:3px;
  }
  .lista-archivos{
    margin-top:12px;
    display:flex;
    flex-direction:column;
    gap:8px;
  }
  .archivo-item{
    display:flex;
    align-items:center;
    gap:10px;
    background:#f4f9f8;
    border:1px solid #dcece9;
    border-radius:8px;
    padding:8px 12px;
    font-size:12px;
    color:var(--navy);
  }
  .archivo-item .ico{color:var(--teal);}
  .archivo-item .nombre-a{flex:1;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
  .archivo-item .quitar{
    color:#b5bdc7;
    cursor:pointer;
    font-weight:700;
    font-size:13px;
  }
  .archivo-item .quitar:hover{color:var(--error);}

  .acciones{
    display:flex;
    gap:14px;
    margin-top:32px;
  }
  .btn-enviar{
    display:inline-flex;
    align-items:center;
    gap:8px;
    background:var(--teal);
    border:none;
    color:#fff;
    font-weight:700;
    font-size:13.5px;
    padding:12px 24px;
    border-radius:24px;
    cursor:pointer;
    transition:filter 0.15s ease;
  }
  .btn-enviar:hover{filter:brightness(0.95);}
  .btn-cancelar{
    background:#fff;
    border:1px solid var(--navy);
    color:var(--navy);
    font-weight:700;
    font-size:13.5px;
    padding:12px 22px;
    border-radius:24px;
    cursor:pointer;
  }

  .confirmacion{
    display:none;
    text-align:center;
    padding:40px 10px;
  }
  .confirmacion.mostrar{display:block;}
  .confirmacion .check{
    width:56px;height:56px;border-radius:50%;
    background:#e4f7ef;
    color:var(--exito);
    display:flex;align-items:center;justify-content:center;
    font-size:26px;
    margin:0 auto 16px;
  }
  .confirmacion h3{margin:0 0 8px;font-size:18px;color:var(--navy);}
  .confirmacion p{margin:0;font-size:13px;color:var(--texto-gris);}

  footer{
    background:var(--navy);
    color:#c9d3e0;
    text-align:center;
    padding:16px;
    font-size:12px;
  }

  @media (max-width:900px){
    .split{flex-direction:column;}
    .panel-decorativo{flex:none;padding:36px 26px;}
    .lista-pasos{margin-top:26px;}
    .panel-form{padding:32px 22px 44px;}
  }
  @media (max-width:600px){
    nav{padding:14px 18px;}
    .nav-links{display:none;}
  }
</style>
</head>
<body>

<nav>
   <img src="Logo2.jpeg" alt="Conezha"
        style="width:210px !important; height:auto !important; max-width:210px !important;">
  </div>
  <button class="btn-sesion">Cerrar sesión</button>
</nav>

<div class="split">

  <!-- PANEL IZQUIERDO -->
  <div class="panel-decorativo">
    <div class="trayecto" id="trayecto">
      <!-- puntos generados por JS siguiendo el espíritu del hero -->
    </div>
    <h1>Cuéntanos qué<br>necesitas</h1>
    <p>Completa el formulario y uno de nuestros agentes dará seguimiento a tu solicitud lo antes posible.</p>

    <div class="lista-pasos">
      <div class="paso">
        <span class="num">1</span>
        <div class="txt"><strong>Completa el formulario</strong>Asunto, tipo de solicitud y tu mensaje.</div>
      </div>
      <div class="paso">
        <span class="num">2</span>
        <div class="txt"><strong>Adjunta evidencia</strong>Fotos, capturas o documentos si aplica.</div>
      </div>
      <div class="paso">
        <span class="num">3</span>
        <div class="txt"><strong>Recibe seguimiento</strong>Un agente se comunicará contigo por correo.</div>
      </div>
    </div>
  </div>

  <!-- PANEL DERECHO -->
  <div class="panel-form">
    <div class="tarjeta">

      <div id="vistaFormulario">
        <h2>Nueva solicitud</h2>
        <p class="subtitulo">Todos los campos marcados son obligatorios.</p>

        
        <form id="formSolicitud">
          <div class="campo">
            <label for="asunto"><span </span>Asunto</label>
            <div class="input-wrap">
             
              <input type="text" id="asunto" name="asunto" placeholder="Ej. Pedido no entregado" maxlength="80">
            </div>
          </div>

          <div class="campo">
            <label for="tipo"><span </span>Tipo de solicitud</label>
            <div class="input-wrap">
            
              <select id="tipo" name="tipo">
                <option value="">Selecciona una opción</option>
                <option value="pedido_no_entregado">Pedido no entregado</option>
                <option value="producto_defectuoso">Producto defectuoso</option>
                <option value="cambio_devolucion">Cambio o devolución</option>
                <option value="consulta_general">Consulta general</option>
                <option value="otro">Otro</option>
              </select>
              <span class="caret">&#9662;</span>
            </div>
          </div>

          <div class="campo">
            <label for="mensaje"><span</span>Mensaje</label>
            <textarea id="mensaje" name="mensaje" maxlength="500" placeholder="Cuéntanos con detalle tu solicitud"></textarea>
            <div class="contador" id="contador">0 / 500</div>
          </div>

          <div class="campo">
            <label><span</span>Adjuntar archivos</label>
            <div class="zona-archivo" id="zonaArchivo">
              
              <div class="principal">Arrastra tus archivos aquí o haz clic para elegirlos</div>
              <div class="secundario">PNG, JPG o PDF · máx. 5 MB por archivo</div>
              <input type="file" id="inputArchivo" multiple style="display:none;">
            </div>
            <div class="lista-archivos" id="listaArchivos"></div>
          </div>

          <div class="acciones">
            <button type="submit" class="btn-enviar">Enviar solicitud</button>
            <button type="button" class="btn-cancelar" id="btnCancelar">Cancelar</button>
          </div>
        </form>
      </div>

      <div class="confirmacion" id="vistaConfirmacion">
        <h3>Solicitud enviada</h3>
        <p>Recibimos tu mensaje. Un agente se pondrá en contacto contigo a la brevedad.</p>
        <div class="contenedor-volver">
    <a href="pagina principal.jsp" class="btn-volver">
        Volver al inicio
    </a>
</div>

    </div>
  </div>

</div>

<footer>© Conezha ? Servicio de Atención</footer>

<script>
    
  /* --- trayecto decorativo tipo hero --- */
  const trayecto = document.getElementById('trayecto');
  const puntosDef = [
    {x:15, y:12, tipo:'teal'},
    {x:55, y:28},
    {x:30, y:50},
    {x:60, y:70, tipo:'teal'},
    {x:20, y:88}
  ];
  const ns = "http://www.w3.org/2000/svg";
  const svg = document.createElementNS(ns, "svg");
  svg.setAttribute("viewBox","0 0 100 100");
  svg.setAttribute("preserveAspectRatio","none");
  svg.style.width="100%";
  svg.style.height="100%";
  const path = document.createElementNS(ns,"path");
  let d = `M ${puntosDef[0].x} ${puntosDef[0].y}`;
  for(let i=1;i<puntosDef.length;i++){
    d += ` L ${puntosDef[i].x} ${puntosDef[i].y}`;
  }
  path.setAttribute("d", d);
  path.setAttribute("stroke","rgba(255,255,255,0.5)");
  path.setAttribute("stroke-width","0.4");
  path.setAttribute("fill","none");
  path.setAttribute("stroke-dasharray","1.2,2.2");
  svg.appendChild(path);
  trayecto.appendChild(svg);

  puntosDef.forEach(p=>{
    const dot = document.createElement('div');
    dot.className = 'punto' + (p.tipo === 'teal' ? ' teal' : '');
    dot.style.left = p.x + '%';
    dot.style.top = p.y + '%';
    trayecto.appendChild(dot);
  });

  /* --- contador de mensaje --- */
  const mensaje = document.getElementById('mensaje');
  const contador = document.getElementById('contador');
  mensaje.addEventListener('input', () => {
    const len = mensaje.value.length;
    contador.textContent = `${len} / 500`;
    contador.classList.toggle('limite', len >= 480);
  });

  /* --- zona de archivos --- */
  const zonaArchivo = document.getElementById('zonaArchivo');
  const inputArchivo = document.getElementById('inputArchivo');
  const listaArchivos = document.getElementById('listaArchivos');
  let archivos = [];

  zonaArchivo.addEventListener('click', () => inputArchivo.click());
  inputArchivo.addEventListener('change', () => {
    agregarArchivos(inputArchivo.files);
    inputArchivo.value = '';
  });
  ['dragover','dragenter'].forEach(ev=>{
    zonaArchivo.addEventListener(ev, e=>{
      e.preventDefault();
      zonaArchivo.classList.add('dragover');
    });
  });
  ['dragleave','drop'].forEach(ev=>{
    zonaArchivo.addEventListener(ev, e=>{
      e.preventDefault();
      zonaArchivo.classList.remove('dragover');
    });
  });
  zonaArchivo.addEventListener('drop', e=>{
    agregarArchivos(e.dataTransfer.files);
  });

  function agregarArchivos(fileList){
    Array.from(fileList).forEach(f => archivos.push(f));
    renderArchivos();
  }
  function renderArchivos(){
    listaArchivos.innerHTML = '';
    archivos.forEach((f, idx)=>{
      const item = document.createElement('div');
      item.className = 'archivo-item';
      item.innerHTML = `<span class="ico">&#128206;</span><span class="nombre-a">${f.name}</span><span class="quitar" data-idx="${idx}">&times;</span>`;
      listaArchivos.appendChild(item);
    });
    listaArchivos.querySelectorAll('.quitar').forEach(el=>{
      el.addEventListener('click', ()=>{
        archivos.splice(parseInt(el.dataset.idx),1);
        renderArchivos();
      });
    });
  }

  /* --- envío del formulario --- */
  const form = document.getElementById('formSolicitud');
  const vistaFormulario = document.getElementById('vistaFormulario');
  const vistaConfirmacion = document.getElementById('vistaConfirmacion');

  document.getElementById('btnCancelar').addEventListener('click', () => {
    form.reset();
    archivos = [];
    renderArchivos();
    contador.textContent = '0 / 500';
  });

  form.addEventListener('submit', function(e){
    e.preventDefault();
    const asunto = document.getElementById('asunto').value.trim();
    const msj = mensaje.value.trim();
    document.querySelectorAll('.error-msg').forEach(el => el.remove());

    let valido = true;
    if(!asunto){
      mostrarError('asunto');
      valido = false;
    }
    if(!msj){
      mostrarError('mensaje', true);
      valido = false;
    }
    if(valido){
      vistaFormulario.style.display = 'none';
      vistaConfirmacion.classList.add('mostrar');
    }
  });

  function mostrarError(id, esTextarea){
    const err = document.createElement('div');
    err.className = 'error-msg';
    err.textContent = 'Debes completar este campo';
    const el = document.getElementById(id);
    const destino = esTextarea ? contador : el;
    destino.insertAdjacentElement('afterend', err);
  }
  
</script>

</body>
</html>