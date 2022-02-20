
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../../myCss/myStyle.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="../../WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>
            <h1 class="text-center">Editando Proveedor</h1>

            <div class="row justify-content-around">
                <%
                    String id = request.getParameter("id");

                    Connection cnx = null;
                    ResultSet rs = null;
                    Statement sta = null;

                    try {
                        cnx = Conexion.conectar();

                        sta = cnx.createStatement();
                        /*sta.executeUpdate("delete from usuarios where docUsuario='"+ced+"'");*/

                        rs = sta.executeQuery("select * from proveedores where id_proveedor='" + id + "'");

                        while (rs.next()) {

                %>
                <div class="col-md-6">
                    <form class="">
                        <div class="form-group">
                            <label class="control-label">Id_Proveedor:</label>
                            <input type="text" class="form-control" name="id_proveedor" value="<%=rs.getInt(1)%>" readonly="readonly" placeholder=""/>
                        </div>
                        <div class="form-group">
                            <label class="control-label"> Pagina Web:</label>
                            <input type="text" class="form-control" name="pagina web" value="<%=rs.getString(2)%>" readonly="readonly" placeholder="Ingrese la pagina web del proveedor"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Correo Electronico</label>
                            <input type="email" class="form-control" name="correo electronico" value="<%=rs.getString(3)%>" placeholder="Ingrese el correo electronico del proveedor"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Nombre(s)</label>
                            <input type="text" class="form-control" name="nombres" value="<%=rs.getString(4)%>" placeholder="Ingrese el Nombre del Proveedor"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Dirección.</label>
                            <input type="text" class="form-control" name="direccion" value="<%=rs.getString(5)%>"readonly="readonly"     placeholder="Ingrese la dirección del Proveedor"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Telefono.</label>
                            <input type="text" class="form-control" name="telefono" value="<%=rs.getString(6)%>" placeholder="Asigne contraseñ"/>
                        </div>

                        <br>

                        <div class="form-group">
                            <input type="submit" class="btn btn-success btn-block" name="btnActualizar" value="Actualizar"/>
                        </div>
                    </form>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {

                }

                /*RESIBIMOS NUEVOS VALORES*/
                if (request.getParameter("btnActualizar") != null) {
                    String id_p = request.getParameter("id_proveedor");
                    String paweb = request.getParameter("pagina web");
                    String corre = request.getParameter("correo electronico");
                    String nomb = request.getParameter("nombres");
                    String dire = request.getParameter("direccion");
                    String tele = request.getParameter("telefono");

                    sta.executeUpdate("Update proveedores SET  pagina_web='" + paweb + "',correo='" + corre + "',nombre='" + nomb + "',direccion='" + dire + "',TELEFONO='" + tele + "'where id_proveedor='" + id_p + "'");

                    request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);

                }
            %>
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