# API REST — Gestión de Materias, RA y Criterios de Evaluación

API REST desarrollada con **Spring Boot 3** para gestionar Materias (Asignaturas), Resultados de Aprendizaje (RA) y Criterios de Evaluación. Basada en la aplicación JSP+Java previa.

## Tecnologías

- Java 17
- Spring Boot 3.2
- Spring Data JPA + Hibernate
- MySQL (XAMPP)
- Maven

## Estructura del proyecto

```
springboot-api/
├── pom.xml
└── src/main/
    ├── java/com/gestionra/
    │   ├── GestionRaApplication.java        ← Clase principal
    │   ├── model/
    │   │   ├── Materia.java                 ← Entidad (tabla asignaturas)
    │   │   ├── Ra.java                      ← Entidad (tabla resultados_aprendizaje)
    │   │   └── Criterio.java                ← Entidad (tabla criterios_evaluacion)
    │   ├── repository/
    │   │   ├── MateriaRepository.java
    │   │   ├── RaRepository.java
    │   │   └── CriterioRepository.java
    │   ├── service/
    │   │   ├── MateriaService.java          ← Lógica de negocio
    │   │   ├── RaService.java
    │   │   └── CriterioService.java
    │   ├── controller/
    │   │   ├── MateriaController.java       ← Endpoints REST
    │   │   ├── RaController.java
    │   │   └── CriterioController.java
    │   └── exception/
    │       ├── ResourceNotFoundException.java
    │       └── GlobalExceptionHandler.java
    └── resources/
        └── application.properties
```

## Arquitectura MVC

```
Cliente HTTP
    ↓
Controller  →  recibe peticiones REST, sin lógica de negocio
    ↓
Service     →  contiene la lógica de negocio
    ↓
Repository  →  acceso a datos (Spring Data JPA)
    ↓
Base de datos MySQL (gestion_academica)
```

## Requisitos previos

1. **Java 17+** instalado
2. **Maven** instalado
3. **XAMPP** con MySQL en ejecución
4. Base de datos `gestion_academica` creada (ejecutar `../database.sql`)

## Configuración

Editar `src/main/resources/application.properties` si es necesario:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/gestion_academica
spring.datasource.username=root
spring.datasource.password=
```

## Ejecución

```bash
cd springboot-api
mvn clean package -DskipTests
mvn spring-boot:run
```

La API arranca en: **http://localhost:8080**

---

## Endpoints

### Materias (`/api/materias`)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/materias` | Listar todas |
| GET | `/api/materias/{id}` | Obtener por ID |
| POST | `/api/materias` | Crear nueva |
| PUT | `/api/materias/{id}` | Actualizar |
| DELETE | `/api/materias/{id}` | Eliminar |

### Resultados de Aprendizaje (`/api/ras`)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/ras` | Listar todos |
| GET | `/api/ras/{id}` | Obtener por ID |
| GET | `/api/ras/materia/{idAsignatura}` | Filtrar por materia |
| POST | `/api/ras` | Crear nuevo |
| PUT | `/api/ras/{id}` | Actualizar |
| DELETE | `/api/ras/{id}` | Eliminar |

### Criterios de Evaluación (`/api/criterios`)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/criterios` | Listar todos |
| GET | `/api/criterios/{id}` | Obtener por ID |
| GET | `/api/criterios/ra/{idResultado}` | Filtrar por RA |
| POST | `/api/criterios` | Crear nuevo |
| PUT | `/api/criterios/{id}` | Actualizar |
| DELETE | `/api/criterios/{id}` | Eliminar |

---

## Ejemplos de pruebas con curl — Entidad Materias (CRUD completo)

### GET — Listar todas las materias
```bash
curl -X GET http://localhost:8080/api/materias
```
**Respuesta esperada (200 OK):**
```json
[
  { "id": 1, "nombre": "Desarrollo Web en Entorno Cliente", "codigo": "DWEC" },
  { "id": 2, "nombre": "Desarrollo Web en Entorno Servidor", "codigo": "DWES" }
]
```

### GET — Obtener materia por ID
```bash
curl -X GET http://localhost:8080/api/materias/1
```
**Respuesta esperada (200 OK):**
```json
{ "id": 1, "nombre": "Desarrollo Web en Entorno Cliente", "codigo": "DWEC" }
```

### POST — Crear nueva materia
```bash
curl -X POST http://localhost:8080/api/materias \
  -H "Content-Type: application/json" \
  -d "{\"nombre\": \"Sistemas Informáticos\", \"codigo\": \"SI01\"}"
```
**Respuesta esperada (201 Created):**
```json
{ "id": 7, "nombre": "Sistemas Informáticos", "codigo": "SI01" }
```

### PUT — Actualizar materia existente
```bash
curl -X PUT http://localhost:8080/api/materias/7 \
  -H "Content-Type: application/json" \
  -d "{\"nombre\": \"Sistemas Informáticos Actualizado\", \"codigo\": \"SI02\"}"
```
**Respuesta esperada (200 OK):**
```json
{ "id": 7, "nombre": "Sistemas Informáticos Actualizado", "codigo": "SI02" }
```

### DELETE — Eliminar materia
```bash
curl -X DELETE http://localhost:8080/api/materias/7
```
**Respuesta esperada: 204 No Content**

### GET — ID inexistente (error 404)
```bash
curl -X GET http://localhost:8080/api/materias/999
```
**Respuesta esperada (404 Not Found):**
```json
{
  "timestamp": "2026-02-18T09:00:00",
  "status": 404,
  "error": "Not Found",
  "message": "Materia con id 999 no encontrado/a"
}
```

---

## Ejemplos adicionales

### RA — Filtrar por asignatura
```bash
curl -X GET http://localhost:8080/api/ras/materia/1
```

### Criterios — Filtrar por RA
```bash
curl -X GET http://localhost:8080/api/criterios/ra/1
```

### POST — Crear nuevo RA
```bash
curl -X POST http://localhost:8080/api/ras \
  -H "Content-Type: application/json" \
  -d "{\"descripcion\": \"Nuevo resultado de aprendizaje\", \"idAsignatura\": 1}"
```

### POST — Crear nuevo Criterio
```bash
curl -X POST http://localhost:8080/api/criterios \
  -H "Content-Type: application/json" \
  -d "{\"descripcion\": \"Nuevo criterio de evaluación\", \"idResultado\": 1}"
```
