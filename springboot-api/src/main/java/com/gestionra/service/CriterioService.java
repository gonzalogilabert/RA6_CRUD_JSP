package com.gestionra.service;

import com.gestionra.exception.ResourceNotFoundException;
import com.gestionra.model.Criterio;
import com.gestionra.repository.CriterioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CriterioService {

    @Autowired
    private CriterioRepository criterioRepository;

    // Obtener todos los criterios
    public List<Criterio> getAll() {
        return criterioRepository.findAll();
    }

    // Obtener un criterio por ID
    public Criterio getById(Long id) {
        return criterioRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Criterio de Evaluación", id));
    }

    // Obtener todos los criterios de un RA concreto
    public List<Criterio> getByRa(Long idResultado) {
        return criterioRepository.findByIdResultado(idResultado);
    }

    // Crear un nuevo criterio
    public Criterio create(Criterio criterio) {
        return criterioRepository.save(criterio);
    }

    // Actualizar un criterio existente
    public Criterio update(Long id, Criterio criterioActualizado) {
        Criterio criterio = getById(id); // lanza excepción si no existe
        criterio.setDescripcion(criterioActualizado.getDescripcion());
        criterio.setIdResultado(criterioActualizado.getIdResultado());
        return criterioRepository.save(criterio);
    }

    // Eliminar un criterio
    public void delete(Long id) {
        getById(id); // lanza excepción si no existe
        criterioRepository.deleteById(id);
    }
}
