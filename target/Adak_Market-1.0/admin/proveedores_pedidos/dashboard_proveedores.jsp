<%-- 
    Document   : dashboard_proveedores
    Created on : 19/05/2021, 10:35:34 AM
    Author     : SANCHEZ VALENZUELA
--%>
<%@page import="Modelo.DTO.Usuario"%>
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
                <div class="col-md-9 mt-4">
                    <div class="row">
                        <div class="col-md-3 pt-3">
                            <div class="card bg-light border-white">
                                <div class="card-body float-center">

                                    <img src="../img/Angie.jpg" class="img-fluid" alt="">

                                    <h3>${usuario.getNombre()}</h3>

                                    <p class="card-text"> ${usuario.cargo}</p>

                                    <a href="../talento_humano/editarAdmin.jsp" class="btn btn-info btn-block">Ver Perfil</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-8">
                            <div class="row">
                                <div class="col text-center">
                                    <h2>Bienvenido al Módulo de Administración de Proveedores y Pedidos</h2>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col pt-3">
                                    <div class="card mb-3 h-100 bg-light">
                                        <div class="card-header bg-primary  text-white text-center">
                                            <h4>Pedidos</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 mt-4 ml-2">
                                                <img src="../../img/Proveedores/pedido.png" class="img-fluid">
                                            </div>

                                            <div class="col-7">
                                                <div class="card-body">
                                                    <p class="card-text" style="font-size: 20px;">Gestione y consulte la información de Pedidos</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col pt-3">
                                    <div class="card mb-3 h-100 bg-light">
                                        <div class="card-header bg-warning  text-white text-center">
                                            <h4>Proveedores</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 mt-4 ml-2">
                                                <img src="../../img/Proveedores/proveedor.png" class="img-fluid">
                                            </div>

                                            <div class="col-7">
                                                <div class="card-body">
                                                    <p class="card-text" style="font-size: 20px;">Gestione y consulte la información de Pedidos</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="modal fade" id="Agenda">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Encabezado -header- -->
                                        <div class="modal-header">
                                            <h4>Agendas de hoy</h4>
                                            <button type="button" class="close" data-dismiss="modal">&Otimes;</button>
                                        </div>
                                        <!-- Contenido -body- -->
                                        <div class="modal-body">
                                            <p>Tiene notificaciones Pendientes</p>
                                        </div>
                                        <!-- Pie de modal -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Script -->
        <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script src="../../js/popper.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>		
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
