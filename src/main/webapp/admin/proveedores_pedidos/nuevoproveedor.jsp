<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

    </head>
    <body>

        <div class="container form-group">
            <h1>Nuevo Usuario</h1>
            <form>

                <dic class="form-group"
                     <label class="control-label">Pagina Web:</label>
                    <input type="text" class="form-control" name="pagina web"   placeholder="Ingrese la pagina web del proveedor"/>

                    <div class="form-group">
                        <label class="control-label">Correo Electronico</label>
                        <input type="email" class="form-control" name="correo electronico"  placeholder="Ingrese el correo electronico del proveedor"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre(s)</label>
                        <input type="text" class="form-control" name="nombres"  placeholder="Ingrese el Nombre del Proveedor"/>
                    </div>



                    <div class="form-group">
                        <label class="control-label">Dirección.</label>
                        <input type="text" class="form-control" name="direccion"  placeholder="Ingrese la dirección el proveedor"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Telefono.</label>
                        <input type="text" class="form-control" name="telefono"  placeholder="Asigne contraseñ"/>
                    </div>

                    <br>

                    <input type="submit" name="btnGrabar" value="Registrar usuario"></input>
            </form>

            <%
                if (request.getParameter("btnGrabar") != null) {
                    String id = request.getParameter("id");
                    String paweb = request.getParameter("pagina web");
                    String corre = request.getParameter("correo electronico");
                    String nomb = request.getParameter("nombres");
                    String dire = request.getParameter("direccion");
                    String tele = request.getParameter("telefono");

                    Connection cnx = null;
                    ResultSet rs = null;
                    Statement sta = null;

                    try {
                        cnx=Conexion.conectar();

                        sta = cnx.createStatement();
                        sta.executeUpdate("insert into proveedores values('" + id + "','" + paweb + "','" + corre + "','" + nomb + "','" + dire + "','" + tele + "',1)");

                        request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e + "");
                    }
                }
            %>



        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
    </body>
</html>
