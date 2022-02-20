<%-- 
    Document   : ModificarProveedor
    Created on : 19/05/2021, 10:57:21 AM
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
	<link rel="stylesheet" href="../../DataTables/datatables.min.css">
	<title>Pedidos - Proveedores</title>
    </head>
    <body>
        <!-- Contenedor -->
	<div class="container-fluid">
            <header>
                <jsp:include page="/WEB-INF/paginas/cabeceros/cabecero_admin.jsp"/>
            </header>

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
        
        function ConfirmaBorrado(){
            var respuesta = confirm("Estas seguro de eliminar proveedor ?");
            if(respuesta == true){
                return true;
            }
            else{
                return false;
            }
            
        }
          </script>
                        
                        
			<div class="col-md-9 mt-4 ">
			<table id="example" class="table display table-striped table-bordered" style="width:100%">
                            <div class="row">
                <div class="col-lg-8 col-md-8 col-xs-12">
                    <h3><a href="nuevoproveedor.jsp"><button class="btn btn-success btn-xs">Nuevo Proveedor</button></a></h3>
                </div>
            </div>
                        <thead class="thead-dark">
                            <tr>
                                
                                <th>Pagina Web</th>
                                <th>Correo Electronico</th>
                                <th>Nombre</th>
                                <th>Dirección</th>
                                <th>Telefono</th>                             
                                <th>Editar</th>
                                <th>Eliminar</th>
                                
                                
                            </tr>
                        </thead>
                        
                        <tfoot>
                            <tr>
                               
                                <th>Pagina Web</th>
                                <th>Correo Electronico</th>
                                <th>Nombre</th>
                                <th>Dirección</th>
                                <th>Telefono</th>   
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                        </tfoot>
                        <%
                        Connection con = null;
                        Statement sta = null;
                        ResultSet rs = null;
                    
                    try{
                    
                        con = Conexion.conectar();
                        sta = con.createStatement();
                        rs=sta.executeQuery("select * from  proveedores where estado=1 order by nombre asc");
                        
                        while(rs.next()){
                                
                        %>
                        
                        <tr>
                            
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            
                            <td><a href="editarproveedor.jsp?id=<%=rs.getString(1)%> "<button class="btn btn-primary btn-xs">Editar</button></a></td>
                            <td><a href="eliminar_proveedor.jsp?id=<%=rs.getString(1)%>" <button class="btn btn-warning btn-xs" onclick="return ConfirmaBorrado() ">Eliminar</button></a></td>
                        </tr>
                        <%
                        }
                        Conexion.close(rs);
                        Conexion.close(sta);
                        Conexion.close(con);
                            
                    }catch(Exception e){
                    }
                           Conexion.close(rs);
                            Conexion.close(sta);
                            Conexion.close(con);
                    %>
                    </table>
              <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade  " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content ">
      <div class="modal-header ">
        <h5 class="modal-title " id="exampleModalLabel">Modificar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="modificarModal">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre">
          </div>
          <div class="form-group ">
		 <label for="inputPassword4">Telefono</label>
		 <input type="tel" id="telefono" class="form-control" required="" placeholder="+57-3132459709" pattern="+[0-9]{2}-[0-9]{10}">
		</div>
		<div class="form-group ">
		<label for="">Pagina Web</label>
		<input type="text" class="form-control" id="pagina web" required="">
		</div>
		<div class="form-group ">
		<label for="">Dirección</label>
		<input type="text" class="form-control" placeholder="Dirección de la Empresa"id="direccion">
		</div>
        <div class="form-group ">
		<label for="">Correo Electrónico</label>
		<input type="email" class="form-control" placeholder="ejemplo@gmail.com" id="Correo Electronico">
		</div>
        </form>
      </div>
      <div id="respuesta"></div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" >Guardar</button>
      </div>
    </div>
  </div>
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
    <script type="text/javascript" src="../../Alert/Botones_p_p.js"></script>
    <script type="text/javascript" src="../../Alert/main.js"></script>


    <script >
        $(document).ready(function() {
            $('#example').DataTable( {
                "scrollY":        "500px",
                "scrollCollapse": true,
                "paging":         true,
                "scrollX": true,

                dom: 'Bfrtip',
                buttons: [
                    
                ] 
            } );
        } );  
    </script>
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>
