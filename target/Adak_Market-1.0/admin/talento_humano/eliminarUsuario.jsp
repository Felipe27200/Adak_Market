<%-- 
    Document   : eliminarUsuario
    Created on : 23/05/2021, 03:07:22 PM
    Author     : felip
--%>

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
            String documento = request.getParameter("documento");

            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            
            try
            {
                con = Conexion.conectar();
                sta = con.createStatement();
                sta.executeUpdate("UPDATE usuarios SET estado = 0 WHERE id_usuario = '"+documento+"'");
                
                request.getRequestDispatcher("reporteEmpleado.jsp").forward(request, response);
            }
            catch (Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
