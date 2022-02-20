<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (session.getAttribute("usuario") != null)
{
    request.getContextPath();
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
                <div class="col-md-9 mt-4">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="../img/empleado.jpg" style="width: 70%;" class="float-sm-center" alt="">
                        </div>
                        <%
                            String documento = request.getParameter("documento");

                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                con = Conexion.conectar();
                                sta = con.createStatement();

                                rs = sta.executeQuery("SELECT * FROM usuarios WHERE id_usuario = '" + documento + "'");

                                while (rs.next()) {
                        %>                        
                        <div class="col-md-8 pt-4">
                            <h4><%=rs.getString("nombre")%></h4>
                            <p><%=rs.getString("cargo")%></p>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md mt-2">
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-datos" role="tab" aria-controls="nav-datos" aria-selected="true">Datos Personales</a>
                                    <a class="nav-link" id="nav-agenda-tab" data-toggle="tab" href="#nav-agenda" role="tab" aria-controls="nav-agenda" aria-selected="false">Agenda</a>
                                    <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contrato</a>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-datos" role="tabpanel" aria-labelledby="nav-datos-tab">
                                    <div class="row no-gutters">
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Género</h5>
                                            <p><%=rs.getString("genero")%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Edad</h5>
                                            <p><%=rs.getString("edad")%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Formación</h5>
                                            <p><%=rs.getString("formacion")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Tipo de Documento</h5>
                                            <p><%=rs.getString("tipo_documento")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>No. Documento</h5>
                                            <p><%=rs.getString("id_usuario")%></p>
                                        </div>
                                    </div>

                                    <div class="row no-gutters">
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Fecha de Nacimiento</h5>
                                            <p><%=rs.getString("fecha_nacimiento")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Teléfono</h5>
                                            <p><%=rs.getString("telefono")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Dirección</h5>
                                            <p><%=rs.getString("direccion")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Correo Electrónico</h5>
                                            <p><%=rs.getString("correo")%></p>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="tab-pane fade" id="nav-agenda" role="tabpanel" aria-labelledby="nav-agenda-tab">
                                    <div class="row" id="hora">
                                        <div class="col">
                                            <h2>Horarios y días de trabajo del empleado</h2>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col mb-3 text-center">
                                            <a href="novedades.jsp?documento=<%=documento%>" class="btn btn-primary mt-5"><i class="fas fa-eye"></i>Ver Novedades</a>
                                            <a class="btn btn-info iconoCerrar mt-5" href="registrarNovedad.jsp?documento=<%=documento%>"><i class="fas fa-calendar-plus"></i>Registrar Novedad</a>
                                        </div>								

                                    </div>							
                                    <!-- <div class="row"> -->
                                    <div class="row">
                                        <div class="col-md">
                                            <table id="consultaAgenda" class="table display table-bordered" style="width: 100%;">
                                                <thead class="thead-dark pt-5">
                                                <th>Día</th>
                                                <th>Hora Entrada</th>
                                                <th>Hora Salida</th>
                                                <th>Opciones</th>
                                                </thead>       

                                                <tbody>
                                                <%
                                                    Conexion.close(rs);
                                                    Conexion.close(sta);
                                                    Conexion.close(con);

                                                    con = null;
                                                    sta = null;
                                                    rs = null;

                                                    con = Conexion.conectar();
                                                    sta = con.createStatement();
                                                    rs = sta.executeQuery("SELECT * FROM agendas WHERE usuario_id_usuario = '"+documento+"'");

                                                    while (rs.next()) {
                                                %>
                                                    <tr>
                                                        <td><%=rs.getString("dia")%></td>
                                                        <td><%=rs.getString("hora_entrada")%></td>
                                                        <td><%=rs.getString("hora_salida")%></td>
                                                        <td>
                                                            <div class="btn-group text-center">
                                                                <a href="modificarAgenda.jsp?documento=<%=rs.getString("usuario_id_usuario")%>&agenda=<%=rs.getString("id_agenda")%>" aria-controls="nav-agenda" class="btn btn-primary btn-sm boton"><i class="fas fa-edit"></i></a>
                                                                <a href="reporteAgenda.jsp" class="btn btn-info"><i class="fas fa-chart-line"></i></a>
                                                                <a href="eliminarAgenda.jsp?documento=<%=rs.getString("usuario_id_usuario")%>" class="btn btn-danger" id="eliminarAgenda"><i class="fas fa-trash-alt"></i></a>
                                                            </div>
                                                        </td>
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
                                        rs = sta.executeQuery("SELECT * FROM contratos WHERE id_usuario = '"+documento+"'");

                                        while (rs.next()) {
                                    %>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Nombre del Empleador</h5>
                                            <p><%=rs.getString("nombre_empleador")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Tipo de contrato</h5>
                                            <p><%=rs.getString("tipo_contrato")%></p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 pt-3">
                                            <h5>Duración del contrato</h5>
                                            <p><%=rs.getString("duracion_contrato")%> mes(es)</p>
                                        </div>

                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Fecha Inicio</h5>
                                            <p><%=rs.getString("fecha_inicio")%></p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 col-sm-6 pt-3">
                                            <h5>Objeto del contrato</h5>
                                            <p><%=rs.getString("objeto_contrato")%></p>
                                        </div>

                                        <div class="col-md-4 col-sm-6 pt-3">
                                            <h5>Dirección del establecimiento</h5>
                                            <p><%=rs.getString("dir_establecimiento")%></p>
                                        </div>
                                        <div class="col-md-2 col-sm-6 pt-3">
                                            <h5>Ciudad</h5>
                                            <p><%=rs.getString("ciudad_establecimiento")%></p>
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
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
