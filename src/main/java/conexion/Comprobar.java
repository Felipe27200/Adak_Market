package conexion;

import java.sql.*;

public class Comprobar {
    public static void main(String[] args) throws ClassNotFoundException{
        Connection conexion = null;
        
        try {
            conexion = Conexion.conectar();
        } catch (SQLException ex) {
           ex.printStackTrace(System.out);
        }
        
        if (conexion != null){
            System.out.println("Conexión es correcta");
        }
        else{
            System.out.println("Conexión Erronéa");
        }
    }
}
