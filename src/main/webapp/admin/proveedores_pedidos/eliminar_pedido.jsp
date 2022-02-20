
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
        <%
            String id_pedido = request.getParameter("id_pedido");
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                cnx = Conexion.conectar();
                sta = cnx.createStatement();
                sta.executeUpdate("delete from pedidos where id_pedido='" + id_pedido + "'");

                /*sta.executeUpdate("update proveedores set estado=0 where docUsuario='"+id+"'");*/
                request.getRequestDispatcher("ModificarPedido.jsp").forward(request, response);

                Conexion.close(rs);
                Conexion.close(sta);
                Conexion.close(cnx);
            } catch (Exception e) {
                out.print(e + "");

            }

        %>
    </body>
</html>

