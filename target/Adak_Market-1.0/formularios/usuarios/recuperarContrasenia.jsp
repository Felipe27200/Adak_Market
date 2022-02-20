<%-- 
    Document   : recuperarContrasenia
    Created on : 19/05/2021, 08:28:19 AM
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../myCss/formulariosUsuario.css">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Recuperar Contraseña</title>
    </head>
    <body class="fondoUsuario">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <nav class="navbar navbar-expand-sm navbar-light bg-light">
                        <a class="navbar-brand" href="#"></a>
                        <img src="../../img/Logotipo Adak.png" style="width: 3%;">

                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#Menu">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse justify-content-end" id="Menu">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="../../index.jsp" style="font-size: 20px;"><i class="fas fa-home"></i>Inicio</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>	

            <div class="row justify-content-around mt-5 pt-5">
                <div class="col-lg-4 col-md-6 col-sm-8 color1">
                    <div class="form-group text-center pt-5">
                        <img src="../../img/formularios/codigo-pin.png" class="img-fluid  w-25 borderImagen" alt="">
                        <h4>Recuperar Contraseña</h4>
                    </div>

                    <form class="font-weight-bold pb-3" action="<%=request.getContextPath()%>/SendMail?accion=recuperar" method="POST">
                        <div class="form-group mt-3">
                            <label for="">Ingrese su No. de Documento</label>
                            <input type="number" id="id_usuario" name="id_usuario" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-block btn-success">Recuperar Contraseña</button>				
                    </form>
                </div>		
            </div>
        </div>

        <script src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script src="../../js/popper.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <!--<script type="text/javascript">
            function validarUsuario() {

                var identificacion = document.getElementById("identificacion").value;

                //el rol admin ingresa al dashboard con las funcionalidades de su rol


                if (identificacion == 10000888222) {
                    swal({

                        title: "Identificación válida",
                        text: "se enviara un correo a su email para recuperar la contraseña!",
                        icon: "success",
                    });

                    return false;
                } else {
                    swal({

                        title: "credenciales",
                        text: "No. de documento no reconocido",
                        icon: "warning",
                    });
                    return false;
                }
            }
        </script>-->
    </body>
</html>
