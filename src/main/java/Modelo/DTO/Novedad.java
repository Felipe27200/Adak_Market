package Modelo.DTO;

public class Novedad {
    private int idNovedad;
    private int idUsuario;
    private String fechaNovedad;
    private String descripcion;

    public Novedad() {
    }

    public Novedad(int idNovedad) {
        this.idNovedad = idNovedad;
    }

    public Novedad(int idNovedad, int idUsuario) {
        this.idNovedad = idNovedad;
        this.idUsuario = idUsuario;
    }

    public Novedad(int idUsuario, String fechaNovedad, String descripcion) {
        this.idUsuario = idUsuario;
        this.fechaNovedad = fechaNovedad;
        this.descripcion = descripcion;
    }

    public Novedad(int idNovedad, int idUsuario, String fechaNovedad, String descripcion) {
        this.idNovedad = idNovedad;
        this.idUsuario = idUsuario;
        this.fechaNovedad = fechaNovedad;
        this.descripcion = descripcion;
    }

    public int getIdNovedad() {
        return idNovedad;
    }

    public void setIdNovedad(int idNovedad) {
        this.idNovedad = idNovedad;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFechaNovedad() {
        return fechaNovedad;
    }

    public void setFechaNovedad(String fechaNovedad) {
        this.fechaNovedad = fechaNovedad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
