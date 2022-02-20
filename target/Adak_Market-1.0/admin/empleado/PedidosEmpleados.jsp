<%-- 
    Document   : Reporte_Pedidos
    Created on : 19/05/2021, 10:38:44 AM
    Author     : SANCHEZ VALENZUELA
--%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("usuario") != null) {
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
        <title>Pedidos - Proveedores</title>
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
                            <h1>Gestión Proveedores</h1>
                        </div>

                        <ul class="navbar-nav">	
                            <li class="nav-item"><a href="ProveedoresEmpleados.jsp" class="nav-link"><i class="far fa-address-card"></i>Consultar información de los Proveedores</a></li>
                        </ul>

                        <div class="navTitulo">
                            <h1>Pedidos</h1>
                        </div>

                        <ul class="navbar-nav">


                            <li class="nav-item"><a href="PedidosEmpleados.jsp" class="nav-link"><i class="fas fa-file-signature"></i>Consultar información de los Pedido</a></li>


                        </ul>


                    </nav>
                    <div class="navTitulo">


                    </div>
                    <ul class="navbar-nav">

                        </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9 mt-4">
                    <div class="row">
                        <div class="col-md-5">
                            <h2>Reporte de Pedidos</h2>
                        </div>
                    </div>


                    <table id="example" class="table display table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Nombre del producto</th>                               
                                <th>Marca</th>
                                <th>Cantidad</th>
                                <th>Fecha de Entrega </th>
                                <th>Dirección</th>
                                <th>Pagina Web Producto</th>



                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>Nombre del producto</th>                               
                                <th>Marca</th>
                                <th>Cantidad</th>
                                <th>Fecha de Entrega </th>
                                <th>Dirección</th>
                                <th>Pagina Web Producto</th>



                            </tr>
                        </tfoot>
                        <%
                            Connection cnx = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                cnx = Conexion.conectar();

                                sta = cnx.createStatement();
                                rs = sta.executeQuery("select * from pedidos");

                                while (rs.next()) {

                        %>

                        <tr>

                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>


                        </tr>
                        <%
                                }

                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(cnx);

                            } catch (Exception e) {
                            }
                        %>
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
                $('#example').DataTable({
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

