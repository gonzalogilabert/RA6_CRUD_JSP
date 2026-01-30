package modelo;

// clase para representar una asignatura
public class Asignatura {

    private int id;
    private String nombre;
    private String codigo;

    // constructor vacio
    public Asignatura() {
    }

    // constructor con todos los campos
    public Asignatura(int id, String nombre, String codigo) {
        this.id = id;
        this.nombre = nombre;
        this.codigo = codigo;
    }

    // getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    // para debug
    @Override
    public String toString() {
        return "Asignatura [id=" + id + ", nombre=" + nombre + ", codigo=" + codigo + "]";
    }
}
