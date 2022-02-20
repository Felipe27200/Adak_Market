package sendmail;

import Modelo.DAO.UsuarioDAO;
import Modelo.DTO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "SendMail", urlPatterns = {"/SendMail"})
public class SendMail extends HttpServlet {
    private String host = "smtp.gmail.com";
    //private String port = "465";
    private String port = "587";
    private String correoUsuAdak = "usuadakmarket@gmail.com ";    
    private String correoAdak = "soporteadakmarket@gmail.com";
    private String passwordAdak = "SenaGaes1";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String accion = request.getParameter("accion");
        
        if (accion != null)
        {
            switch(accion)
            {
                case "email":
                    sendEmail(request, response);
                    break;
                case "recuperar":
                    recuperarContrasenia(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        }
        else{
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void sendEmail(HttpServletRequest request, HttpServletResponse response){
        // Recuperar los valores del formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("email");
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("contenido");
        
        String contenido = "Remitente: " + nombre + "\nCorreo electrónico: " + correo + "\n" + "\nMensaje:\n" + mensaje;
        
        gestionarEnvio(correoUsuAdak, correoAdak, asunto, contenido);
        
        try {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (IOException ex) {
            ex.printStackTrace(System.out);
        }
        
    }

    public void recuperarContrasenia(HttpServletRequest request, HttpServletResponse response){
        int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
        Usuario usuario = new Usuario(idUsuario);        
        UsuarioDAO usuarioDao = new UsuarioDAO();
        
        if (usuarioDao.consultar(usuario) != null){
            SecureRandom random = new SecureRandom();
            String nuevaContrasenia = "";
        
            for (int contador = 0; contador < 8; contador++){
                nuevaContrasenia += String.valueOf((char) (random.nextInt(26) + 'a'));
            }
            
            Usuario usuarioConsultado = usuarioDao.consultar(usuario);

            usuarioConsultado.setContrasenia(nuevaContrasenia);
            usuarioDao.cambiarContrasenia(usuarioConsultado);

            //String correo = request.getParameter(usuarioConsultado.getCorreo());
            String asunto = "Recuperar Contraseña";
            String contenido = "Nueva Contraseña: " + nuevaContrasenia;
            
            gestionarEnvio(correoAdak, usuarioConsultado.getCorreo(), asunto, contenido);
        }
        
        try {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (IOException ex) {
            ex.printStackTrace(System.out);
        }
    }
    
    public void gestionarEnvio(String remitente, String destinatario, String asunto, String contenido){
        Properties propiedad = new Properties();
        
        // Definir los párametros del SMTP server
        propiedad.setProperty("mail.smtp.host", host);
        propiedad.setProperty("mail.smtp.port", port);
        propiedad.setProperty("mail.smtp.auth", "true");
        propiedad.setProperty("mail.smtp.starttls.enable", "true");
        
        Session sesionEmail = Session.getDefaultInstance(propiedad);
        
        MimeMessage mail = new MimeMessage(sesionEmail);
        
        try {
            mail.setFrom(new InternetAddress(remitente));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            mail.setSubject(asunto);
            mail.setText(contenido);
            
            Transport transporte = sesionEmail.getTransport("smtp");
            transporte.connect(remitente, passwordAdak);
            transporte.sendMessage(mail, mail.getRecipients(Message.RecipientType.TO));
            
            transporte.close();
        } catch (MessagingException ex) {
            ex.printStackTrace(System.out);
        }
    }
}
