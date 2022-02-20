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
                    <div class="row no-gutters">
                        <div class="col-md-3 pt-3">
                            <div class="card bg-light border-white">
                                <div class="card-body float-center">

                                    <img src="../img/Angie.jpg" class="img-fluid" alt="">

                                    <h3>${usuario.getNombre()}</h3>

                                    <p class="card-text"> ${usuario.cargo}</p>

                                    <a href="editarAdmin.jsp" class="btn btn-info btn-block">Ver Perfil</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-9">
                            <div class="row">
                                <div class="col text-center">
                                    <h2>Bienvenido al Módulo de Talento Humano</h2>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-2 bg-light">
                                        <div class="card-header bg-primary text-white text-center">
                                            <h4>Empleados</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/TalentoHumano/empleado.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p class="text-left" style="font-size: 20px;">Gestione y consulte la información de sus empleados</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-3 bg-light">
                                        <div class="card-header bg-warning  text-white text-center">
                                            <h4>Agendas</h4>
                                        </div>
                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/TalentoHumano/calendario.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p class="text-left" style="font-size: 20px;">Gestione y consulte los horarios y novedades de sus empleados</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-3 bg-light">
                                        <div class="card-header bg-success  text-white text-center">
                                            <h4>Contratos</h4>
                                        </div>

                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/TalentoHumano/contrato_2.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p class="text-left" style="font-size: 20px;">Gestione y consulte los contratos de sus empleados</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-lg-12 mb-3">
                                    <div class="card pb-3 bg-light">
                                        <div class="card-header bg-danger  text-white text-center">
                                            <h4>Reportes <span class="badge badge-light badge-pill" style="font-size: 10px;">Nuevos</span></h4>
                                        </div>

                                        <div class="row no-gutters">
                                            <div class="col-4 pl-2 mt-4">
                                                <img src="../../img/TalentoHumano/reporte.png" class="img-fluid">
                                            </div>

                                            <div class="col-8">
                                                <div class="card-body">
                                                    <p style="font-size: 20px;" class="text-left">Obtenga reportes precisos de estos procesos administrativos</p>
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
