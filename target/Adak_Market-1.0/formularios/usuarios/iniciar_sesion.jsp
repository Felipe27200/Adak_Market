<%-- 
    Document   : iniciar_sesion
    Created on : 19/05/2021, 08:26:06 AM
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
	<title>Iniciar Sesión</title>
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
				        <a class="nav-link" href="../../index.jsp" style="font-size: 20px;"><i class="fas fa-home"></i> Inicio</a>
				      </li>
				    </ul>
				  </div>
				</nav>
			</div>
		</div>	

		<div class="row justify-content-around mt-5 pt-5">
			<div class="col-lg-4 col-md-6 col-sm-8 color1">
				<div class="form-group text-center pt-5">
					<img src="../../img/formularios/usuario.png" class="img-fluid  w-25 borderImagen" alt="">
				</div>

                            <form action="/Adak_Market/srvUsuario?accion=verificar" method="POST" class="font-weight-bold">
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


				<a href="registrarUsuario.jsp" class="text-decoration-none font-weight-bold">Registrarse</a>
				<a href="recuperarContrasenia.jsp" class="text-decoration-none mb-3 float-right font-weight-bold">Olvide mi contraseña</a>
			</div>		
		</div>

	<script src="../../js/jquery-3.5.1.slim.min.js"></script>
	<script src="../../js/popper.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!--	<script type="text/javascript">

		function validarUsuario(){

			var email= document.getElementById("email").value;
			var clave= document.getElementById("password").value;

			//el rol admin ingresa al dashboard con las funcionalidades de su rol


			if(email === "admin@gmail.com" && clave ==="admin"){

				window.location.href="../../admin/talento_humano/dashboard_talento_humano.html";
				return false;
			}

			if(email === "empleado@gmail.com" && clave ==="empleado"){

				window.location.href="../../admin/talento_humano/dashboard_Empleado.html";
				return false;
			}

			else {

				swal({

					title: "credenciales",
					text: "Acceso incorrecto, Intenta nuevamente!",
					icon: "warning",
				});
				return false;
			}
		}	
	</script>-->
    </body>
</html>
