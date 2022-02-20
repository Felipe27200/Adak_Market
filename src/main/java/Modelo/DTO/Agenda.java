package Modelo.DTO;

public class Agenda {
    private int id_agenda;
    private int id_usuario;
    private String horaEntrada;
    private String horaSalida;
    private String dia;
    private int estado;

    public Agenda() {
    }

    public Agenda(int id_agenda) {
        this.id_agenda = id_agenda;
    }

    public Agenda(int id_agenda, int id_usuario) {
        this.id_agenda = id_agenda;
        this.id_usuario = id_usuario;
    }
    
    public Agenda(int id_usuario, String horaEntrada, String horaSalida, String dia, int estado) {
        this.id_usuario = id_usuario;
        this.horaEntrada = horaEntrada;
        this.horaSalida = horaSalida;
        this.dia = dia;
        this.estado = estado;
    }

    public Agenda(int id_agenda, int id_usuario, String horaEntrada, String horaSalida, String dia, int estado) {
        this.id_agenda = id_agenda;
        this.id_usuario = id_usuario;
        this.horaEntrada = horaEntrada;
        this.horaSalida = horaSalida;
        this.dia = dia;
        this.estado = estado;
    }
    
    public int getId_agenda() {
        return id_agenda;
    }

    public void setId_agenda(int id_agenda) {
        this.id_agenda = id_agenda;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(String horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
