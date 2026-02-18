package com.gestionra.controller;

import com.gestionra.model.Ra;
import com.gestionra.service.RaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ras")
public class RaController {

    @Autowired
    private RaService raService;

    // GET /api/ras — Listar todos los RA
    @GetMapping
    public ResponseEntity<List<Ra>> getAll() {
        return ResponseEntity.ok(raService.getAll());
    }

    // GET /api/ras/{id} — Obtener un RA por ID
    @GetMapping("/{id}")
    public ResponseEntity<Ra> getById(@PathVariable Long id) {
        return ResponseEntity.ok(raService.getById(id));
    }

    // GET /api/ras/materia/{idAsignatura} — Obtener RA de una asignatura concreta
    @GetMapping("/materia/{idAsignatura}")
    public ResponseEntity<List<Ra>> getByMateria(@PathVariable Long idAsignatura) {
        return ResponseEntity.ok(raService.getByMateria(idAsignatura));
    }

    // POST /api/ras — Crear un nuevo RA
    @PostMapping
    public ResponseEntity<Ra> create(@Valid @RequestBody Ra ra) {
        Ra nuevo = raService.create(ra);
        return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);
    }

    // PUT /api/ras/{id} — Actualizar un RA existente
    @PutMapping("/{id}")
    public ResponseEntity<Ra> update(@PathVariable Long id, @Valid @RequestBody Ra ra) {
        return ResponseEntity.ok(raService.update(id, ra));
    }

    // DELETE /api/ras/{id} — Eliminar un RA
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        raService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
