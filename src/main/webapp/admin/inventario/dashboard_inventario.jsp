<%-- 
    Document   : dashboard_inventario
    Created on : 19/05/2021, 09:11:45 AM
    Author     : sofy
--%>

<%@page import="Modelo.DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("usuario") != null) {
        request.getContextPath();
        
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String url_perfil = "../talento_humano/editarAdmin.jsp";
        
        if (usuario.getId_rol() == 2)
            url_perfil = "../empleado/dashboard_Empleado.jsp";

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
        <title>Dashboard Inventario</title>
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
                            <h1>Gestión Inventario</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="Registro_productos.jsp"  class="nav-link"><i class="fas fa-dolly"></i></i>Registrar Productos</a></li>
                            <li class="nav-item"><a href="consultar_Productos.jsp" class="nav-link"><i class="fas fa-clipboard-list"></i>Consultar Productos</a></li>
                        </ul>


                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="consultar_inventario1.jsp" class="nav-link"><i class="far fa-address-card"></i>Consultar Inventario</a></li>		
                        </ul>




                        <div class="navTitulo">
                            <h1>Reportes</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="ReporteInventario.jsp" class="nav-link"><i class="far fa-file-pdf"></i> Reporte General</a></li>

                        </ul>
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

                                    <a href="<%=url_perfil%>" class="btn btn-info btn-block">Ver Perfil</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-9">
                            <div class="row">
                                <div class="col text-center">
                                    <h2>Bienvenido al Módulo de Inventario</h2>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-2 bg-light">
                                        <div class="card-header bg-primary  text-white text-center">
                                            <h4>Inventario</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/Inventario/valores.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p class="text-left" style="font-size: 20px;">Gestione y consulte la información de Inventario.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-3 bg-light">
                                        <div class="card-header bg-warning  text-white text-center">
                                            <h4>Productos</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/Inventario/inventario.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p class="text-left" style="font-size: 20px;">Gestione y consulte la informacion de los productos.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-center">
                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-3 bg-light">
                                        <div class="card-header bg-danger  text-white text-center">
                                            <h4>Reportes <span class="badge badge-light badge-pill" style="font-size: 10px;">Nuevos</span></h4>
                                        </div>

                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/Inventario/factura.png" class="img-fluid">
                                            </div>

                                            <div class="col-7">
                                                <div class="card-body">
                                                    <p style="font-size: 20px;" class="text-left">Obtenga reportes precisos de estos procesos del inventario.</p>
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
    } else {
        response.sendRedirect("../../index.jsp");
    }
%>