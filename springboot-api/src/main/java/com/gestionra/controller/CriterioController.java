package com.gestionra.controller;

import com.gestionra.model.Criterio;
import com.gestionra.service.CriterioService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/criterios")
public class CriterioController {

    @Autowired
    private CriterioService criterioService;

    // GET /api/criterios — Listar todos los criterios
    @GetMapping
    public ResponseEntity<List<Criterio>> getAll() {
        return ResponseEntity.ok(criterioService.getAll());
    }

    // GET /api/criterios/{id} — Obtener un criterio por ID
    @GetMapping("/{id}")
    public ResponseEntity<Criterio> getById(@PathVariable Long id) {
        return ResponseEntity.ok(criterioService.getById(id));
    }

    // GET /api/criterios/ra/{idResultado} — Obtener criterios de un RA concreto
    @GetMapping("/ra/{idResultado}")
    public ResponseEntity<List<Criterio>> getByRa(@PathVariable Long idResultado) {
        return ResponseEntity.ok(criterioService.getByRa(idResultado));
    }

    // POST /api/criterios — Crear un nuevo criterio
    @PostMapping
    public ResponseEntity<Criterio> create(@Valid @RequestBody Criterio criterio) {
        Criterio nuevo = criterioService.create(criterio);
        return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
    }

    // PUT /api/criterios/{id} — Actualizar un criterio existente
    @PutMapping("/{id}")
    public ResponseEntity<Criterio> update(@PathVariable Long id, @Valid @RequestBody Criterio criterio) {
        return ResponseEntity.ok(criterioService.update(id, criterio));
    }

    // DELETE /api/criterios/{id} — Eliminar un criterio
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        criterioService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
