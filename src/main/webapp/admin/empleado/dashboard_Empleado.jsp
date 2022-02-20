<%@page import="conexion.Conexion"%>
<%@page import="Modelo.DAO.UsuarioDAO"%>
<%@page import="Modelo.DTO.Usuario"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("usuario") != null) {
        Usuario usuario = (Usuario) session.getAttribute("usuario");
//        request.getContextPath();
        String mensaje = request.getParameter("mensaje");

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
            <jsp:include page="/WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>

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
                            <li class="nav-item"><a href="PedidosEmpleados.jsp"  class="nav-link"><i class="fas fa-dolly"></i> Proveedores y Pedidos</a></li>			
                        </ul>
                    </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9 mt-4">
                    <%                        
                        UsuarioDAO usuarioDAO = new UsuarioDAO();
                        Usuario empleado = usuarioDAO.consultar(usuario);
                    %>
                    <div class="row">
                        <div class="col-md-2">
                            <img src="../img/empleado.jpg" style="width: 70%;" class="float-sm-center" alt="">
                        </div>                        
                        <div class="col-md-8 pt-4">
                            <h4><%=empleado.getNombre()%></h4>
                            <p><%=empleado.getCargo()%></p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md mt-2">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-datos" role="tab" aria-controls="nav-datos" aria-selected="true">Datos Personales</a>
                                    <a class="nav-link" id="nav-agenda-tab" data-toggle="tab" href="#nav-agenda" role="tab" aria-controls="nav-agenda" aria-selected="false">Agenda</a>
                                    <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contrato</a>
                                    <a class="nav-link" id="nav-contrasenia-tab" data-toggle="tab" href="#nav-contrasenia" role="tab" aria-controls="nav-contrasenia" aria-selected="false">Cambiar Contraseña</a>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-datos" role="tabpanel" aria-labelledby="nav-datos-tab">
                                    <div class="row no-gutters">
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Género</h5>
                                            <p><%=empleado.getGenero()%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Edad</h5>
                                            <p><%=empleado.getEdad()%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Formación</h5>
                                            <p><%=empleado.getFormacion()%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Tipo de Documento</h5>
                                            <p><%=empleado.getTipo_documento()%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>No. Documento</h5>
                                            <p><%=empleado.getId_usuario()%></p>
                                        </div>
                                    </div>

                                    <div class="row no-gutters">
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Fecha de Nacimiento</h5>
                                            <p><%=empleado.getFecha_nacimiento()%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Teléfono</h5>
                                            <p><%=empleado.getTelefono()%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Dirección</h5>
                                            <p><%=empleado.getDireccion()%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Correo Electrónico</h5>
                                            <p><%=empleado.getCorreo()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="nav-agenda" role="tabpanel" aria-labelledby="nav-agenda-tab">
                                    <div class="row" id="hora">
                                        <div class="col">
                                            <h2>Horarios y días de trabajo del empleado</h2>
                                        </div>
                                    </div>
                                    <!-- <div class="row"> -->
                                    <div class="row">
                                        <div class="col-md mb-5">
                                            <table id="consultaAgenda" class="table display table-bordered" style="width: 100%;">
                                                <thead class="thead-dark pt-5">
                                                <th>Día</th>
                                                <th>Hora Entrada</th>
                                                <th>Hora Salida</th>
                                                </thead>       

                                                <tbody>
                                                    <%
                                                        String documento = String.valueOf(empleado.getId_usuario()); 

                                                        Connection con = null;
                                                        Statement sta = null;
                                                        ResultSet rs = null;

                                                        try {
                                                            con = Conexion.conectar();
                                                            sta = con.createStatement();
                                                            //cs = sta.executeQuery("SELECT * FROM contratos WHERE id_usuario = '"+documento+"'");
                                                            rs = sta.executeQuery("SELECT * FROM agendas WHERE usuario_id_usuario = '" + documento + "'");

                                                            while (rs.next()) {
                                                    %>
                                                    <tr>
                                                        <td><%=rs.getString("dia")%></td>
                                                        <td><%=rs.getString("hora_entrada")%></td>
                                                        <td><%=rs.getString("hora_salida")%></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>
                                                </tbody>

                                            </table>									
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade mt-4" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                    <div class="row no-gutters">
                                        <%
                                            Conexion.close(rs);
                                            Conexion.close(sta);
                                            Conexion.close(con);
                                            
                                            con = null;
                                            sta = null;
                                            rs = null;

                                            con = Conexion.conectar();
                                            sta = con.createStatement();
                                            //cs = sta.executeQuery("SELECT * FROM contratos WHERE id_usuario = '"+documento+"'");
                                            rs = sta.executeQuery("SELECT * FROM contratos WHERE id_usuario = '" + documento + "'");

                                            while (rs.next()) {
                                        %>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Nombre del Empleador</h5>
                                            <p><%=rs.getString(6)%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Tipo de contrato</h5>
                                            <p><%=rs.getString(5)%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Duración del contrato</h5>
                                            <p><%=rs.getString(9)%> mes(es)</p>
                                        </div>

                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Fecha Inicio</h5>
                                            <p><%=rs.getString(3)%></p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 col-sm-6 pt-3">
                                            <h5>Objeto del contrato</h5>
                                            <p><%=rs.getString(10)%></p>
                                        </div>

                                        <div class="col-md-4 col-sm-6 pt-3">
                                            <h5>Dirección del establecimiento</h5>
                                            <p><%=rs.getString(7)%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Ciudad</h5>
                                            <p><%=rs.getString(8)%></p>
                                        </div>
                                    </div>
                                    <%
                                            }

                                            Conexion.close(rs);
                                            Conexion.close(sta);
                                            Conexion.close(con);
                                        } catch (Exception e) {
                                            out.println(e);
                                        }
                                    %>
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

        <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>

        <script type="text/javascript" src="../../DataTables/datatables.min.js"></script>

        <!-- Script dataTable buttons -->
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/buttons.html5.min.js"></script>	

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
