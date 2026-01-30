package modelo;

// clase criterio de evaluacion
public class CriterioEvaluacion {

    private int id;
    private String descripcion;
    private int idResultado;

    public CriterioEvaluacion() {
    }

    public CriterioEvaluacion(int id, String descripcion, int idResultado) {
        this.id = id;
        this.descripcion = descripcion;
        this.idResultado = idResultado;
    }

    // getters

    public int getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getIdResultado() {
        return idResultado;
    }

    // setters

    public void setId(int id) {
        this.id = id;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setIdResultado(int idResultado) {
        this.idResultado = idResultado;
    }

    @Override
    public String toString() {
        return "CriterioEvaluacion [id=" + id + ", desc=" + descripcion + "]";
    }
}
