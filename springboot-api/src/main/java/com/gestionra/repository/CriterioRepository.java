package com.gestionra.repository;

import com.gestionra.model.Criterio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CriterioRepository extends JpaRepository<Criterio, Long> {
    // Buscar todos los criterios de un resultado de aprendizaje concreto
    List<Criterio> findByIdResultado(Long idResultado);
}
