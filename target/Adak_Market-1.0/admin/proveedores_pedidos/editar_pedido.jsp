<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    </head>
    <body>
        <div class="container form-group">
            <h1>Editando Pedidos</h1>

            <%
                String id_pedido = request.getParameter("id_pedido");

                Connection cnx = null;
                ResultSet rs = null;
                Statement sta = null;

                try {
                    cnx = Conexion.conectar();
                    sta = cnx.createStatement();
                    /*sta.executeUpdate("delete from usuarios where docUsuario='"+ced+"'");*/

                    rs = sta.executeQuery("select * from pedidos where id_pedido='" + id_pedido + "'");

                    while (rs.next()) {

            %>

            <form action="">
                <dic class="form-group"
                     <label class="control-label">Id_pedido:</label>
                    <input type="text" class="form-control" name="id_pedido" value="<%=rs.getInt(1)%>" readonly="readonly" placeholder=""/>


                    <div class="form-group"
                         <label class="control-label">Cantidad:</label>
                        <input type="text" class="form-control" name="cantidad" value="<%=rs.getString(2)%>"  placeholder="Ingrese la cantidad del pedido"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Fecha entrega:</label>
                        <input type="date" class="form-control" name="fecha_entrega" value="<%=rs.getString(3)%>" placeholder="Ingrese la fecha  entrega del pedido"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Fecha Pedido:</label>
                        <input type="date" class="form-control" name="fecha_pedido" value="<%=rs.getString(4)%>" placeholder="Ingrese la fecha cuando se hizo el pedido"/>
                    </div>



                    <div class="form-group">
                        <label class="control-label">Costo:</label>
                        <input type="text" class="form-control" name="costo" value="<%=rs.getString(5)%>" placeholder="Ingrese el costo"/>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Codigo_pedido</label>
                        <input type="text" class="form-control" name="codigo_pedido" value="<%=rs.getString(6)%>" placeholder="Ingrese el codigo del pedido"/>
                    </div>

                    <br>

                    <div class="form-group">
                        <input type="submit" name="btnActualizarPedido" value="Actualizar"</input>
                    </div>
            </form>





            <%
                    }
                } catch (Exception e) {

                }

                /*RESIBIMOS NUEVOS VALORES*/
                if (request.getParameter("btnActualizarPedido") != null) {
                    String id_pe = request.getParameter("id_pedido");
                    String cantidad = request.getParameter("cantidad");
                    String fecha_entrega = request.getParameter("fecha_entrega");
                    String fecha_pedido = request.getParameter("fecha_pedido");
                    String costo = request.getParameter("costo");
                    String codigo_pedido = request.getParameter("codigo_pedido");

                    sta.executeUpdate("update pedidos set  cantidad='" + cantidad + "',fecha_entrega='" + fecha_entrega + "',fecha_pedido='" + fecha_pedido + "',costo='" + costo + "',codigo_pedido='" + codigo_pedido + "'where id_pedido='" + id_pe + "'");

                    request.getRequestDispatcher("ModificarPedido.jsp").forward(request, response);

                }
            %>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>

        </div>  

    </body>
</html>