<%-- 
    Document   : Reportes
    Created on : 19/05/2021, 10:40:51 AM
    Author     : SANCHEZ VALENZUELA
--%>
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
                            <li class="nav-item"><a href="Registro_Proveedores.jsp"  class="nav-link"><i class="fas fa-user-plus"></i> Registrar Proveedor</a></li>			
                            <li class="nav-item"><a href="ModificarProveedor.jsp" class="nav-link"><i class="fas fa-user-edit"></i>Modificar Proveedor</a></li>	
                            <li class="nav-item"><a href="Consultar_Proveedores_1.jsp" class="nav-link"><i class="far fa-address-card"></i> Consultar Proveedor</a></li>

                            <li class="nav-item"><a href="Reporte_Proveedores.jsp" class="nav-link"><i class="far fa-address-card"></i>Generar Reportes</a></li>
                        </ul>

                        <div class="navTitulo">
                            <h1>Pedidos</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="solicitar_pedido.jsp" class="nav-link"><i class="fas fa-shopping-cart"></i>Solicitar Pedido</a></li>

                            <li class="nav-item"><a href="ConsultarPedido.jsp" class="nav-link"><i class="fas fa-file-signature"></i>Consultar Pedido</a></li>

                            <li class="nav-item"><a href="Reporte_Pedidos.jsp" class="nav-link"><i class="far fa-address-card"></i>Generar Reporte</a></li>
                        </ul>
                        <div class="navTitulo">
                            <h1>Reporte Grafico</h1>

                        </div>
                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="Reportes.jsp"  class="nav-link"><i class="far fa-chart-bar"></i>Visualizar</a></li>   
                    </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9 mt-4 color1">

                    <div class="row pt-5">
                        <div class="col">
                            <h1 class="display-4">Pedidos entregados de los proveedores</h1>
                            <canvas id="graf_1"></canvas>
                        </div>

                        <div class="col">
                            <h1 class="display-4">Pedidos entregados de los Proveedores</h1>
                            <canvas id="graf_2"></canvas>
                        </div> 


                    </div> 
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

        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <script type="text/javascript" src="../../graficas/Chart.bundle.min.js"></script>
        <script type="text/javascript" src="../../graficas/graficas_P_B.js"></script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("../../index.jsp");
    }
%> 