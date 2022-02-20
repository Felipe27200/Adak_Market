<%-- 
    Document   : modificarAgenda
    Created on : 19/05/2021, 09:11:04 AM
    Author     : felip
--%>

<%@page import="conexion.Conexion"%>
<%@page import="Modelo.DTO.Usuario"%>
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
        <title>Modificar Agenda</title>
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
                        String agenda = request.getParameter("agenda");

                        Connection con = null;
                        Statement sta = null;
                        ResultSet rs = null;
                        
                        try {
                            con = Conexion.conectar();
                            sta = con.createStatement();

                            rs = sta.executeQuery("SELECT age.dia, age.hora_entrada, age.hora_salida, age.id_agenda, us.nombre, age.usuario_id_usuario FROM agendas AS age INNER JOIN usuarios AS us ON age.usuario_id_usuario = us.id_usuario WHERE usuario_id_usuario = '"+documento+"' AND id_agenda = '"+agenda+"'");                           

                            while (rs.next()) {
                    %>
                    
                    <form>				
                        <div class="form-group text-center mt-4">
                            <img src="../../img/formularios/viaje-en-el-tiempo.png" class="img-fluid" style="width: 7%;" alt="">
                            <p style="font-size: 25px;">Definir Horarios</p>
                            <h5>Días de Trabajo del empleado:</h5>
                        </div>
                        
                        <div class="form-row justify-content-center">
                            <div class="form-group col-md-4">
                                <label for="">Nombre</label>
                                <input type="text" class="form-control" readonly="readonly"  value="<%=rs.getString("nombre")%>" name="nombres" required="">
                            </div>
                            
                            <div class="form-group col-md-3">
                                <label for="">No. Identificación</label>
                                <input type="number" name="newdocumento" readonly="readonly" value="<%=rs.getString("usuario_id_usuario")%>" class="form-control" required="">
                            </div>
                        </div>

                        <div class="form-row justify-content-around">
                            <div class="col-md-3">
                                <div class="form-check">
                                    <input class="form-group" type="text" readonly="readonly" name="Lunes" value="<%=rs.getString("dia")%>">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Entrada</label>
                                    <input type="time" name="entradaLunes" value="<%=rs.getString("hora_entrada")%>" class="form-control" required="">
                                </div>

                                <div class="form-group">
                                    <label for="">Hora de Salida</label>
                                    <input type="time" name="salidaLunes" value="<%=rs.getString("hora_salida")%>" class="form-control" required="">
                                </div>
                            </div>
                        </div>    
               
                        <div class="col text-center">
                            <button type="submit" name="btnActualizar" class="btn btn-success col-3 btn-center"><i class="fas fa-edit"></i>Modificar Agenda</button>
                        </div>
                    </form>
                    
                        <div class="col text-center">
                            <a class="btn btn-info col-3 mt-3" href="registrarNovedad.jsp?documento=<%=rs.getString("usuario_id_usuario")%>">Registrar Novedad</a>
                        </div>
                                
                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                        
                        if (request.getParameter("btnActualizar") != null) {
                            String lunes = request.getParameter("Lunes");
                            String entrada_lunes = request.getParameter("entradaLunes");
                            String salida_lunes = request.getParameter("salidaLunes");
                            String newDocumento = request.getParameter("newdocumento");

                            sta.executeUpdate("UPDATE agendas SET hora_entrada = '"+entrada_lunes+"', hora_salida = '"+salida_lunes+"' WHERE usuario_id_usuario = '"+newDocumento+"' AND dia = '"+lunes+"'");
                            request.getRequestDispatcher("reporteAgendaTablas.jsp").forward(request, response);
                        }

                        Conexion.close(rs);
                        Conexion.close(sta);
                        Conexion.close(con);
                        
                        /*// Recibir nuevos valores
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
                            String salida_domingo = request.getParameter("salidaDomingo"); */
                    %>                     

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
