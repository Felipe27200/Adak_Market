<%-- 
    Document   : eliminarProducto
    Created on : 24/05/2021, 03:57:22 PM
    Author     : sofy
--%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
       <%
           String cod=request.getParameter("cod");
           
             Connection cnx=null;
             ResultSet rs=null;
             Statement sta=null;
             
             try{
                 
                cnx = Conexion.conectar();
                sta = cnx.createStatement();
                 /*sta.executeUpdate("delete from usuarios where docUsuario='"+ced+"'");*/
                 
                 sta.executeUpdate("update productos set estado=0 where codigo='"+cod+"'");
                 
                 request.getRequestDispatcher("consultar_Productos.jsp").forward(request, response);
                 
                                Conexion.close(rs);
                                Conexion.close(sta);
                                Conexion.close(cnx);
             }catch(Exception e){
                 out.print(e+"");
             }
       %>
    </body>
</html>
