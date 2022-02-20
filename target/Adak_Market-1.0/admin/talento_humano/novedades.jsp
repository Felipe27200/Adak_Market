<%-- 
    Document   : novedades
    Created on : 19/05/2021, 10:11:18 AM
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
        <title>Novedades Empleado</title> 
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
                        <h2>Novedades: ausencias, permisos o retardos</h2>
                    </div>
                    <!-- <div class="row"> -->
                    <table id="consultaNovedad" class="table display table-bordered" style="font-size: 15px; width: 100%;">
                        <thead class="thead-dark pt-5">
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Descripcion</th>
                        </thead>
                        <tbody>
                        <%
                            String documento = request.getParameter("documento");

                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;
                            try {
                                con = Conexion.conectar();
                                sta = con.createStatement();

                                rs = sta.executeQuery("SELECT us.nombre, nov.fecha_novedad, nov.descripcion FROM novedades AS nov INNER JOIN usuarios AS us ON us.id_usuario = nov.id_usuario WHERE nov.id_usuario = '" + documento + "'");

                                while (rs.next()) {
                        %>

                            <tr>
                                <td><%=rs.getString("nombre")%></td>
                                <td><%=rs.getString("fecha_novedad")%></td>
                                <td><%=rs.getString("descripcion")%></td>

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


        <script >
            $(document).ready(function () {
                $('#consultaNovedad').DataTable({
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