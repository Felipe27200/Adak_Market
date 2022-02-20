<%-- 
    Document   : ModificarPedido
    Created on : 19/05/2021, 10:36:10 AM
    Author     : SANCHEZ VALENZUELA
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <link rel="stylesheet" href="../../DataTables/datatables.min.css">
        <title>Pedidos - Proveedores</title>
    </head>
    <body>
        <!-- Contenedor -->
        <div class="container-fluid">
            <!-- Fila barra navegación superior -->
            <div class="row">
                <div class="col">
                    <nav class="navbar navbar-expand-md bg-light navbar-light">
                        <a href="#" class="navbar-brand"></a><img src="../../img/Logotipo Adak.png" style="width: 5%">
                        <!-- Permite retraer el menú al cambiar la resolución -->
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#Menu">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <!-- Contenido y lista del menú -->
                        <div class="collapse navbar-collapse justify-content-end" id="Menu">
                            <ul class="navbar-nav ">
                                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-user iconoCerrar"></i>Angie Mendoza S.</a></li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link active dropdown-toggle" data-toggle="dropdown" id="lista">Servicios</a>
                                    <div class="dropdown-menu">
                                        <a href="../inventario/dashboard_inventario.jsp" class="dropdown-item">Inventario</a>
                                        <a href="../proveedores_pedidos/dashboard_proveedores.jsp" class="dropdown-item">Proveedores y Pedidos</a>
                                        <a href="dashboard_Empleado.jsp" class="dropdown-item">Talento Humano</a>
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
                <script type="text/javascript">

                    function ConfirmaBorradoPedido() {
                        var respuesta = confirm("Estas seguro de eliminar Pedido?");
                        if (respuesta == true) {
                            return true;
                        } else {
                            return false;
                        }

                    }
                </script>
                <div class="col-md-9 mt-4">
                    <table id="example" class="table display table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>

                                <th>Nombre del producto</th>                               
                                <th>Marca</th>
                                <th>Cantidad</th>
                                <th>Fecha de Entrega </th>
                                <th>Dirección</th>



                            </tr>
                        </thead>

                        <tfoot>
                            <tr>

                                <th>Nombre del producto</th>                               
                                <th>Marca</th>
                                <th>Cantidad</th>
                                <th>Fecha de Entrega </th>
                                <th>Dirección</th>

                            </tr>
                        </tfoot>
                        <%
                            Connection cnx = null;
                            Statement sta = null;
                            ResultSet rs = null;

                            try {

                                Class.forName("com.mysql.jdbc.Driver");
                                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3307/adak_market?user=root&password=");

                                sta = cnx.createStatement();
                                rs = sta.executeQuery("select * from  pedidos");

                                while (rs.next()) {

                        %>

                        <tr>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>



                        </tr>
                        <%
                                }

                                sta.close();
                                rs.close();
                                cnx.close();

                            } catch (Exception e) {
                            }
                        %>
                    </table>
                </div>       
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade  " id="exampleModal_1" tabindex="-1" aria-labelledby="exampleModalLabel_1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content ">
                    <div class="modal-header ">
                        <h5 class="modal-title " id="exampleModalLabel">Modificar Pedido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="modificarModal">
                            <div class="form-row">
                                <div class="form-group col-md-6">

                                    <label for="">Costo</label>
                                    <input type="number" class="form-control" required="">


                                </div>



                                <div class="form-group col-md-6">
                                    <label for="">Cantidad</label>
                                    <input type="number" class="form-control" required="">
                                </div>


                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="">Fecha_Entrega</label>
                                    <input type="date" class="form-control" required="">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="">Fecha_Pedido</label>
                                    <input type="date" class="form-control" required="">
                                </div>


                            </div>
                            <h4 class="text-center">Aseo</h4>
                            <div class="form-row">
                                <div class="form-group col-md-6 ">

                                    <label for="">Selecione el Pedido</label>
                                    <select class="form-control" required="">
                                        <option>Jabon de loza</option>
                                        <option>Detergente</option>
                                        <option>Blanqueador</option>
                                        <option>Limpia vidrios</option>
                                        <option>Suavisante</option>
                                        <option>Cera de Piso</option>
                                        <option>Detergente en barra</option>
                                        <option>Barsol</option>
                                    </select>
                                </div>



                                <div class="form-group col-md-6">
                                    <label >Cantidad</label>
                                    <input type="number" class="form-control" required="">

                                </div>
                            </div>
                            <h4 class="text-center">Canasta Familiar</h4>
                            <div class="form-row">
                                <div class="form-group col-md-6 ">

                                    <label for="">Selecione el Pedido</label>
                                    <select class="form-control" required="">

                                        <option>Galletas</option>
                                        <option>Cereal</option>
                                        <option>Aceite</option>
                                        <option>Arroz</option>
                                        <option>Lentejas</option>
                                        <option>Frijoles</option>
                                        <option>Chocolate</option>
                                        <option>Alberja</option>
                                        <option>Leche</option>
                                        <option>Avena</option>
                                    </select>

                                </div>

                                <div class="form-group col-md-6">
                                    <label >Cantidad</label>
                                    <input type="number" class="form-control" required="">

                                </div>
                            </div>
                            <h4 class="text-center">Mascotas</h4>
                            <div class="form-row">
                                <div class="form-group col-md-6 ">

                                    <label for="">Selecione el Pedido</label>
                                    <select class="form-control" required="">

                                        <option>Purina</option>
                                        <option>Javon de Baño de Perro </option>
                                        <option>Talco Antipulga</option>
                                        <option>Caramelo para mascotas</option>
                                        <option>Javon para gato</option>

                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label >Cantidad</label>
                                    <input type="number" class="form-control" required="">

                                </div>
                            </div>
                            <h4 class="text-center">Aseo Corporal</h4>
                            <div class="form-row">


                                <div class="form-group col-md-6 ">
                                    <label >Seleccione el Pedido</label>
                                    <select class="form-control" required="">

                                        <option>shampoo</option>
                                        <option>Javon</option>
                                        <option>Desodorante</option>
                                        <option>Talco para pies</option>
                                        <option>shampoo para bebes</option>
                                        <option>shampoo para bebe</option>
                                        <option>Crema dental</option>
                                        <option>Ceda dental </option>

                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label >Cantidad</label>
                                    <input type="number" class="form-control" required="">

                                </div>
                            </div>

                    </div>
                    <div id="respuesta"></div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Script -->

        <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
        <script type="text/javascript" src="../../js/bootstrap.min.js"></script>

        <script type="text/javascript" src="../../DataTables/datatables.min.js"></script>

        <!-- Script dataTable buttons -->
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/buttons.html5.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript" src="../../Alert/Botones_cancelarPedido.js"></script>
        
        <script >
            $(document).ready(function () {
                $('#example').DataTable({
                    "scrollY": "500px",
                    "scrollCollapse": true,
                    "paging": true,
                    "scrollX": true,

                    dom: 'Bfrtip',
                    buttons: [

                    ]
                });
            });
        </script>
    </body>
</html>
