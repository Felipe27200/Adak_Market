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
        <link rel="stylesheet" href="../../DataTables/datatables.min.css">
        <title>Consultar Productos</title>
    </head>
    <script type="text/javascript">

        function ConfirmaBorrado() {
            var respuesta = confirm("Estas seguro de eliminar este Producto ?");
            if (respuesta == true) {
                return true;
            } else {
                return false;
            }

        }
    </script>

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


                    <table id="consulta_inventario" class="table table-striped" style="font-size: 15px; width: 100%;">

                        <thead class="thead-dark pt-5">
                        <th>CODIGO</th>
                        <th>PRODUCTO</th>
                        <th>CATEGORIA</th>
                        <th>PRECIO</th>
                        <th>ENTRADA</th>
                        <th>SALIDA</th>
                        <th>OPCIONES</th>


                        </thead>
                        <tbody>
                            <%
                                Connection cnx = null;
                                Statement sta = null;
                                ResultSet rs = null;

                                try {

                                    cnx = Conexion.conectar();
                                    sta = cnx.createStatement();

                                    rs = sta.executeQuery("SELECT productos.codigo,productos.nombre,categorias.tipo_categoria,productos.precio FROM productos INNER JOIN categorias ON productos.id_categorias=categorias.id_categorias WHERE productos.estado=1");

                                    while (rs.next()) {


                            %>

                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>

                                <td><a href="registro_entrada.jsp?cod=<%=rs.getString(1)%>" class="btn btn-primary btn-sm boton"><i class="far fa-calendar-plus"></i></a></td>
                                <td><a href="registro_salida.jsp?cod=<%=rs.getString(1)%>" class="btn btn-primary btn-sm boton"><i class="far fa-calendar-minus"></i></a></td>
                                <td><a href="editarProducto.jsp?cod=<%=rs.getString(1)%>" class="btn btn-primary btn-sm boton"><i class="fas fa-edit"></i></a>
                                    <a href="eliminarProducto.jsp?cod=<%=rs.getString(1)%>" class="btn btn-warning btn-xs" onclick="return ConfirmaBorrado()"><i class="far fa-trash-alt"></i></a></td>
                            </tr>

                            <%
                                    }

                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(cnx);

                                } catch (Exception e) {

                                }
                            %>	

                        </tbody>  
                        <tfoot>
                            <tr>
                                <th>CODIGO</th>
                                <th>PRODUCTO</th>
                                <th>CATEGORIA</th>
                                <th>PRECIO</th>
                                <th>ENTRADA</th>
                                <th>SALIDA</th>
                                <th>OPCIONES</th>

                            </tr>
                        </tfoot>

                    </table>
                </div>	
            </div>
        </div>
    </div>

    <!-- Script -->
    <script type="text/javascript" src="../../js/jquery-3.5.1.slim.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>

    <!-- Script datatable -->
    <script type="text/javascript" src="../../DataTables/datatables.min.js"></script>

    <!-- Script dataTable buttons -->
    <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="../../DataTables/JSZip-2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="../../DataTables/pdfmake-0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript" src="../../DataTables/Buttons-1.7.0/js/buttons.html5.min.js"></script>	
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="../../Alert/botones.js"></script>

    <script >
                                    $(document).ready(function () {
                                        $('#consulta_inventario').DataTable({
                                            "scrollY": "500px",
                                            "scrollCollapse": true,
                                            "paging": true,
                                            "scrollX": true,

                                            dom: 'Bfrtip',
                                            buttons: [
                                                'copy', 'excel', 'pdf', 'print'
                                            ]
                                        });
                                    });
    </script>



</body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>