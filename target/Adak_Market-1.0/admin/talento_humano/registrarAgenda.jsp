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
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Registrar Agenda</title>
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
                <div class="col-md-9">
                    <%
                        String documento = request.getParameter("documento");

                        Connection con = null;
                        Statement sta = null;
                        ResultSet rs = null;

                        try {
                            con = Conexion.conectar();
                            sta = con.createStatement();

                            rs = sta.executeQuery("SELECT dia, hora_entrada, hora_salida FROM agendas WHERE id_usuario = '" + documento + "'");

                            while (rs.next()) {
                    %>
                    
                    <form>				
                        <div class="form-group text-center mt-4">
                            <img src="../../img/formularios/viaje-en-el-tiempo.png" class="img-fluid" style="width: 7%;" alt="">
                            <p style="font-size: 25px;">Definir Horarios</p>
                            <h5>Días de Trabajo del empleado:</h5>
                        </div>

                        <div class="form-row">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Lunes" value="Lunes">
                                    <label class="form-check-label font-weight-bolder">Lunes</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaLunes" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaLunes" class="form-control" required="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Martes" value="Martes">
                                    <label class="form-check-label font-weight-bolder">Martes</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaMartes" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaMartes" class="form-control" required="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Miércoles" value="Miércoles">
                                    <label class="form-check-label font-weight-bolder">Miércoles</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaMiércoles" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaMiércoles" class="form-control" required="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Jueves" value="Jueves">
                                    <label class="form-check-label font-weight-bolder">Jueves</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaJueves" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaJueves" class="form-control" required="">
                                </div>
                            </div>
                        </div>

                        <div class="form-row justify-content-center mt-3">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Viernes" value="Viernes">
                                    <label class="form-check-label font-weight-bolder">Viernes</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaViernes" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaViernes" class="form-control" required="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Sábado" value="Sábado">
                                    <label class="form-check-label font-weight-bolder">Sábado</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaSábado" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaSábado" class="form-control" required="">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="Domingo" value="Domingo">
                                    <label class="form-check-label font-weight-bolder">Domingo</label>
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaDomingo" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaDomingo" class="form-control" required="">
                                </div>
                            </div>
                        </div>                        
                        <div class="col text-center">
                            <button type="submit" name="btnActualizar" class="btn btn-success col-3 btn-center"><i class="fas fa-edit"></i>Modificar Agenda</button>
                        </div>
                    </form>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                        // Recibir nuevos valores
                        if (request.getParameter("btnActualizar") != null) {
                            String lunes = request.getParameter("Lunes");
                            String entrada_lunes = request.getParameter("entradaLunes");
                            String salida_lunes = request.getParameter("salidaLunes");
                            String martes = request.getParameter("Martes");
                            String entrada_martes = request.getParameter("entradaMartes");
                            String salida_martes = request.getParameter("salidaMartes");
                            String miercoles = request.getParameter("Miércoles");
                            String entrada_miercoles = request.getParameter("entradaMiércoles");
                            String salida_miercoles = request.getParameter("salidaMiércoles");
                            String jueves = request.getParameter("Jueves");
                            String entrada_jueves = request.getParameter("entradaJueves");
                            String salida_jueves = request.getParameter("salidaJueves");
                            String viernes = request.getParameter("Viernes");
                            String entrada_viernes = request.getParameter("entradaViernes");
                            String salida_viernes = request.getParameter("salidaViernes");
                            String sabado = request.getParameter("Sábado");
                            String entrada_sabado = request.getParameter("entradaSábado");
                            String salida_sabado = request.getParameter("salidaSábado");
                            String domingo = request.getParameter("Domingo");
                            String entrada_domingo = request.getParameter("entradaDomingo");
                            String salida_domingo = request.getParameter("salidaDomingo");

                            Conexion.close(rs);
                            Conexion.close(sta);
                            Conexion.close(con);

                            request.getRequestDispatcher("reporteEmpleado.jsp").forward(request, response);
                        }
                    %>                     
                        <div class="col text-center mb-4">
                            <a class="btn btn-info col-3 iconoCerrar mt-3" href="#" data-toggle="modal" data-target="#EliminarEmpleado" role="button"><i class="fas fa-calendar-plus"></i>Registrar Novedad</a>									

                            <div class="modal fade" id="EliminarEmpleado">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Encabezado -header- -->
                                        <div class="modal-header">
                                            <h3>Registrar Novedad</h3>
                                            <button type="button" class="close" data-dismiss="modal">&Otimes;</button>
                                        </div>
                                        <!-- Contenido -body- -->
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-row justify-content-around">
                                                    <div class="form-group col">
                                                        <label class="float-left" for="">Fecha: </label>
                                                        <input type="date" class="form-control" required="">
                                                    </div>
                                                </div>

                                                <div class="form-row justify-content-around mt-2">
                                                    <div class="form-group col">
                                                        <label class="float-left" for="">Hora de Entrada</label>
                                                        <input type="time" class="form-control" required="">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="message-text" class="col-form-label float-left">Descripción:</label>
                                                    <textarea class="form-control" id="message-text"></textarea>
                                                </div>
                                            </form>																			
                                        </div>
                                        <!-- Pie de modal -->
                                        <div class="modal-footer float-left">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>										
                                            <button type="button" class="btn btn-primary">Aceptar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>									
                        </div>								
                    </form>				
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