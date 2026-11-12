# CONEZHYA

**Conexión que soluciona, excelencia que sorprende.**

Aplicación web para registrar, gestionar y dar seguimiento a solicitudes (quejas, reclamos, peticiones y sugerencias). Proyecto desarrollado en el programa de Análisis y Desarrollo de Software del SENA.

## ¿En qué consiste?

Una persona se registra, inicia sesión y envía una solicitud con asunto, tipo, mensaje y un archivo adjunto. Cada solicitud recibe un radicado único (CNZ seguido de números y letras) y pasa por los estados **Recibida**, **En proceso** y **Respondida**.

## Roles

| Rol | Qué puede hacer |
|---|---|
| Usuario | Crear solicitudes, ver su estado y la respuesta del agente, y actualizar su correo, contraseña y celular |
| Agente | Revisar, atender y responder las solicitudes |
| Administrador | Gestionar usuarios, supervisar solicitudes y ver reportes |

Además, cualquier persona puede consultar el estado de una solicitud sin registrarse, solo con el número de radicado.

## Tecnologías utilizadas

- Java 21 (JSP y Servlets)
- HTML
- MySQL (puerto 3306)
- Apache Tomcat (puerto 8080)
- Apache NetBeans
- Conector `mysql-connector-j-8.4.0.jar`
- Postman (pruebas)

## Estructura del repositorio

| Carpeta o archivo | Contenido |
|---|---|
| `src` | Código fuente Java (clases, conexión y servlets) |
| `web` | Páginas JSP y HTML de las interfaces |
| `proyecto nb` | Archivos de configuración del proyecto en NetBeans |
| `build.xml` | Configuración de compilación |

## Base de datos

- Motor: MySQL
  

## Instalación y ejecución

1. Instalar JDK 21, Apache NetBeans, Apache Tomcat y MySQL.
2. Descargar o clonar este repositorio.
3. Abrir el proyecto en NetBeans.
4. Crear la base de datos `adso_sena` en MySQL y ejecutar el script de las tablas.
5. Revisar los datos de conexión (usuario y contraseña de MySQL) en la clase `ConexionBD.java`.
6. Verificar que el conector `mysql-connector-j-8.4.0.jar` esté agregado a las librerías del proyecto.
7. Ejecutar el proyecto con Tomcat.



Lilibeth Maria Revolledo Romero
Aprendiz de Análisis y Desarrollo de Software, SENA, ficha 3336243
