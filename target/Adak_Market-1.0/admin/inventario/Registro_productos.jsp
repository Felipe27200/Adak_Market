<%-- 
    Document   : Registro_productos
    Created on : 19/05/2021, 08:18:11 AM
    Author     : sofy
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
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Registro Productos</title>
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
                            <li class="nav-item"><a href="Registro_productos.jsp"  class="nav-link"><i class="fas fa-dolly"></i>Registrar Productos</a></li>
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
                <div class="col-md-9 ">

                    <form class="font-weight-bold">
                        <div class="form-group col pt-4" align="center">
                            <img src="../../img/Inventario/inventario.png" width="100px">
                            <p style="font-size: 25px;">Registrar producto</p>

                        </div>



                        <div class="form-row justify-content-center">
                            <div class="form-group col-sm-8">
                                <label class="control-label">Codigo</label>
                                <input type="number" class="form-control form-control-sm" name="codigo" id="codigo" min="0" required>
                            </div>



                            <div class="form-group col-sm-8">
                                <label for="nombre"> Nombre del producto</label>
                                <input type="text" class="form-control form-control-sm" id="nombre" name="nombre" required="">
                            </div>



                            <div class="form-group col-sm-8">
                                <label class="control-label">Categoria </label>
                                <select class="form-control form-control-sm" name="id_categoria" id="id_categoria">
                                    <option value="">Seleccione</option>
                                    <option value = "1">DESPENSA</option>
                                    <option value = "2">HUEVOS</option>
                                    <option value = "3">LACTEOS</option>
                                    <option value = "4">LIMPIEZA DEL HOGAR</option>
                                    <option value = "5">CUIDADO PERSONAL</option>
                                    <option value = "6">PANADERIA</option>
                                    <option value = "7">PASABOCAS</option>
                                    <option value = "8">DULCES</option>
                                    <option value = "9">BEBIDAS</option>
                                    <option value = "10">ALIMENTO MASCOTAS</option>
                                </select>
                            </div>
                            
                            <div class="form-group col-sm-8">
                                <label for="precio"> Precio</label>
                                <input type="number" class="form-control form-control-sm" id="precio" name="precio" placeholder="$" required="">
                            </div>

                            
                                   <div class="form-group col-sm-8">
                                         <button type="submit" name="btnRegistrar" value="Registrar " class="btn btn-block btn-success mt-3 mb-3">Registrar</button>
                                    </div>
                        

                    </form>
                    <%
                        if (request.getParameter("btnRegistrar") != null) {
                            int cod = Integer.parseInt(request.getParameter("codigo"));
                            String nomP = request.getParameter("nombre");
                            String cat = request.getParameter("id_categoria");
                            int pre = Integer.parseInt(request.getParameter("precio"));
                      
                           

                            Connection cnx = null;
                            ResultSet rs = null;
                            Statement sta = null;

                            try {

                                cnx = Conexion.conectar();
                                sta = cnx.createStatement();
                                sta.executeUpdate("insert into productos(codigo,nombre,id_categorias,precio,estado) "
                                        + "values('"+cod+"','"+nomP+"','"+cat+"','"+pre+"',1)");
                                request.getRequestDispatcher("consultar_Productos.jsp").forward(request, response);
                                    
                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(cnx);
                            } catch (Exception e) {

                                out.print(e + "");

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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="../../js/registroProducto.js"></script>

    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>