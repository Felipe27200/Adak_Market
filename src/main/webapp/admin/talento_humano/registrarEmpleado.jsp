<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (session.getAttribute("usuario") != null)
{
    request.getContextPath();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Registrar Empleado</title>
    </head>
    <body>
        <!-- Contenedor -->
        <div class="container-fluid">
            <header>
                <jsp:include page="/WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>
            </header>

            <!-- Fila barra lateral y contenido -->
            <div class="row">
                <!-- Columna barra navegacion lateral izquierda -->
                <div class="col-md-3">
                    <nav id="Menu" class="d-md-block collapse bg-light navbar-light pl-4">
                        <div class="navTitulo">
                            <h1>Gestión Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="registrarEmpleado.jsp"  class="nav-link"><i class="fas fa-user-plus"></i> Registrar Empleado</a></li>			
                            <li class="nav-item"><a href="reporteEmpleado.jsp" class="nav-link"><i class="far fa-address-card"></i> Consultar Empleado</a></li>	
                        </ul>

                        <div class="navTitulo">
                            <h1>Contrato Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="reporteContratoTablas.jsp" class="nav-link"><i class="fas fa-id-badge"></i> Consultar contratos</a></li>
                        </ul>

                        <div class="navTitulo">
                            <h1>Agenda Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="reporteAgendaTablas.jsp" class="nav-link"><i class="fas fa-calendar-alt"></i> Consultar agenda empleado</a></li>
                        </ul>
                    </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9">
                    <form class="font-weight-bold" id="formulario" onsubmit="return validarEmpleado();">
                        <div class="form-group text-center mt-4">
                            <img src="../../img/formularios/delantal.png" class="img-fluid" style="width: 7%;" alt="">
                            <p style="font-size: 25px;">Registrar Empleado</p>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Nombre</label>
                                <input type="text" class="form-control" id="nombres" name="nombres" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="">Tipo de documento</label>
                                <select name="tipoDocumento" class="form-control" required="">
                                    <option value="">Seleccione</option>
                                    <option value="Cédula de Ciudadanía">Cédula de Ciudadanía</option>
                                    <option value="Cédula de Extranjería">Cédula de Extranjería</option>
                                    <option value="Pasaporte">Pasaporte</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">No. Identificación</label>
                                <input type="number" id="documento" name="documento" class="form-control" required>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">Fecha de Nacimiento</label>
                                <input type="date" min="1960-01-01" max="2003-03-31" name="nacimiento" class="form-control" required>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">Edad</label>
                                <input type="number" id="edad" name="edad" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Teléfono</label>
                                <input type="tel" id="telefono" name="telefono" class="form-control" required placeholder="3132459709" pattern="+[0-9]{2}-[0-9]{10}">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="">Correo Electrónico</label>
                                <input type="email" id="correo" name="correo" class="form-control" placeholder="ejemplo@gmail.com">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="">Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion"  required placeholder="Dirección de su residencia">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-2">
                                <label for="">Género</label>
                                <select name="genero" id="genero" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <option value="F">Femenino</option>
                                    <option value="M">Masculino</option>
                                    <option value="O">Otro</option>
                                </select>
                            </div>

                            <div class="form-group col-md-2">
                                <label for="">Nivel de Formación</label>
                                <select name="formacion" id="formacion" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <option value="Bachiller">Bachiller</option>
                                    <option value="Técnico">Técnico</option>
                                    <option value="Tecnológo">Tecnológo</option>
                                    <option value="Profesional">Profesional</option>
                                </select>
                            </div>

                            <div class="form-group col-md-2">
                                <label for="">Cargo</label>
                                <select name="cargo" id="cargo" class="form-control" required>
                                    <option value="">Seleccione</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Cajero">Cajero</option>
                                    <option value="Dependiente">Dependiente</option>
                                    <option value="Surtidor">Surtidor</option>
                                </select>
                            </div>

                            <div class="form-group col-md-5">
                                <label>Contraseña Provisional</label>
                                <input type="password" name="password" minlength="8" class="form-control">
                            </div>
                        </div>
                        <button type="submit" name="registrarEmpleado" class="btn btn-success btn-block mb-2">Registrar Empleado</button>
                    </form>

                    <%
                        if (request.getParameter("registrarEmpleado") != null) {
                            String nombres = request.getParameter("nombres") + " " + request.getParameter("apellidos");
                            String tipoDocumento = request.getParameter("tipoDocumento");
                            int documento = Integer.parseInt(request.getParameter("documento"));
                            String nacimiento = request.getParameter("nacimiento");
                            int edad = Integer.parseInt(request.getParameter("edad"));
                            String telefono = request.getParameter("telefono");
                            String correo = request.getParameter("correo");
                            String direccion = request.getParameter("direccion");
                            String genero = request.getParameter("genero");
                            String formacion = request.getParameter("formacion");
                            String cargo = request.getParameter("cargo");
                            String password = request.getParameter("password");
                            
                            int rol = 0;

                            switch (cargo)
                            {
                                case "Administrador":
                                    rol = 1;
                                    break;
                                default:
                                    rol = 2;
                            }

                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                con = Conexion.conectar();
                                sta = con.createStatement();
                                sta.executeUpdate("INSERT INTO usuarios(id_usuario, id_rol, nombre, correo, tipo_documento, direccion, fecha_nacimiento, formacion, telefono, edad, genero, cargo, estado, contrasenia)"
                                        + "VALUES('" + documento + "', '" + rol + "', '" + nombres + "', '" + correo + "', '" + tipoDocumento + "', '" + direccion + "', '" + nacimiento + "', '" + formacion + "', '" + telefono + "', '" + edad + "', '" + genero + "', '" + cargo + "', 1, '" + password + "')");

                                // ESTABLECER CONTRATO DEL EMPLEADO
                                sta.executeUpdate("INSERT INTO contratos (id_usuario) VALUE('"+documento+"')");
                                
                                /* ASIGNAR AGENDA EMPLEADO */
                                for (int dia = 1; dia <= 7; dia++)
                                {
                                    sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', '"+dia+"')");                                    
                                }
                                
                                /* sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Lunes'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Martes'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Miércoles'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Jueves'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Viernes'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Sábado'");
                                sta.executeUpdate("INSERT INTO agendas (usuario_id_usuario, dia) VALUE ('"+documento+"', 'Domingo'"); */

                                //request.setAttribute("identificacion", documento);
                                request.getRequestDispatcher("reporteContratoTablas.jsp").forward(request, response);

                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(con);
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    %>

                </div>					  	
            </div>


            <!-- Script -->
            <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
            <script src="../../js/popper.min.js"></script>
            <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
             <script type="text/javascript" src="../../js/registrarEmpleado.js"></script> 

            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
