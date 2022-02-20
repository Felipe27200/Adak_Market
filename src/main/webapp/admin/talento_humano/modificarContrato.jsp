<%-- 
    Document   : registrarEmpleado
    Created on : 19/05/2021, 10:18:35 AM
    Author     : felip
--%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
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
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Modificar Contrato</title>
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

                            rs = sta.executeQuery("SELECT cont.nombre_empleador, us.nombre, cont.dir_establecimiento, cont.ciudad_establecimiento, us.cargo, cont.fecha_inicio, cont.objeto_contrato, us.id_usuario FROM contratos AS cont INNER JOIN usuarios AS us ON us.id_usuario = cont.id_usuario WHERE us.id_usuario = '"+documento+"'");

                            while (rs.next()) {
                    %>
                    <!-- Formulario Registrar Contrato Empleado -->
                    <form class="font-weight-bold" id="formularioContrato" onsubmit="return validarContrato();">
                        <div class="form-group text-center mt-4">
                            <img src="../../img/formularios/papel.png" class="img-fluid" style="width: 7%;" alt="">
                            <p style="font-size: 25px;">Registrar Contrato Empleado</p>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Nombre del Empleador</label>
                                <input type="text" class="form-control" value="<%=rs.getString("nombre_empleador")%>" name="nombreEmpleador" id="nombreEmpleador" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Nombre del empleado</label>
                                <input type="text" class="form-control" value="<%=rs.getString("nombre")%>" name="nombreEmpleado" id="nombreEmpleado" disabled required="">
                            </div>
                        </div>							  

                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="">Id. Empleado</label>
                                <input type="number" name="identificacion" class="form-control" value="<%=rs.getString("id_usuario")%>" readonly="readonly">
                            </div>
                            
                            <div class="form-group col-md-3">
                                <label for="">Cargo del empleado</label>
                                <input type="text" class="form-control" value="<%=rs.getString("cargo")%>" disabled>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">Dirección del Establecimiento</label>
                                <input type="text" class="form-control" name="direccionEstablecimiento" id="direccionEstablecimiento" required="" value="<%=rs.getString("dir_establecimiento")%>">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">Ciudad dónde está el establecimiento</label>
                                <input type="text" class="form-control" name="ciudadEstablecimiento" id="ciudadEstablecimiento" required="" value="<%=rs.getString("ciudad_establecimiento")%>">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="">Tipo de contrato</label>
                                <select name="tipoContrato" class="form-control" required="">
                                    <option value="">Seleccione</option>
                                    <option value="Contrato por obra o labor">Contrato por obra o labor</option>
                                    <option value="Término fijo">Término fijo</option>
                                    <option value="Término indefinido">Término indefinido</option>
                                    <option value="Aprendizaje">Aprendizaje</option>
                                    <option value="Temporal">Temporal</option>
                                    <option value="Prestación de servicios">Prestación de servicios</option>
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="">Fecha de inicio: </label>
                                <input name="fechaInicio" value="<%=rs.getString("fecha_inicio")%>" type="date" class="form-control" required="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="">Duración del contrato (en meses)</label>
                                <input type="number" name="duracionContrato" min="0" id="duracionContrato" placeholder="si es indefinido digite cero" class="form-control" required="">
                            </div>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-5">
                                <label for="message-text" class="col-form-label">Objeto del contrato (labor a desempeñar):</label>
                                <textarea value="" class="form-control" name="objetoContrato" id="message-text" required=""><%=rs.getString("objeto_contrato")%></textarea>
                            </div>	
                        </div>
                            <button type="submit" name="grabarcontrato" class="btn btn-success btn-block mb-2">Actualizar Contrato</button>
                    </form>
                    <%
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }

                        // Recibir nuevos valores
                        if (request.getParameter("grabarcontrato") != null) {
                            String empleador = request.getParameter("nombreEmpleador");
                            String direccion = request.getParameter("direccionEstablecimiento");
                            String ciudad = request.getParameter("ciudadEstablecimiento");
                            String tipoContrato = request.getParameter("tipoContrato");
                            String fechaInicio = request.getParameter("fechaInicio");
                            String duracion = request.getParameter("duracionContrato");
                            String objetoContrato = request.getParameter("objetoContrato");
                            int newDocumento = Integer.parseInt(request.getParameter("identificacion"));

                            sta.executeUpdate("UPDATE contratos SET fecha_inicio = '"+fechaInicio+"', tipo_contrato = '"+tipoContrato+"', nombre_empleador = '"+empleador+"', dir_establecimiento = '"+direccion+"', ciudad_establecimiento = '"+ciudad+"', duracion_contrato = '"+duracion+"', objeto_contrato = '"+objetoContrato+"' WHERE id_usuario = '"+newDocumento+"'");
                            
                            Conexion.close(rs);
                            Conexion.close(sta);
                            Conexion.close(con);

                            request.getRequestDispatcher("reporteContratoTablas.jsp").forward(request, response);
                        }
                    %>
                            
                </div>				
            </div>
        </div>

        <!-- Script -->
        <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script src="../../js/popper.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../js/registrarEmpleado.js"></script> 

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
