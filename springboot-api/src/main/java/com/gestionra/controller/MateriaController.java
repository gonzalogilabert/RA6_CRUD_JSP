package com.gestionra.controller;

import com.gestionra.model.Materia;
import com.gestionra.service.MateriaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/materias")
public class MateriaController {

    @Autowired
    private MateriaService materiaService;

    // GET /api/materias — Listar todas las materias
    @GetMapping
    public ResponseEntity<List<Materia>> getAll() {
        return ResponseEntity.ok(materiaService.getAll());
    }

    // GET /api/materias/{id} — Obtener una materia por ID
    @GetMapping("/{id}")
    public ResponseEntity<Materia> getById(@PathVariable Long id) {
        return ResponseEntity.ok(materiaService.getById(id));
    }

    // POST /api/materias — Crear una nueva materia
    @PostMapping
    public ResponseEntity<Materia> create(@Valid @RequestBody Materia materia) {
        Materia nueva = materiaService.create(materia);
        return ResponseEntity.status(HttpStatus.CREATED).body(nueva);
    }

    // PUT /api/materias/{id} — Actualizar una materia existente
    @PutMapping("/{id}")
    public ResponseEntity<Materia> update(@PathVariable Long id, @Valid @RequestBody Materia materia) {
        return ResponseEntity.ok(materiaService.update(id, materia));
    }

    // DELETE /api/materias/{id} — Eliminar una materia
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        materiaService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
