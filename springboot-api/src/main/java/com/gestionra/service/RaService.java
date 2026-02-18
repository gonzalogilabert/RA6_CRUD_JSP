package com.gestionra.service;

import com.gestionra.exception.ResourceNotFoundException;
import com.gestionra.model.Ra;
import com.gestionra.repository.RaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RaService {

    @Autowired
    private RaRepository raRepository;

    // Obtener todos los resultados de aprendizaje
    public List<Ra> getAll() {
        return raRepository.findAll();
    }

    // Obtener un RA por ID
    public Ra getById(Long id) {
        return raRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Resultado de Aprendizaje", id));
    }

    // Obtener todos los RA de una asignatura concreta
    public List<Ra> getByMateria(Long idAsignatura) {
        return raRepository.findByIdAsignatura(idAsignatura);
    }

    // Crear un nuevo RA
    public Ra create(Ra ra) {
        return raRepository.save(ra);
    }

    // Actualizar un RA existente
    public Ra update(Long id, Ra raActualizado) {
        Ra ra = getById(id); // lanza excepción si no existe
        ra.setDescripcion(raActualizado.getDescripcion());
        ra.setIdAsignatura(raActualizado.getIdAsignatura());
        return raRepository.save(ra);
    }

    // Eliminar un RA
    public void delete(Long id) {
        getById(id); // lanza excepción si no existe
        raRepository.deleteById(id);
    }
}
