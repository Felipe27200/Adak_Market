<%-- 
    Document   : reporteAgendaTablas
    Created on : 19/05/2021, 10:26:20 AM
    Author     : felip
--%>

<%@page import="conexion.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
        <title>Reporte Agendas</title>
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
                        <h2>Horarios y días de trabajo de los empleados</h2>
                    </div>
                    <!-- <div class="row"> -->
                    <table id="consultaContrato" class="table display table-bordered" style="width: 100%;">
                        <thead class="thead-dark pt-5">
                        <th>Nombre</th>
                        <th>Documento</th>
                        <th>Día</th>
                        <th>Hora Entrada</th>
                        <th>Hora Salida</th>
                        <th>Opciones</th>
                        </thead>

                        <tbody>
                        <%
                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                con = Conexion.conectar();
                                sta = con.createStatement();
                                rs = sta.executeQuery("SELECT us.nombre, age.usuario_id_usuario, age.dia, age.hora_entrada, age.hora_salida, age.id_agenda FROM agendas AS age INNER JOIN usuarios AS us ON us.id_usuario = age.usuario_id_usuario WHERE age.estado = 1 ORDER BY us.nombre");

                                while (rs.next()) {
                        %>
                            <tr>
                                <td><%=rs.getString("nombre")%></td>
                                <td><%=rs.getString("usuario_id_usuario")%></td>
                                <td><%=rs.getString("dia")%></td>
                                <td><%=rs.getString("hora_entrada")%></td>
                                <td><%=rs.getString("hora_salida")%></td>
                                <td>
                                    <div class="btn-group text-center">
                                        <a href="modificarAgenda.jsp?documento=<%=rs.getString("usuario_id_usuario")%>&agenda=<%=rs.getString("id_agenda")%>" aria-controls="nav-agenda" class="btn btn-primary btn-sm boton"><i class="fas fa-edit"></i></a>
                                        <a href="consultarEmpleado.jsp?documento=<%=rs.getString("usuario_id_usuario")%>" class="btn btn-warning btn-sm boton"><i class="fas fa-eye"></i></a>
                                        <a href="reporteAgenda.jsp" class="btn btn-info"><i class="fas fa-chart-line"></i></a>
                                        <a href="eliminarAgenda.jsp?documento=<%=rs.getString("usuario_id_usuario")%>" class="btn btn-danger" id="eliminarAgenda"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </td>
                            </tr>
                        <%
                                }

                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(con);

                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>                            
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

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
                $('#consultaContrato').DataTable({
                    "scrollY": 500,
                    "scrollX": true,
                    "scrollCollapse": true,

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