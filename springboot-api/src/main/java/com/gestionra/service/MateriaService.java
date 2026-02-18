package com.gestionra.service;

import com.gestionra.exception.ResourceNotFoundException;
import com.gestionra.model.Materia;
import com.gestionra.repository.MateriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MateriaService {

    @Autowired
    private MateriaRepository materiaRepository;

    // Obtener todas las materias
    public List<Materia> getAll() {
        return materiaRepository.findAll();
    }

    // Obtener una materia por ID
    public Materia getById(Long id) {
        return materiaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materia", id));
    }

    // Crear una nueva materia
    public Materia create(Materia materia) {
        return materiaRepository.save(materia);
    }

    // Actualizar una materia existente
    public Materia update(Long id, Materia materiaActualizada) {
        Materia materia = getById(id); // lanza excepción si no existe
        materia.setNombre(materiaActualizada.getNombre());
        materia.setCodigo(materiaActualizada.getCodigo());
        return materiaRepository.save(materia);
    }

    // Eliminar una materia
    public void delete(Long id) {
        getById(id); // lanza excepción si no existe
        materiaRepository.deleteById(id);
    }
}
