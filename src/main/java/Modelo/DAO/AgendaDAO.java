package Modelo.DAO;

import Modelo.DTO.Agenda;
import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AgendaDAO {
    private static final String SQL_SELECT = "SELECT * FROM agendas WHERE estado = 1";
    private static final String SQL_CONSULTAR = "SELECT * FROM agendas WHERE usuario_id_usuario = ?";
    private static final String SQL_CONSULTAR_DIA = "SELECT * FROM agendas WHERE usuario_id_usuario = ? AND dia = ?";
    private static final String SQL_INSERT = "INSERT INTO agendas (usuario_id_usuario, hora_entrada, hora_salida, dia) VALUES (?, ?, ?, ?)";
    private static final String SQL_UPDATE = "UPDATE agendas SET hora_entrada = ?, hora_salida = ? WHERE usuario_id_usuario = ? AND dia = ?";
    private static final String SQL_DELETE = "UPDATE agendas SET estado = 0 WHERE usuario_id_usuario = ?";
    
    private List<Agenda> listar(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Agenda agenda = null;
        List <Agenda> agendas = new ArrayList<>();
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            
            while (rs.next()){
                int id_usuario = rs.getInt("id_usuario");
                String horaEntrada = rs.getString("hora_entrada");
                String horaSalida = rs.getString("hora_salida");
                String dia = rs.getString("dia");
                int estado = rs.getInt("estado");
                
                agenda = new Agenda(id_usuario, horaEntrada, horaSalida, dia, estado);
                
                agendas.add(agenda);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return agendas;        
    }
    
    private Agenda consultar(Agenda agenda){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.conectar();
            
            stmt = conn.prepareStatement(SQL_CONSULTAR);
            stmt.setInt(1, agenda.getId_usuario());
            rs = stmt.executeQuery();
            
            while (rs.next()){
                agenda.setHoraEntrada(rs.getString("hora_entrada"));
                agenda.setHoraSalida(rs.getString("hora_salida"));
                agenda.setDia(rs.getString("dia"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return agenda;        
    }
    
    private Agenda consultarDia(Agenda agenda){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Conexion.conectar();
            
            stmt = conn.prepareStatement(SQL_CONSULTAR_DIA);
            stmt.setInt(1, agenda.getId_usuario());
            stmt.setString(2, agenda.getDia());
            rs = stmt.executeQuery();
            
            while (rs.next()){
                agenda.setHoraEntrada(rs.getString("hora_entrada"));
                agenda.setHoraSalida(rs.getString("hora_salida"));
                agenda.setDia(rs.getString("dia"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return agenda;        
    }
        
    public void insertar(Agenda agenda){
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_INSERT);

            stmt.setInt(1, agenda.getId_usuario());
            stmt.setString(2, agenda.getHoraEntrada());
            stmt.setString(3, agenda.getHoraSalida());
            stmt.setString(4, agenda.getDia());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }
    
    public void actualizar(Agenda agenda){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            stmt.setString(1, agenda.getHoraEntrada());
            stmt.setString(2, agenda.getHoraSalida());
            stmt.setInt(3, agenda.getId_usuario());
            stmt.setString(4, agenda.getDia());
            
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }

    public void eliminar(Agenda agenda){
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Conexion.conectar();
            stmt = conn.prepareStatement(SQL_UPDATE);

            stmt.setInt(1, agenda.getId_usuario());

            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
    }}
