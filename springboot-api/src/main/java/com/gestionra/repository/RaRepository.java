package com.gestionra.repository;

import com.gestionra.model.Ra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RaRepository extends JpaRepository<Ra, Long> {
    // Buscar todos los RA de una asignatura concreta
    List<Ra> findByIdAsignatura(Long idAsignatura);
}
