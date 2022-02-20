package Controlador;

import Modelo.DAO.UsuarioDAO;
import Modelo.DTO.Usuario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/srvUsuario")
public class srvUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        
        try{
           if (accion != null){
               switch (accion){
                   case "verificar":
                       verificar(request, response);
                       break;
                   case "cerrar":
                       cerrarsession(request, response);
                       break;
                   case "cambiarPassword":
                       cambiarContrasenia(request, response);
                       break;
                   case "editarUsuario":
                       editarUsuario(request, response);
                       break;
                    default:
                       response.sendRedirect(request.getContextPath() + "/index.jsp");
                       break;
               }
           } 
           else{
                response.sendRedirect(request.getContextPath() + "/index.jsp");

           }
        }catch(Exception e){
            System.out.println("Fallo: " + e.getMessage());;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void verificar(HttpServletRequest request, HttpServletResponse response){
        HttpSession sesion;
        UsuarioDAO dao;
        Usuario usuario;
        
        usuario = obtenerUsuario(request);
        dao = new UsuarioDAO();
        
        usuario = dao.identificar(usuario);
        
        try {
            if (usuario != null && usuario.getId_rol() == 1){
                sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);
                
                String dashboard_TA_admin = request.getContextPath() + "/admin/talento_humano/dashboard_talento_humano.jsp";

                response.sendRedirect(dashboard_TA_admin);
            }
            else if (usuario != null && usuario.getId_rol() == 2)
            {
                sesion = request.getSession();
                sesion.setAttribute("usuario", usuario);

                response.sendRedirect(request.getContextPath() + "/admin/empleado/dashboard_Empleado.jsp");
            }
            else{
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        } catch (IOException ex) {
            ex.printStackTrace(System.out);
        }
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response)  throws Exception{
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect(request.getContextPath() + "/index.jsp");

    }
    
    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html; charset=UTF-8");

        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));


        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.consultar(new Usuario(idUsuario));
        
        if (usuario != null){
            String nombre = obtenerCaracterEspecial(request.getParameter("nombre"));
            
            usuario.setId_rol("Administrador".equals(request.getParameter("cargo")) ? 1 : 2); 
            usuario.setNombre(nombre);
            usuario.setTipo_documento(obtenerCaracterEspecial(request.getParameter("tipoDocumento")) );
            usuario.setFecha_nacimiento(request.getParameter("nacimiento"));
            usuario.setEdad(Integer.parseInt(request.getParameter("edad")));
            usuario.setTelefono(request.getParameter("telefono"));
            usuario.setCorreo(obtenerCaracterEspecial(request.getParameter("correo")));
            usuario.setDireccion(obtenerCaracterEspecial(request.getParameter("direccion")));
            usuario.setGenero(request.getParameter("genero"));
            usuario.setFormacion(obtenerCaracterEspecial(request.getParameter("formacion")));
            usuario.setCargo(obtenerCaracterEspecial(request.getParameter("cargo")));
            
            usuarioDAO.actualizar(usuario);

            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
        }
        
        if ("editarUsuario".equals(request.getParameter("accion"))){
            response.sendRedirect(request.getContextPath() + "/admin/talento_humano/editarAdmin.jsp");            
        }
        else
            response.sendRedirect(request.getContextPath() + "/admin/talento_humano/reporteEmpleado.jsp");
    }
    
    private void cambiarContrasenia(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html;charset=UTF-8");

        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String mensaje = "";
        //HttpSession sesion = request.getSession();
        
        Usuario usuario = usuarioDAO.consultar(new Usuario(id_usuario));
        
        if (request.getParameter("passwordActual").equals(usuario.getContrasenia()))
        {
            if (request.getParameter("nuevaPassword").equals(request.getParameter("passwordActual")))
            {
                mensaje = "La nueva contraseña no puede ser igual a la anterior";                
            }
            else if (request.getParameter("nuevaPassword").equals(request.getParameter("confirmarPassword")))
            {                
                usuario.setContrasenia(request.getParameter("nuevaPassword"));
                
                usuarioDAO.cambiarContrasenia(usuario);
                
                mensaje = "Contraseña Modificada";
            }
            else
                mensaje = "La contraseña nueva no coincide en: Repita la nueva Contraseña";
        }
        else
            mensaje = "La contraseña ingresada es incorrecta";
        
        mensaje = obtenerCaracterEspecial(mensaje);
        
        if (usuario.getId_rol() == 1)
            response.sendRedirect(request.getContextPath() + "/admin/talento_humano/editarAdmin.jsp?mensaje=" + mensaje);
        else 
            response.sendRedirect(request.getContextPath() + "/admin/empleado/dashboard_Empleado.jsp?mensaje=" + mensaje);
    }

    private Usuario obtenerUsuario(HttpServletRequest request) {
        Usuario usuario = new Usuario();
        usuario.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
        usuario.setContrasenia(request.getParameter("password"));
        
        return usuario;
    }
    
    private String obtenerCaracterEspecial(String cadena) throws UnsupportedEncodingException{
            return new String (cadena.getBytes("ISO-8859-1"), "UTF-8");
    }
}
