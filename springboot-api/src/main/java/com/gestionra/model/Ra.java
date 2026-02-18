package com.gestionra.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "resultados_aprendizaje")
public class Ra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "La descripción es obligatoria")
    @Column(nullable = false, length = 255)
    private String descripcion;

    @NotNull(message = "El id de la asignatura es obligatorio")
    @Column(name = "id_asignatura", nullable = false)
    private Long idAsignatura;

    // Constructor vacío
    public Ra() {
    }

    // Constructor completo
    public Ra(Long id, String descripcion, Long idAsignatura) {
        this.id = id;
        this.descripcion = descripcion;
        this.idAsignatura = idAsignatura;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Long getIdAsignatura() {
        return idAsignatura;
    }

    public void setIdAsignatura(Long idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    @Override
    public String toString() {
        return "Ra [id=" + id + ", descripcion=" + descripcion + ", idAsignatura=" + idAsignatura + "]";
    }
}
