package com.gestionra.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "criterios_evaluacion")
public class Criterio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "La descripción es obligatoria")
    @Column(nullable = false, length = 255)
    private String descripcion;

    @NotNull(message = "El id del resultado de aprendizaje es obligatorio")
    @Column(name = "id_resultado", nullable = false)
    private Long idResultado;

    // Constructor vacío
    public Criterio() {
    }

    // Constructor completo
    public Criterio(Long id, String descripcion, Long idResultado) {
        this.id = id;
        this.descripcion = descripcion;
        this.idResultado = idResultado;
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

    public Long getIdResultado() {
        return idResultado;
    }

    public void setIdResultado(Long idResultado) {
        this.idResultado = idResultado;
    }

    @Override
    public String toString() {
        return "Criterio [id=" + id + ", descripcion=" + descripcion + ", idResultado=" + idResultado + "]";
    }
}
