<%-- 
    Document   : editarAdmin
    Created on : 19/05/2021, 07:51:56 AM
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("usuario") != null) {
        //request.getContextPath();
        String mensaje = request.getParameter("mensaje");
        //Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <link rel="stylesheet" href="../../DataTables/datatables.min.css">
        <title>Talento Humano</title>
    </head>
    <body>
        <!-- Contenedor -->
        <div class="container-fluid">
            <!-- Fila barra navegación superior -->
            <jsp:include page="../../WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>

            <!-- Fila barra lateral y contenido -->
            <div class="row">
                <!-- Columna barra navegacion lateral izquierda -->
                <div class="col-md-3">
                    <nav id="Menu" class="d-md-block collapse bg-light navbar-light pl-4">
                        <div class="navTitulo">
                            <h1>Módulos</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="../inventario/consultar_inventario1.jsp"  class="nav-link"><i class="fas fa-cubes"></i> Inventario</a></li>			
                            <li class="nav-item"><a href="../proveedores_pedidos/dashboard_proveedores.jsp"  class="nav-link"><i class="fas fa-dolly"></i> Proveedores y Pedidos</a></li>	
                            <li class="nav-item"><a href="../talento_humano/reporteEmpleado.jsp"  class="nav-link"><i class="fas fa-id-badge"></i> Talento Humano</a></li>	
                        </ul>
                    </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9 mt-4">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="../img/Angie.jpg" style="width: 70%;" class="float-sm-center" alt="">
                        </div>
                        <div class="col-md-8 pt-4">
                            <h4>${usuario.nombre}</h4>
                            <p>${usuario.cargo}</p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md mt-2">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-datos" role="tab" aria-controls="nav-datos" aria-selected="true">Datos Personales</a>
                                    <a class="nav-link" id="nav-agenda-tab" data-toggle="tab" href="#nav-agenda" role="tab" aria-controls="nav-agenda" aria-selected="false">Administrar Cuenta</a>
                                    <a class="nav-link" id="nav-contrasenia-tab" data-toggle="tab" href="#nav-contrasenia" role="tab" aria-controls="nav-contrasenia" aria-selected="false">Cambiar Contraseña</a>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-datos" role="tabpanel" aria-labelledby="nav-datos-tab">
                                    <div class="row no-gutters">
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Género</h5>
                                            <p>${usuario.genero}</p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Edad</h5>
                                            <p>${usuario.edad}</p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Formación</h5>
                                            <p>${usuario.formacion}</p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Tipo de Documento</h5>
                                            <p>${usuario.tipo_documento}</p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>No. Documento</h5>
                                            <p>${usuario.id_usuario}</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Fecha de Nacimiento</h5>
                                            <p>${usuario.fecha_nacimiento }</p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Teléfono</h5>
                                            <p>${usuario.telefono}</p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Dirección</h5>
                                            <p>${usuario.direccion}</p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Correo Electrónico</h5>
                                            <p>${usuario.correo}</p>
                                        </div>
                                    </div>


                                </div>
                                <div class="tab-pane fade" id="nav-agenda" role="tabpanel" aria-labelledby="nav-agenda-tab">							
                                    <!-- <div class="row"> -->
                                    <div class="row">
                                        <div class="col-md">
                                            <form method="POST" action="<%=request.getContextPath()%>/srvUsuario?accion=editarUsuario" class="font-weight-bold" id="formulario" onsubmit="return validarCambios();">
                                                <div class="form-group text-center mt-4">
                                                    <img src="../../img/formularios/delantal.png" class="img-fluid" style="width: 7%;" alt="">
                                                    <p style="font-size: 25px;">Pulse la casilla para editar los datos</p>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md">
                                                        <label for="">Nombre</label>
                                                        <input type="text" class="form-control" value="${usuario.nombre}" name="nombre" required="">
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
                                                        <input type="number" name="id_usuario" readonly="readonly"  value="${usuario.id_usuario}" class="form-control" required="">
                                                    </div>

                                                    <div class="form-group col-md-3">
                                                        <label for="">Fecha de Nacimiento</label>
                                                        <input type="date" min="1960-01-01" max="2003-03-31" value="${usuario.fecha_nacimiento}" name="nacimiento" class="form-control" required="">
                                                    </div>

                                                    <div class="form-group col-md-3">
                                                        <label for="">Edad</label>
                                                        <input type="number" name="edad" value="${usuario.edad}" class="form-control" required="">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-4">
                                                        <label for="">Teléfono</label>
                                                        <input type="tel" name="telefono" value="${usuario.telefono}" class="form-control" required="" placeholder="3132459709" pattern="+[0-9]{2}-[0-9]{10}">
                                                    </div>
                                                    <div class="form-group col-md-4">
                                                        <label for="">Correo Electrónico</label>
                                                        <input type="email" name="correo" value="${usuario.correo}" class="form-control" placeholder="ejemplo@gmail.com">
                                                    </div>

                                                    <div class="form-group col-md-4">
                                                        <label for="">Dirección</label>
                                                        <input type="text" class="form-control" value="${usuario.direccion}" name="direccion" required="" placeholder="Dirección de su residencia">
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-3">
                                                        <label for="">Género</label>
                                                        <select name="genero" class="form-control" required="">
                                                            <option value="">Seleccione</option>
                                                            <option value="F">Femenino</option>
                                                            <option value="M">Masculino</option>
                                                            <option value="O">Otro</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group col-md-3">
                                                        <label for="">Nivel de Formación</label>
                                                        <select name="formacion" class="form-control" required="">
                                                            <option value="">Seleccione</option>
                                                            <option value="Bachiller">Bachiller</option>
                                                            <option value="Técnico">Técnico</option>
                                                            <option value="Tecnológo">Tecnológo</option>
                                                            <option value="Profesional">Profesional</option>
                                                        </select>
                                                    </div>
                                                    
                                                    <input type="text" name="cargo" value="${usuario.cargo}" hidden/>
                                                </div>

                                                <div class="form-row">
                                                    <input type="submit" class="form-control btn-info" name="btnActualizar" value="Actualizar">
                                                </div>
                                            </form>									
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="nav-contrasenia" role="tabpanel" aria-labelledby="nav-contrasenia-tab">
                                    <div class="row justify-content-around">
                                        <div class="col-xl-4 col-lg-5 col-md-6 mt-5">
                                            <form method="POST" action="<%=request.getContextPath()%>/srvUsuario?accion=cambiarPassword" class="justify-content-around" id="nuevaContrasenia" onsubmit="return cambiarContrasenia();">

                                                <div class="form-group col">
                                                    <input name="id_usuario" value="${usuario.id_usuario}" hidden>

                                                    <div class="form-group">
                                                        <label for="">Contraseña Actual:</label>
                                                        <input type="password" name="passwordActual" class="form-control" minlength="8" id="newPassword" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="">Nueva contraseña</label>
                                                        <input type="password" name="nuevaPassword" class="form-control" minlength="8" id="newPassword" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="">Repita la nueva contraseña</label>
                                                        <input type="password" name="confirmarPassword" class="form-control" minlength="8" id="newPassword2" required="">
                                                    </div>

                                                    <button type="submit" class="btn btn-block btn-success mt-4 mb-4">Cambiar Contraseña</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="row justify-content-around">
                                        <h3 class="text-center"><%=mensaje != null ? mensaje : ""%></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="../js/jquery-3.5.1.slim.min.js"></script>
        <script type="text/javascript" src="../js/bootstrap.min.js"></script>

        <script type="text/javascript" src="../DataTables/datatables.min.js"></script>

        <!-- Script dataTable buttons -->
        <!-- Script -->
        <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>

        <script type="text/javascript" src="../../DataTables/datatables.min.js"></script>

        <!-- Script dataTable buttons -->
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/buttons.html5.min.js"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="../../Alert/botones.js"></script>


        <script >
            $(document).ready(function () {
                $('#consultaAgenda').DataTable({
                    "scrollY": "500px",
                    "scrollCollapse": true,
                    "paging": true,
                    "scrollX": true,

                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'excel', 'pdf', 'print'
                    ]
                });
            });
        </script> 
    </body>
</html>
<%
    } else {
        response.sendRedirect("../../index.jsp");
    }
%>