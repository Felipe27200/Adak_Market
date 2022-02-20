<%-- 
    Document   : modificarAgenda
    Created on : 19/05/2021, 09:11:04 AM
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
                    %>
                    <div class="row justify-content-lg-around mt-3">
                        <h3>Registrar Novedad</h3>
                    </div>
                    <form>
                        <div class="form-row justify-content-around">
                            <div class="form-group col-xl-4 col-lg-5 col-md-6">
                                <label class="float-left" for="">Documento: </label>
                                <input type="text" readonly name="newDocumento" value="<%=documento%>" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-around">
                            <div class="form-group col-xl-4 col-lg-5 col-md-6">
                                <label class="float-left" for="">Fecha: </label>
                                <input type="date" name="fecha" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row justify-content-around">
                            <div class="col-xl-4 col-lg-5 col-md-6">
                            <label for="message-text" class="col-form-label float-left">Descripción:</label>
                            <textarea class="form-control" name="descripcion" id="message-text" required></textarea>
                            </div>
                        </div>

                        <div class="form-row justify-content-around mt-3">
                            <div class="col-md-4">
                                <button type="submit" name="registrarNovedad" class="btn btn-primary btn-block">Aceptar</button>
                            </div>
                        </div>   
                    </form>
                    
                    <%
                        if (request.getParameter("registrarNovedad") != null) {

                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                String fecha = request.getParameter("fecha");
                                String descripcion = request.getParameter("descripcion");
                                String newDocumento = request.getParameter("newDocumento");

                                con = Conexion.conectar();
                                sta = con.createStatement();
                                sta.executeUpdate("INSERT INTO novedades (id_usuario, fecha_novedad, descripcion) VALUE ('"+newDocumento+"', '"+fecha+"', '"+descripcion+"')");
                                
                                //request.setAttribute("documento", newDocumento);
                                request.getRequestDispatcher("novedades.jsp?documento=" + newDocumento).forward(request, response);

                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(con);
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    %>
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