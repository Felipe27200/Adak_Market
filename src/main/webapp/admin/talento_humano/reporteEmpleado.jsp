
<%@page import="java.util.List"%>
<%@page import="Modelo.DTO.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.DAO.UsuarioDAO"%>
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
        <link rel="stylesheet" href="../../css/all.css">
        <link rel="stylesheet" href="../../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style_dashboard.css">
        <link rel="short icon" href="../../img/Logotipo Adak.png">
        <link rel="stylesheet" href="../../DataTables/datatables.min.css">
        <title>Reporte Empleados</title>
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
                            <h1>Gestión Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="registrarEmpleado.jsp"  class="nav-link"><i class="fas fa-user-plus"></i> Registrar Empleado</a></li>			
                            <li class="nav-item"><a href="reporteEmpleado.jsp" class="nav-link"><i class="far fa-address-card"></i> Consultar Empleado</a></li>	
                        </ul>

                        <div class="navTitulo">
                            <h1>Contrato Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="reporteContratoTablas.jsp" class="nav-link"><i class="fas fa-id-badge"></i> Consultar contratos</a></li>
                        </ul>

                        <div class="navTitulo">
                            <h1>Agenda Empleados</h1>
                        </div>

                        <ul class="navbar-nav">
                            <li class="nav-item"><a href="reporteAgendaTablas.jsp" class="nav-link"><i class="fas fa-calendar-alt"></i> Consultar agenda empleado</a></li>
                        </ul>
                    </nav>	
                </div>

                <!-- Columna contenido -centro- -->
                <div class="col-md-9 mt-4">
                    <table id="example" class="table display table-striped table-bordered" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Edad</th>
                                <th>Documento</th>
                                <th>Cargo</th>
                                <th>Correo</th>
                                <th>Telefono</th>
                                <th>editar</th>
                            </tr>
                        </thead>



                        <tbody>
                        <%
                            UsuarioDAO usuarioDAO = new UsuarioDAO();
                            
                            List<Usuario> usuarios = usuarioDAO.listar();
                            
                            for (Usuario usuario : usuarios){
                        %>                            
                            <tr>
                                <td><%=usuario.getNombre()%></td>
                                <td><%=usuario.getEdad()%></td>
                                <td><%=usuario.getId_usuario()%></td>
                                <td><%=usuario.getCargo()%></td>
                                <td><%=usuario.getCorreo()%></td>
                                <td><%=usuario.getTelefono()%></td>
                                <td>
                                    <div class="btn-group ">
                                        <a href="modificarEmpleadoFormulario.jsp?documento=<%=usuario.getId_usuario()%>" class="btn btn-primary btn-sm boton"><i class="fas fa-edit"></i></a>
                                        <a href="consultarEmpleado.jsp?documento=<%=usuario.getId_usuario()%>" class="btn btn-warning btn-sm boton "><i class="fas fa-eye"></i></a>
                                        <a  href="eliminarUsuario.jsp?documento=<%=usuario.getId_usuario()%>" id="btnEliminar" class="btn btn-danger btn-sm boton" onclick="return ConfirmaBorrado();"><i class="far fa-trash-alt"></i></a>
                                    </div>
                                </td> 
                            </tr>                            
                        <%
                            }
                        %>
                        </tbody>

                    </table>
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
        <script type="text/javascript" src="../../Alert/botones.js"></script>

        <script >
        $(document).ready(function () {
            $('#example').DataTable({
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

        <script type="text/javascript">
            function ConfirmaBorrado() {
                var respuesta = confirm("Estás seguro de eliminar el usuario?");

                if (respuesta == true) {
                    return true;
                } else
                    return false;
            }
        </script>
    </body>
</html>
<%
}
else{
    response.sendRedirect("../../index.jsp");
}
%>