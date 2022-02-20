<%-- 
    Document   : index
    Created on : 19/05/2021, 07:43:18 AM
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="short icon" href="img/Logotipo Adak.png">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="myCss/myStyle.css">
        <title>Adak Market</title>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Barra de Navegación -->
            <div class="row">
                <div class="col">
                    <nav class="navbar navbar-expand-md bg-light navbar-light">
                        <a href="#" class="navbar-brand"></a>
                        <img src="img/Logotipo Adak.png" style="width: 100px">
                        <!-- Permite retraer el menú al cambiar la resolución -->
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#Menu">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <!-- Contenido y lista del menú -->
                        <div class="collapse navbar-collapse justify-content-end" id="Menu">
                            <ul class="navbar-nav ">
                                <li class="nav-item"><a href="#" class="nav-link ">Home</a></li>
                                <li class="nav-item"><a href="#somos" class="nav-link ">Quiénes Somos</a></li>
                                <li class="nav-item"><a href="#beneficios" class="nav-link ">Beneficios</a></li>
                                <li class="nav-item"><a href="#servicios" class="nav-link ">Servicios</a></li>

                                <li class="nav-item"><a href="formularios/usuarios/iniciar_sesion.html" class="nav-link btn btn-outline-success" data-toggle="modal" data-target="#usuario">Ingresar</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <div class="row justify-content-around">
                <div class="col">
                    <div id="imagen" class="carousel slide" data-ride="carousel">
                        <!-- Indicadores -->
                        <ul class="carousel-indicators">
                            <li data-target="imagen" data-slide-to="0" class="active"></li>
                            <li data-target="imagen" data-slide-to="1"></li>
                            <li data-target="imagen" data-slide-to="2"></li>
                        </ul>

                        <!-- Imagenes -->
                        <div class="carousel-inner img-fluid">
                            <div class="carousel-item active">
                                <img src="img/happy-female.jpg" class="img-fluid">

                                <div class="carousel-caption">
                                    <h1 class="bg-success pt-2 pb-2">SOFTWARE PARA LA GESTIÓN EFECTIVA DE SU NEGOCIO</h1>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="img/mujer_comprando.jpg" class="img-fluid">

                                <div class="carousel-caption">
                                    <h1 class="bg-success pt-2 pb-2">Con Adak podrá tener el control total de la información</h1>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="img/vista_superior_Supermarket.jpg" class="img-fluid">

                                <div class="carousel-caption">
                                    <h1 class="bg-success pt-2 pb-2">El software ideal para la gestión de los procesos relacionados con: inventario, proveedores y talento humano</h1>
                                </div>
                            </div>
                        </div>

                        <a href="#imagen" class="carousel-control-prev" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>

                        <a href="#imagen" class="carousel-control-next" data-slide="next"><span class="carousel-control-next-icon"></span></a>
                    </div>
                </div>
            </div>

            <div class="row mt-5 color4" id="servicios">
                <div class="col text-center text-white border border-success">
                    <h2 class="display-3">SERVICIOS</h2>
                </div>		
            </div>

            <div class="row mt-3 pt-5">
                <div class="col-lg-6 md-6">
                    <div class="col-header text-center">
                        <h3>Inventario</h3>
                    </div>
                    <img src="img/Servicios/inventario.png" class="img-fluid pl-3 float-left" style="width: 20%;" alt="">

                    <p class="pt-4">Adak le permitirá registrar y ordenar sus productos, consiguiendo un control absoluto de su inventario</p>
                </div>

                <div class="col-lg-6 md-6">
                    <div class="col-header text-center">
                        <h3>Proveedores</h3>
                    </div>
                    <img src="img/Servicios/Proveedores.png" class="img-fluid pl-3 mr-2 float-left" style="width: 20%;" alt="">

                    <p class="pt-5">Almacene y gestione la información relacionada con sus proveedores y pedidos</p>
                </div>
            </div>

            <div class="row mt-3 pt-5">
                <div class="col-lg-6 md-6">
                    <div class="col-header text-center">
                        <h3>Talento Humano</h3>
                    </div>
                    <img src="img/TalentoHumano/empleado.png" class="img-fluid pl-3 float-left" style="width: 20%;" alt="">

                    <p class="pt-5">Gestione la información personal de sus empleados, contratos y horarios</p>
                </div>

                <div class="col-lg-6 md-6">
                    <div class="col-header text-center">
                        <h3>Reportes</h3>
                    </div>
                    <img src="img/Servicios/Reporte.png" class="img-fluid pl-3 float-left" style="width: 20%;" alt="">

                    <p class="pt-5">Obtenga reporte precisos de estos procesos</p>
                </div>
            </div>

            <div class="row color4 mt-5 pb-1" id="beneficios" >
                <div class="col text-white text-center border border-success mt-2">
                    <h2 class="display-3">BENEFICIOS</h2>
                </div>
            </div>

            <div class="row justify-content-around text-center mt-5">
                <div class="col-lg-6 md-6">
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <div class="card h-100">
                                <div class="card-body">
                                    <img src="img/Beneficios/carrito.jpg" class="img-fluid pt-2" alt="">

                                    <div class="card-title">
                                        <p class="pt-2" style="font-size: 30px;">Velocidad</p>
                                    </div>

                                    <p class="text-center">Velocidad en la gestión de sus procesos para mantener al día su información</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 mb-2">
                            <div class="card h-100">
                                <div class="card-body">
                                    <img src="img/Beneficios/facilidad.jpg" class="img-fluid pt-2" alt="">

                                    <div class="card-title">
                                        <p class="pt-2" style="font-size: 30px;">Facilidad</p>
                                    </div>
                                    <p class="text-center pt-2">Un uso fácil y eficaz para permitir el mayor alcance</p>
                                </div>
                            </div>
                        </div>					
                    </div>
                </div>

                <div class="col-lg-6 md-6">
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <div class="card h-100">
                                <div class="card-body">
                                    <img src="img/Beneficios/procesos.jpg" class="img-fluid" alt="">
                                    <div class="card-title">
                                        <p class="pt-2" style="font-size: 30px;">Automatizar</p>
                                    </div>
                                    <p>Automatice y haga más fácil y sencillo la gestión de los procesos</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 sm-6 mb-2">
                            <div class="card h-100">
                                <div class="card-body">
                                    <img src="img/Beneficios/disponibilidad2.png" class="img-fluid pt-2" alt="">

                                    <div class="card-title">
                                        <p class="pt-2" style="font-size: 30px;">Disponibilidad</p>
                                    </div>

                                    <p class="pt-2">Su información siempre estará disponible</p>
                                </div>
                            </div>
                        </div>				
                    </div>
                </div>
            </div>

            <div class="row mt-5 mb-5 color3" id="somos">
                <div class="col text-center">
                    <h2 class="pt-1 display-3">QUIÉNES SOMOS</h2>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-6">
                    <img src="img/Mujer_ordenando_estante.jpg" class="img-fluid float-left" alt="">
                </div>

                <div class="col-6">
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        ¿Qué hacemos?
                                    </button>
                                </h2>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    Somos un servicio que ayuda a facilitar los procesos administrativos de su negocio.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        ¿En que nos centramos?
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    Abarcamos los procesos de inventario, talento humano, administración de proveedores y pedidos.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingThree">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        ¿Qué nos motivo?
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                <div class="card-body">
                                    Esta idea surgió con el fin de ayudar a simplificar y automatizar el área administrativa de los autoservicios y supermercados, brindado un servicio de calidad que haga más sencilla la gestión de cualquier negocio en este sector económico.
                                </div>
                            </div>
                        </div>
                    </div>			
                </div>
            </div>
            <div class="row mt-3 justify-content-between">
                <div class="col-lg-4 col-md-4 ">
                    <div class="row no-gutters">
                        <div class="col-4">
                            <img src="img/Logotipo Adak.png" class="img-fluid float-left pr-1" alt="">
                        </div>

                        <div class="col-8">
                            <h3>Ubicación</h3>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><a href="https://www.google.com/maps/place/Cl.+80+%2360-95,+Bogot%C3%A1/@4.6790675,-74.0780614,17z/data=!3m1!4b1!4m5!3m4!1s0x8e3f9ae26476700d:0x2e4da908ebb5a97f!8m2!3d4.6790675!4d-74.0758727">Calle 80 No. 60-95</a></li>
                                <li class="list-group-item">Barrio: Entre Ríos</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 mb-3 text-center">
                    <h5>Contáctenos</h5>
                    <a class="btn btn-info col-lg-6 col-md-8 col-sm-6" href="enviarCorreo.jsp">Enviar un Correo</a>
                </div>

                <div class="col-lg-4 col-md-4">
                    <h5>Nuestro Equipo</h5>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-linkedin text-center" viewBox="0 0 16 16">
                    <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
                    </svg>
                    <i class="bi bi-linkedin text-center" style="font-size: 20px;">LinkedIn</i>


                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a href="https://www.linkedin.com/in/felipe-zea-s%C3%A1nchez-1408721aa/">Juan Felipe Zea Sánchez</a></li>
                        <li class="list-group-item"><a href="https://www.linkedin.com/in/angie-mendoza-752315204/">Angie Daniela Mendoza Segura</a></li>
                        <li class="list-group-item"><a href="https://www.linkedin.com/in/diego-sanchez-000656208/">Diego David Sánchez Valenzuela</a></li>
                    </ul>
                </div>
            </div>

            <!-- modal -->

            <div class="modal" id="usuario">

                <div class="modal-dialog">
                    <div class="modal-content bg-light ">
                        <!-- encabezado -header -->
                        <div class="modal-header">
                            <h4>Iniciar Sesión</h4>
                            <button type="button" class="close" data-dismiss="modal">&Otimes;</button>
                        </div>
                        <!-- Contenido -body- -->
                        <div class="modal-body">
                            <form action="<%=request.getContextPath()%>/srvUsuario?accion=verificar" method="POST" class="font-weight-bold">
                                <div class="form-group">
                                    <label>No. Documento: </label>
                                    <input type="number" class="form-control" required="" id="id_usuario" name="id_usuario">
                                </div>

                                <div class="form-group">
                                    <label for="">Contraseña: </label>
                                    <input type="password" id="password" name="password" class="form-control" required>
                                </div>

                                <input type="submit" class="btn btn-block btn-success mb-3 font-weight-bold" name="verificar" value="Verificar">
                            </form>

                            <a href="recuperarContrasenia.jsp" class="text-decoration-none mb-3 text-center font-weight-bold">Olvide mi contraseña</a>
                        </div>	
                    </div>
                    <!-- Pie de modal -->

                </div>
            </div>
        </div>


        <script src="js/jquery-3.5.1.slim.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>	

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <script type="text/javascript">

            function validarUsuario() {

                var email = document.getElementById("email").value;
                var clave = document.getElementById("password").value;

                //el rol admin ingresa al dashboard con las funcionalidades de su rol


                if (email === "admin@gmail.com" && clave === "admin") {

                    window.location.href = "admin/talento_humano/dashboard_talento_humano.jsp";
                    return false;
                }

                if (email === "empleado@gmail.com" && clave === "empleado") {

                    window.location.href = "admin/talento_humano/dashboard_Empleado.jsp";
                    return false;
                } else {

                    swal({

                        title: "credenciales",
                        text: "Acceso incorrecto, Intenta nuevamente!",
                        icon: "warning",
                    });
                    return false;
                }
            }
        </script>
    </body>
</html>
