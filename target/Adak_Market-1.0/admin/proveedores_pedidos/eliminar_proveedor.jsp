
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
            String id = request.getParameter("id");
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            try {
                cnx = Conexion.conectar();

                sta = cnx.createStatement();
                /*sta.executeUpdate("delete from proveedores where id_proveedor='"+id+"'");*/

                sta.executeUpdate("update proveedores set estado=0 where id_proveedor='" + id + "'");

                request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);

                Conexion.close(rs);
                Conexion.close(sta);
                Conexion.close(cnx);
            } catch (Exception e) {
                out.print(e + "");

            }

        %>
    </body>
</html>
