package Modelo.DAO;

import Modelo.DTO.Contrato;
import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContratoDAO {
    private static final String SQL_SELECT = "SELECT * FROM contratos WHERE estado = 1";
    private static final String SQL_CONSULTAR = "SELECT * FROM contratos WHERE id_usuario = ?";
    private static final String SQL_INSERT = "INSERT INTO contratos (id_usuario, fecha_inicio, fecha_final, tipo_contrato, nombre_empleador, dir_establecimiento, ciudad_establecimiento, duracion_contrato, objeto_contrato)" + 
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE contratos SET fecha_inicio = ?, fecha_final = ?, tipo_contrato = ?, nombre_empleador = ?, dir_establecimiento = ?, ciudad_establecimiento = ?, duracion_contrato = ?, objeto_contrato = ? WHERE id_usuario = ?";
    private static final String SQL_DELETE = "UPDATE contratos SET estado = 0 WHERE id_usuario = ?";
    
    private List<Contrato> listar(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Contrato contrato = null;
        List <Contrato> contratos = new ArrayList<>();
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            
            while (rs.next()){
                int idUsuario = rs.getInt("id_usuario");
                String fechaInicio = rs.getString("fecha_incio");
                String fechaFinal = rs.getString("fecha_final");
                String tipoContrato = rs.getString("tipo_contrato");
                String nombreEmpleador = rs.getString("nombre_empleador");
                String dirEstablecimiento = rs.getString("dir_establecimiento");
                String ciudadEstablecimiento = rs.getString("ciudad_establecimiento");
                int duracionContrato = rs.getInt("duracion_contrato");
                String objetoContrato = rs.getString("objeto_contrato");
                int estado = rs.getInt("estado");
                
                contrato = new Contrato(idUsuario, fechaInicio, fechaFinal, tipoContrato, nombreEmpleador, dirEstablecimiento, ciudadEstablecimiento, duracionContrato, objetoContrato, estado);
                
                contratos.add(contrato);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return contratos;        
    }
    
    private Contrato consultar(Contrato contrato)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_CONSULTAR);
            stmt.setInt(1, contrato.getIdUsuario());
            rs = stmt.executeQuery();
            
            // Este método nos proporciona el primer registro devuelto0
            //rs.absolute(1);
            
            while (rs.next())
            {
                contrato.setFechaInicio(rs.getString("fecha_inicio"));
                contrato.setFechaFinal(rs.getString("fecha_final"));
                contrato.setTipoContrato(rs.getString("tipo_contrato"));
                contrato.setNombreEmpleador(rs.getString("nombre_empleador"));
                contrato.setDirEstablecimiento(rs.getString("dir_establecimiento"));
                contrato.setCiudadEstablecimiento(rs.getString("ciudad_establecimiento"));
                contrato.setDuracionContrato(rs.getInt("duracion_contrato"));
                contrato.setObjetoContrato(rs.getString("objeto_contrato"));
                contrato.setEstado(rs.getInt("estado"));
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return contrato;
    }
    
    public void insertar(Contrato contrato){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setInt(1, contrato.getIdUsuario());
            stmt.setString(2, contrato.getFechaInicio());
            stmt.setString(3, contrato.getFechaFinal());
            stmt.setString(4, contrato.getTipoContrato());
            stmt.setString(5, contrato.getNombreEmpleador());
            stmt.setString(6, contrato.getDirEstablecimiento());
            stmt.setString(7, contrato.getCiudadEstablecimiento());
            stmt.setInt(8, contrato.getDuracionContrato());
            stmt.setString(9, contrato.getObjetoContrato());
            
            stmt.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
    
    public void actualizar(Contrato contrato){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, contrato.getFechaInicio());
            stmt.setString(2, contrato.getFechaFinal());
            stmt.setString(3, contrato.getTipoContrato());
            stmt.setString(4, contrato.getNombreEmpleador());
            stmt.setString(5, contrato.getDirEstablecimiento());
            stmt.setString(6, contrato.getCiudadEstablecimiento());
            stmt.setInt(7, contrato.getDuracionContrato());
            stmt.setString(8, contrato.getObjetoContrato());
            stmt.setInt(9, contrato.getIdUsuario());
            
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
    
    public void eliminar(Contrato contrato){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_DELETE);
            
            stmt.setInt(1, contrato.getIdUsuario());
            
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
}
