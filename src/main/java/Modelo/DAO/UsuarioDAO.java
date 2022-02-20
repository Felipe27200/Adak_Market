package Modelo.DAO;

import Modelo.DTO.Usuario;
import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO extends Conexion{
    private static final String SQL_IDENTIFICAR = "SELECT * FROM usuarios WHERE estado = 1 AND id_usuario = ? AND contrasenia = ?";
    private static final String SQL_SELECT = "SELECT * FROM usuarios WHERE estado = 1";
    private static final String SQL_CONSULTAR = "SELECT * FROM usuarios WHERE id_usuario = ?";
    private static final String SQL_UPDATE = "UPDATE usuarios SET id_rol = ?, nombre = ?, correo = ?, tipo_documento = ?, direccion = ?, fecha_nacimiento = ?, formacion = ?, telefono = ?, edad = ?, genero = ?, cargo = ? WHERE id_usuario = ?";
    private static final String SQL_DELETE = "UPDATE usuarios SET estado = 0 WHERE id_usuario = ?";
    private static final String SQL_INSERT = "INSERT INTO usuarios(id_usuario, id_rol, nombre, correo, tipo_documento, direccion, fecha_nacimiento, formacion, telefono, edad, genero, cargo, contrasenia)"
                                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_PASSWORD = "UPDATE usuarios SET contrasenia = ? WHERE id_usuario = ?";
    
    
    public Usuario identificar(Usuario user){
        Usuario usuario = null;
        
        Connection cn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try{
            cn = Conexion.conectar();
            
            stmt = cn.prepareStatement(SQL_IDENTIFICAR);
            
            stmt.setInt(1, user.getId_usuario());
            stmt.setString(2, user.getContrasenia());
            
            rs = stmt.executeQuery();
            
            if (rs.next() == true){
                usuario = new Usuario();
                
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setId_rol(rs.getInt("id_rol")); 
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setTipo_documento(rs.getString("tipo_Documento")); 
                usuario.setDireccion(rs.getString("direccion")); 
                usuario.setFecha_nacimiento(rs.getString("fecha_nacimiento")); 
                usuario.setFormacion(rs.getString("formacion")); 
                usuario.setTelefono(rs.getString("telefono")); 
                usuario.setEdad(rs.getInt("edad")); 
                usuario.setGenero(rs.getString("genero")); 
                usuario.setCargo(rs.getString("cargo")); 
                usuario.setEstado(rs.getInt("estado")); 
                usuario.setContrasenia(rs.getString("contrasenia")); 
            }
        }
        catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        }
        finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(cn);
        }
        
        return usuario;
    }
    
    public List<Usuario> listar(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuario usuario = null;
        List <Usuario> usuarios = new ArrayList<>();
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            
            while (rs.next()){
                int idUsuario = rs.getInt("id_usuario");
                int idRol = rs.getInt("id_rol");
                String nombre = rs.getString("nombre");
                String correo = rs.getString("correo");
                String tipoDocumento = rs.getString("tipo_Documento");
                String direccion = rs.getString("direccion");
                String fechaNacimiento = rs.getString("fecha_nacimiento");
                String formacion = rs.getString("formacion");
                String telefono = rs.getString("telefono");
                int edad = rs.getInt("edad");
                String genero = rs.getString("genero");
                String cargo = rs.getString("cargo");
                int estado = rs.getInt("estado");
                String contrasenia = rs.getString("contrasenia");
                
                usuario = new Usuario(idUsuario, idRol, nombre, correo, tipoDocumento, direccion, 
                        fechaNacimiento, formacion, telefono, edad, genero, cargo, estado, contrasenia);
                
                usuarios.add(usuario);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return usuarios;
    }
    
    public Usuario consultar(Usuario usuario){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_CONSULTAR);
            stmt.setInt(1, usuario.getId_usuario());
            rs = stmt.executeQuery();
            
            // Este método nos proporciona el primer registro devuelto0
            //rs.absolute(1);
            
            while (rs.next())
            {
                usuario.setId_rol(rs.getInt("id_rol")); 
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setTipo_documento(rs.getString("tipo_Documento")); 
                usuario.setDireccion(rs.getString("direccion")); 
                usuario.setFecha_nacimiento(rs.getString("fecha_nacimiento")); 
                usuario.setFormacion(rs.getString("formacion")); 
                usuario.setTelefono(rs.getString("telefono")); 
                usuario.setEdad(rs.getInt("edad")); 
                usuario.setGenero(rs.getString("genero")); 
                usuario.setCargo(rs.getString("cargo")); 
                usuario.setEstado(rs.getInt("estado")); 
                usuario.setContrasenia(rs.getString("contrasenia"));
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return usuario;
    }

    public int insertar(Usuario usuario){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, usuario.getId_usuario());
            stmt.setInt(2, usuario.getId_rol());
            stmt.setString(3, usuario.getNombre());
            stmt.setString(4, usuario.getCorreo());
            stmt.setString(5, usuario.getTipo_documento());
            stmt.setString(6, usuario.getDireccion());
            stmt.setString(7, usuario.getFecha_nacimiento());
            stmt.setString(8, usuario.getFormacion());
            stmt.setString(9, usuario.getTelefono());
            stmt.setInt(10, usuario.getEdad());
            stmt.setString(11, usuario.getGenero());
            stmt.setString(12, usuario.getCargo());
            stmt.setString(13, usuario.getContrasenia());
            
            rows = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return rows;
    }
    
    public int actualizar(Usuario usuario){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setInt(1, usuario.getId_rol());
            stmt.setString(2, usuario.getNombre());
            stmt.setString(3, usuario.getCorreo());
            stmt.setString(4, usuario.getTipo_documento());
            stmt.setString(5, usuario.getDireccion());
            stmt.setString(6, usuario.getFecha_nacimiento());
            stmt.setString(7, usuario.getFormacion());
            stmt.setString(8, usuario.getTelefono());
            stmt.setInt(9, usuario.getEdad());
            stmt.setString(10, usuario.getGenero());
            stmt.setString(11, usuario.getCargo());
            stmt.setInt(12, usuario.getId_usuario());
            
            rows = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return rows;
    }
    
    public int eliminar(Usuario usuario){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_DELETE);
            
            stmt.setInt(1, usuario.getId_usuario());
            
            rows = stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return rows;
    }
    
    public void cambiarContrasenia(Usuario usuario){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_PASSWORD);
            
            stmt.setString(1, usuario.getContrasenia());
            stmt.setInt(2, usuario.getId_usuario());
            
            stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
}
