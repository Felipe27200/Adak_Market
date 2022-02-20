package Modelo.DTO;

public class Rol {
    private int id_rol;
    private int id_permiso;
    private String tipo_rol;

    public Rol() {
    }

    public Rol(int id_rol, int id_permiso, String tipo_rol) {
        this.id_rol = id_rol;
        this.id_permiso = id_permiso;
        this.tipo_rol = tipo_rol;
    }
    
    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_permiso() {
        return id_permiso;
    }

    public void setId_permiso(int id_permiso) {
        this.id_permiso = id_permiso;
    }

    public String getTipo_rol() {
        return tipo_rol;
    }

    public void setTipo_rol(String tipo_rol) {
        this.tipo_rol = tipo_rol;
    }
    
}
