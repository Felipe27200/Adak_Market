<%@page import="Modelo.DTO.Usuario"%>
<!-- Fila barra navegación superior -->
<div class="row">
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    
    String url = "", url_dashboard = "";
    String texto = "";
    String urlPedidos = "";
    
    if (usuario.getId_rol() == 1)
    {
        url_dashboard = "../talento_humano/editarAdmin.jsp";
        url = "../talento_humano/dashboard_talento_humano.jsp";
        urlPedidos = "../proveedores_pedidos/dashboard_proveedores.jsp";
        
        texto = "Talento Humano";
    }
    else{
        url_dashboard = "../empleado/dashboard_Empleado.jsp";
        url = "../empleado/dashboard_Empleado.jsp";
        urlPedidos = "../empleado/PedidosEmpleados.jsp";
        texto = "Ver Perfil";
    }
%>    <div class="col">
        <nav class="navbar navbar-expand-md bg-light navbar-light">
            <a href="#" class="navbar-brand"></a><img src="../../img/Logotipo Adak.png" style="width: 5%">
            <!-- Permite retraer el menú al cambiar la resolución -->
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#Menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Contenido y lista del menú -->
            <div class="collapse navbar-collapse justify-content-end" id="Menu">
                <ul class="navbar-nav ">
                    <li class="nav-item"><a href="<%=url_dashboard%>" class="nav-link"><i class="fas fa-user iconoCerrar"></i>${usuario.nombre}</a></li>
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link active dropdown-toggle" data-toggle="dropdown" id="lista">Servicios</a>
                        <div class="dropdown-menu">
                            <a href="../inventario/dashboard_inventario.jsp" class="dropdown-item">Inventario</a>
                            <a href="<%=urlPedidos%>" class="dropdown-item">Proveedores y Pedidos</a>
                            <a href="<%=url%>" class="dropdown-item"> <%=texto%></a>
                        </div>
                    </li>

                    <li class="nav-item"><a href="<%=request.getContextPath()%>/srvUsuario?accion=cerrar" class="nav-link"><i class="fas fa-sign-out-alt iconoCerrar"></i>Cerrar Sesión</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>
