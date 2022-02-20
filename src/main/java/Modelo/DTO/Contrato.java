package Modelo.DTO;

public class Contrato {
    private int idContrato;
    private int idUsuario;
    private String fechaInicio;
    private String fechaFinal;
    private String tipoContrato;
    private String nombreEmpleador;
    private String dirEstablecimiento;
    private String ciudadEstablecimiento;
    private int duracionContrato;
    private String objetoContrato;
    private int estado;

    public Contrato() {
    }

    public Contrato(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Contrato(int idContrato, int idUsuario) {
        this.idContrato = idContrato;
        this.idUsuario = idUsuario;
    }
    
    public Contrato(int idUsuario, String fechaInicio, String fechaFinal, String tipoContrato, String nombreEmpleador, String dirEstablecimiento, String ciudadEstablecimiento, int duracionContrato, String objetoContrato, int estado) {
        this.idUsuario = idUsuario;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.tipoContrato = tipoContrato;
        this.nombreEmpleador = nombreEmpleador;
        this.dirEstablecimiento = dirEstablecimiento;
        this.ciudadEstablecimiento = ciudadEstablecimiento;
        this.duracionContrato = duracionContrato;
        this.objetoContrato = objetoContrato;
        this.estado = estado;
    }

    public Contrato(int idContrato, int idUsuario, String fechaInicio, String fechaFinal, String tipoContrato, String nombreEmpleador, String dirEstablecimiento, String ciudadEstablecimiento, int duracionContrato, String objetoContrato, int estado) {
        this.idContrato = idContrato;
        this.idUsuario = idUsuario;
        this.fechaInicio = fechaInicio;
        this.fechaFinal = fechaFinal;
        this.tipoContrato = tipoContrato;
        this.nombreEmpleador = nombreEmpleador;
        this.dirEstablecimiento = dirEstablecimiento;
        this.ciudadEstablecimiento = ciudadEstablecimiento;
        this.duracionContrato = duracionContrato;
        this.objetoContrato = objetoContrato;
        this.estado = estado;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(String fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public String getTipoContrato() {
        return tipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    public String getNombreEmpleador() {
        return nombreEmpleador;
    }

    public void setNombreEmpleador(String nombreEmpleador) {
        this.nombreEmpleador = nombreEmpleador;
    }

    public String getDirEstablecimiento() {
        return dirEstablecimiento;
    }

    public void setDirEstablecimiento(String dirEstablecimiento) {
        this.dirEstablecimiento = dirEstablecimiento;
    }

    public String getCiudadEstablecimiento() {
        return ciudadEstablecimiento;
    }

    public void setCiudadEstablecimiento(String ciudadEstablecimiento) {
        this.ciudadEstablecimiento = ciudadEstablecimiento;
    }

    public int getDuracionContrato() {
        return duracionContrato;
    }

    public void setDuracionContrato(int duracionContrato) {
        this.duracionContrato = duracionContrato;
    }

    public String getObjetoContrato() {
        return objetoContrato;
    }

    public void setObjetoContrato(String objetoContrato) {
        this.objetoContrato = objetoContrato;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }    
}
