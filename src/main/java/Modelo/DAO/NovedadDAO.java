
package Modelo.DAO;

import Modelo.DTO.Novedad;
import conexion.Conexion;
import java.sql.*;

public class NovedadDAO {
    private static final String SQL_INSERT = "INSERT INTO novedades (id_usuario, fecha_novedad, descripcion) VALUE (?, ?, ?)";
    private static final String SQL_CONSULTAR = "SELECT * FROM novedades WHERE id_usuario = ?";
    
    public Novedad consultar (Novedad novedad)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.conectar();
            
            stmt = conn.prepareStatement(SQL_CONSULTAR);
            stmt.setInt(1, novedad.getIdUsuario());
            rs = stmt.executeQuery();
            
            while (rs.next()){
                novedad.setFechaNovedad(rs.getString("fecha_novedad"));
                novedad.setDescripcion(rs.getString("descripcion"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return novedad;
    }
    
    public void insertar(Novedad novedad){
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_INSERT);

            stmt.setInt(1, novedad.getIdUsuario());
            stmt.setString(2, novedad.getFechaNovedad());
            stmt.setString(3, novedad.getDescripcion());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
}
