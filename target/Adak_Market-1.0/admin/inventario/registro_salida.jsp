<%-- 
    Document   : registro_entrada
    Created on : 22/09/2021, 01:50:51 PM
    Author     : Carlos Armando
--%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <title>Registro salidas</title>
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
                            <li class="nav-item"><a href="Registro_productos.jsp" class="nav-link"><i class="fas fa-dolly"></i>Registrar Productos</a></li>
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
                <div class="col-md-9">
                    
                     <%
                        String cod = request.getParameter("cod");

                        Connection cnx = null;
                        Statement sta = null;
                        ResultSet rs = null;

                        try {

                            cnx = Conexion.conectar();
                            sta = cnx.createStatement();
                            rs = sta.executeQuery("SELECT productos.codigo, productos.nombre , categorias.tipo_categoria,productos.fecha_entrada,productos.cantidad FROM productos INNER JOIN categorias ON productos.id_categorias= categorias.id_categorias where codigo='" + cod + "'");

                            while (rs.next()) {

                    %>
                    
                    <form class="font-weight-bold">
                        <div class="form-group col pt-4" align="center">
                            <img src="../../img/Inventario/RegistroInventario.png" width="100px">
                            <p style="font-size: 25px;">ENTRADAS</p>

                        </div>
                        
                     

                        <div class="form-row justify-content-center">
                            
                             <div class="form-group col-sm-8">
                                <label class="control-label">Codigo</label>
                                <input type="number" class="form-control form-control-sm" name="codigo" value="<%=rs.getString(1)%>" readonly="readonly" maxlength="14"  required>
                            </div>

                            <div class="form-group col-sm-8">
                                <label for="precio del producto">Fecha Salida</label>
                                <input type="date" class="form-control form-control-sm" name="fecha_salida" id="fecha_salida"  required>
                            </div>

                            <div class="form-group col-sm-8">
                                <label for="cantidad">cantidad</label>
                                <input type="number" class="form-control form-control-sm" name="cantidadS" id="cantidad"  minlength="1" required>
                            </div>
                            
                            
                            <div class="form-group col-sm-8">
                                <button type="submit" name="btnRegistrar" value="Registrar Salida" class="btn btn-block btn-success mt-3 mb-3">Registrar</button>
                            </div>

                        </div>

                        
                        
                    </form>
                    
                    

                           <%
                               
                                     }
                        } catch (Exception e) {
                            out.println(e);
                        }
                        if (request.getParameter("btnRegistrar") != null) {
                            
                           int codigo = Integer.parseInt(request.getParameter("codigo"));
                            String fechaS = request.getParameter("fecha_salida");
                            String cantS = request.getParameter("cantidadS");
                         
                            

                            sta.execute("UPDATE productos SET fecha_salida='"+fechaS+"',cantidadS='"+cantS+"' WHERE codigo='"+codigo+"'");
                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(cnx);
                            request.getRequestDispatcher("consultar_inventario1.jsp").forward(request, response);

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
        <script type="text/javascript" src="../../js/registrarInventario.js"></script>
        
    </body>
</html>