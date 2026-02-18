# API REST — Gestión de Materias, RA y Criterios de Evaluación

API REST desarrollada con **Spring Boot 3** para gestionar Materias, Resultados de Aprendizaje (RA) y Criterios de Evaluación.

**Tecnologías:** Java 17 · Spring Boot 3.2 · Spring Data JPA · MySQL · Maven

---

## Estructura del proyecto

```
springboot-api/
├── pom.xml
└── src/main/
    ├── java/com/gestionra/
    │   ├── GestionRaApplication.java
    │   ├── controller/
    │   │   ├── MateriaController.java
    │   │   ├── RaController.java
    │   │   └── CriterioController.java
    │   ├── service/
    │   │   ├── MateriaService.java
    │   │   ├── RaService.java
    │   │   └── CriterioService.java
    │   ├── model/
    │   │   ├── Materia.java
    │   │   ├── Ra.java
    │   │   └── Criterio.java
    │   ├── repository/
    │   │   ├── MateriaRepository.java
    │   │   ├── RaRepository.java
    │   │   └── CriterioRepository.java
    │   └── exception/
    │       ├── ResourceNotFoundException.java
    │       └── GlobalExceptionHandler.java
    └── resources/
        └── application.properties
```

### Arquitectura MVC

```
Controller  →  expone los endpoints REST (sin lógica de negocio)
    ↓
Service     →  contiene la lógica de negocio
    ↓
Repository  →  acceso a datos con Spring Data JPA
    ↓
Base de datos MySQL  (gestion_academica)
```

---

## Cómo ejecutar

1. Iniciar **XAMPP** con MySQL activo
2. Ejecutar el script `../database.sql` si la BD no existe aún
3. Arrancar la API:

```powershell
cd springboot-api
& "$env:USERPROFILE\maven\bin\mvn.cmd" spring-boot:run
# o con el JAR ya compilado:
java -jar target\gestion-ra-api-1.0.0.jar
```

La API arranca en **http://localhost:8080**

---

## Endpoints

### Materias — `/api/materias`

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/materias` | Listar todas las materias |
| GET | `/api/materias/{id}` | Obtener materia por ID |
| POST | `/api/materias` | Crear nueva materia |
| PUT | `/api/materias/{id}` | Actualizar materia |
| DELETE | `/api/materias/{id}` | Eliminar materia |

### Resultados de Aprendizaje — `/api/ras`

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/ras` | Listar todos los RA |
| GET | `/api/ras/{id}` | Obtener RA por ID |
| GET | `/api/ras/materia/{idAsignatura}` | Filtrar RA por materia |
| POST | `/api/ras` | Crear nuevo RA |
| PUT | `/api/ras/{id}` | Actualizar RA |
| DELETE | `/api/ras/{id}` | Eliminar RA |

### Criterios de Evaluación — `/api/criterios`

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/criterios` | Listar todos los criterios |
| GET | `/api/criterios/{id}` | Obtener criterio por ID |
| GET | `/api/criterios/ra/{idResultado}` | Filtrar criterios por RA |
| POST | `/api/criterios` | Crear nuevo criterio |
| PUT | `/api/criterios/{id}` | Actualizar criterio |
| DELETE | `/api/criterios/{id}` | Eliminar criterio |

---

## Ejemplos de pruebas

### CRUD completo de Materias

#### GET — Listar todas las materias
```bash
curl -X GET http://localhost:8080/api/materias
```
**Respuesta 200 OK:**
```json
[
  { "id": 1, "nombre": "Desarrollo Web en Entorno Cliente", "codigo": "DWEC" },
  { "id": 2, "nombre": "Desarrollo Web en Entorno Servidor", "codigo": "DWES" }
]
```

#### GET — Obtener materia por ID
```bash
curl -X GET http://localhost:8080/api/materias/1
```
**Respuesta 200 OK:**
```json
{ "id": 1, "nombre": "Desarrollo Web en Entorno Cliente", "codigo": "DWEC" }
```

#### POST — Crear nueva materia
```bash
curl -X POST http://localhost:8080/api/materias \
  -H "Content-Type: application/json" \
  -d "{\"nombre\": \"Sistemas Informáticos\", \"codigo\": \"SI01\"}"
```
**Respuesta 201 Created:**
```json
{ "id": 7, "nombre": "Sistemas Informáticos", "codigo": "SI01" }
```

#### PUT — Actualizar materia
```bash
curl -X PUT http://localhost:8080/api/materias/7 \
  -H "Content-Type: application/json" \
  -d "{\"nombre\": \"Sistemas Informáticos Actualizado\", \"codigo\": \"SI02\"}"
```
**Respuesta 200 OK:**
```json
{ "id": 7, "nombre": "Sistemas Informáticos Actualizado", "codigo": "SI02" }
```

#### DELETE — Eliminar materia
```bash
curl -X DELETE http://localhost:8080/api/materias/7
```
**Respuesta: 204 No Content**

#### GET — ID inexistente (error 404)
```bash
curl -X GET http://localhost:8080/api/materias/999
```
**Respuesta 404 Not Found:**
```json
{
  "timestamp": "2026-02-18T10:00:00",
  "status": 404,
  "error": "Not Found",
  "message": "Materia con id 999 no encontrado/a"
}
```

---

### Ejemplos adicionales — RA y Criterios

#### Crear un RA
```bash
curl -X POST http://localhost:8080/api/ras \
  -H "Content-Type: application/json" \
  -d "{\"descripcion\": \"Nuevo resultado de aprendizaje\", \"idAsignatura\": 1}"
```

#### Filtrar RA por materia
```bash
curl -X GET http://localhost:8080/api/ras/materia/1
```

#### Crear un Criterio
```bash
curl -X POST http://localhost:8080/api/criterios \
  -H "Content-Type: application/json" \
  -d "{\"descripcion\": \"Nuevo criterio de evaluación\", \"idResultado\": 1}"
```

#### Filtrar Criterios por RA
```bash
curl -X GET http://localhost:8080/api/criterios/ra/1
```
