package conexion;

import java.sql.*;

public class Conexion {
    private static final String BASE_DATOS = "adak_market";
    private static final String SERVIDOR = "jdbc:mysql://localhost:3307/" + BASE_DATOS;
    private static final String USUARIO = "root";
    private static final String CLAVE = "";
    
    public static Connection conectar () throws SQLException
    {        
        Connection conexion = null;
        
        try {
            Class.forName ("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(SERVIDOR, USUARIO, CLAVE);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace(System.out);
        }
        
        return conexion;
    }
    
    public static void close(ResultSet rs){
        try {
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }
    
    public static void close(PreparedStatement stmt){
        try {
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }
    
    public static void close(Statement stmt){
        try {
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }
    
    public static void close(Connection cn){
        try {
            cn.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }
}
