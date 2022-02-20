<%-- 
    Document   : Registro_Proveedores
    Created on : 19/05/2021, 10:38:11 AM
    Author     : SANCHEZ VALENZUELA
--%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if (session.getAttribute("usuario") != null)
{
    request.getContextPath();
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
        <title>Pedidos - Proveedores</title>
    </head>
    <body>
        <!-- Contenedor -->
        <!-- Contenedor -->
        <div class="container-fluid">
            <header>
                <jsp:include page="/WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>
            </header>

                        <!-- Contenido y lista del menú -->
                        <div class="collapse navbar-collapse justify-content-end" id="Menu">
                            <ul class="navbar-nav ">
                                <li class="nav-item"><a href="dashboard_proveedores.jsp" class="nav-link"><i class="fas fa-user iconoCerrar"></i>Angie Mendoza S.</a></li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link active dropdown-toggle" data-toggle="dropdown" id="lista">Servicios</a>
                                    <div class="dropdown-menu">
                                        <a href="../inventario/dashboard_inventario.jsp" class="dropdown-item">Inventario</a>
                                        <a href="../proveedores_pedidos/dashboard_proveedores.jsp" class="dropdown-item">Proveedores y Pedidos</a>
                                        <a href="../talento_humano/dashboard_talento_humano.jsp" class="dropdown-item">Talento Humano</a>
                                    </div>
                                </li>

                                <li class="nav-item"><a href="../../index.jsp" class="nav-link"><i class="fas fa-sign-out-alt iconoCerrar"></i>Cerrar Sesión</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

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
                <div class="col-md-9 ">
                    <form class="font-weight-bold">
                        <div class="form-group text-center mt-4">
                            <img src="../../img/Proveedores/Registro Proveedor.png" class="img-fluid" style="width: 7%;" alt="">
                            <p style="font-size: 25px;">Registrar Proveedor</p>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="">Nombre</label>
                                <input type="text" name="nombres"class="form-control"  required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Telefono</label>
                                <input type="tel" id="telefono" name="telefono"class="form-control" required="" placeholder="+57-3132459709" pattern="+[0-9]{2}-[0-9]{10}">
                            </div>


                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="">Pagina Web</label>
                                <input type="text" class="form-control"name="pagina web" id="inputEmail4" required="">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Dirección</label>
                                <input type="text" class="form-control" name="direccion" placeholder="Dirección de la Empresa">
                            </div>
                        </div>

                        <div class="form-row">




                            <div class="form-group col-md-6">
                                <label for="">Correo Electrónico</label>
                                <input type="email" name="correo electronico"class="form-control" placeholder="ejemplo@gmail.com">
                            </div>
                            


                        </div>




                        <button type="submit" class="btn btn-success btn-block"name="btnGrabar" id="btnregistrarProveedor" >Registrar</button>
                    </form>	
                    <%
                        if (request.getParameter("btnGrabar") != null) {

                            String paweb = request.getParameter("pagina web");
                            String corre = request.getParameter("correo electronico");
                            String nomb = request.getParameter("nombres");
                            String dire = request.getParameter("direccion");
                            String tele = request.getParameter("telefono");
                            

                            
                            Connection con = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {
                                con = Conexion.conectar();
                                sta = con.createStatement();
                                sta.executeUpdate("insert into proveedores(pagina_web,correo,nombre,direccion,TELEFONO) values('" + paweb + "','" + corre + "','" + nomb + "','" + dire + "','" + tele + "')");

                                request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);
                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(con);
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
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/buttons.html5.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="../../Alert/Botones_p_p.js"></script>
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
