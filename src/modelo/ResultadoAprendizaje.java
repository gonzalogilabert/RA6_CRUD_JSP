package modelo;

// clase para los resultados de aprendizaje
public class ResultadoAprendizaje {

    private int id;
    private String descripcion;
    private int idAsignatura;

    // constructor vacio
    public ResultadoAprendizaje() {
    }

    // constructor completo
    public ResultadoAprendizaje(int id, String descripcion, int idAsignatura) {
        this.id = id;
        this.descripcion = descripcion;
        this.idAsignatura = idAsignatura;
    }

    // getters y setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdAsignatura() {
        return idAsignatura;
    }

    public void setIdAsignatura(int idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    @Override
    public String toString() {
        return "ResultadoAprendizaje [id=" + id + ", descripcion=" + descripcion + "]";
    }
}
