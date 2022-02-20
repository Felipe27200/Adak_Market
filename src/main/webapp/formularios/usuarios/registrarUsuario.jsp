<%-- 
    Document   : registrarUsuario
    Created on : 19/05/2021, 08:40:42 AM
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
	<title>Registrar Usuario</title>
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

		<div class="row justify-content-around mt-5">
			<div class="col-lg-9 col-md-11 color1">
				<form class="font-weight-bold pb-3" onsubmit="return validarRegistro();">
					<div class="form-group text-center mt-4">
						<img src="../../img/formularios/iniciar-sesion.png" class="img-fluid" style="width: 7%;" alt="">
						<p style="font-size: 25px;">Registrarse</p>
					</div>

					  <div class="form-row">
					    <div class="form-group col-md-6">
					      <label for="">Nombre</label>
					      <input type="text" class="form-control" id="nombre" required="">
					    </div>
					    <div class="form-group col-md-6">
					      <label for="inputPassword4">Apellidos</label>
					      <input type="text" class="form-control" id="apellidos" required="">
					    </div>
					  </div>

					  <div class="form-row">
						    <div class="form-group col-md-3">
						      <label for="">Tipo de documento</label>
						      <select id="" class="form-control" required="">
						        <option>Seleccione</option>
						        <option>Cédula de Ciudadanía</option>
						        <option>Cédula de Extranjería</option>
						        <option>Pasaporte</option>
						      </select>
						    </div>

						    <div class="form-group col-md-3">
						    	<label for="">No. Identificación</label>
						    	<input type="number" id="identificacion" class="form-control" required="">
						    </div>

						    <div class="form-group col-md-3">
						    	<label for="">Fecha de Nacimiento</label>
						    	<input type="date" class="form-control" min="1960-01-01" max="2003-03-31" required="">
						    </div>

						    <div class="form-group col-md-3">
					    		<label for="">Edad</label>
					    		<input type="number" id="edad" class="form-control" required="">
					    	</div>
					   </div>

					   <div class="form-row">
					   		<div class="form-group col-md-4">
					   			<label for="">Teléfono</label>
					   			<input type="tel" id="telefono" class="form-control" required="" placeholder="+57-3132459709">
					   		</div>

					   		<div class="form-group col-md-4">
					   			<label for="">Dirección</label>
					   			<input type="text" class="form-control" id="direccion" placeholder="Dirección de su residencia">
					   		</div>

					   		<div class="form-group col-md-4">
					   			<label for="">Correo Electrónico</label>
					   			<input type="email" id="correo" class="form-control" placeholder="ejemplo@gmail.com">
					   		</div>
					   	</div>

						<label>Género:</label>

					<div class="col mb-3">
						<div class="form-check form-check-inline">
						   <input class="form-check-input" type="radio" name="inlineRadioOptions" checked="">
						  <label class="form-check-label">Femenino</label>
						</div>

						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="inlineRadioOptions" >
						  <label class="form-check-label">Masculino</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="inlineRadioOptions">
						  <label class="form-check-label" for="inlineRadio2">Otro</label>
						</div>
					</div>						

					<button type="submit" class="btn btn-success btn-block font-weight-bold">Registrarse</button>
  				</form>					
			</div>		
		</div>

	<script src="../../js/jquery-3.5.1.slim.min.js"></script>
	<script src="../../js/popper.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>	

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="../../js/validarUsuario.js"></script>
    </body>
</html>
