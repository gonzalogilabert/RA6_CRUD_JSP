package com.gestionra.repository;

import com.gestionra.model.Materia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MateriaRepository extends JpaRepository<Materia, Long> {
    // JpaRepository ya proporciona: findAll, findById, save, deleteById, etc.
}
