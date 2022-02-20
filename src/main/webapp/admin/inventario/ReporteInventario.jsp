<%-- 
    Document   : ReporteInventario
    Created on : 19/05/2021, 08:19:46 AM
    Author     : sofy
--%>

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
	<title>Reporte Inventario</title>
        
    </head>
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
  <div class="col-md-9 mt-4 color1"> 
  	
  	<div class="row">
		<div class="col text-center">
			<h2 class="display-4">Reporte Inventario</h2>
			</div>
			</div>

  	       <div class="row pt-5">
                    <div class="col-lg-6 col-md text-center">
                    	<h3>Cantidad Almacenada en el Inventario</h3>
                        <canvas id="inventario"></canvas>
                    </div>

                     <div class="col-lg-6 col-md text-center">
                     	<h3>Cantidad de productos en el mes</h3>
                        <canvas id="graf_2"></canvas>
                    </div>
                 
	 </div>			

	      <div class="row justify-content-center">
                 	<div class="col-lg-3 col-md-4 col-sm-6 mt-5 mb-4 text-center">
                 		<a href="consultar_inventario1.jsp" class="btn btn-success btn-block mt-3">Reporte Tablas</a>
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


    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>	
    <script type="text/javascript" src="../../graficas/Chart.bundle.min.js"></script>
    <script type="text/javascript" src="../../graficas/graficasInventario.js"></script>

    <script >
        $(document).ready(function() {
            $('#consulta_inventario').DataTable( {
                "scrollY":        "500px",
                "scrollCollapse": true,
                "paging":         true,
                "scrollX": true,


                dom: 'Bfrtip',
                buttons: [
                    'copy', 'excel', 'pdf', 'print'
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