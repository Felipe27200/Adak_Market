package Modelo.DTO;

public class Usuario {
    private int id_usuario;
    private int id_rol;
    private String nombre;
    private String correo;
    private String tipo_documento;
    private String direccion;
    private String fecha_nacimiento;
    private String formacion;
    private String telefono;
    private int edad;
    private String genero;
    private String cargo;
    private int estado;
    private String contrasenia;

    public Usuario() {
    }

    public Usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Usuario(int id_usuario, int id_rol, String nombre, String correo, String tipo_documento, String direccion, String fecha_nacimiento, String formacion, String telefono, int edad, String genero, String cargo, String contrasenia) {
        this.id_usuario = id_usuario;
        this.id_rol = id_rol;
        this.nombre = nombre;
        this.correo = correo;
        this.tipo_documento = tipo_documento;
        this.direccion = direccion;
        this.fecha_nacimiento = fecha_nacimiento;
        this.formacion = formacion;
        this.telefono = telefono;
        this.edad = edad;
        this.genero = genero;
        this.cargo = cargo;
        this.contrasenia = contrasenia;
    }

    public Usuario(int id_usuario, int id_rol, String nombre, String correo, String tipo_documento, String direccion, String fecha_nacimiento, String formacion, String telefono, int edad, String genero, String cargo, int estado, String contrasenia) {
        this.id_usuario = id_usuario;
        this.id_rol = id_rol;
        this.nombre = nombre;
        this.correo = correo;
        this.tipo_documento = tipo_documento;
        this.direccion = direccion;
        this.fecha_nacimiento = fecha_nacimiento;
        this.formacion = formacion;
        this.telefono = telefono;
        this.edad = edad;
        this.genero = genero;
        this.cargo = cargo;
        this.estado = estado;
        this.contrasenia = contrasenia;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getFormacion() {
        return formacion;
    }

    public void setFormacion(String formacion) {
        this.formacion = formacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

}
