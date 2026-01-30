# Gestión Académica CRUD - JSP MySQL

Proyecto CRUD para gestionar Asignaturas, Resultados de Aprendizaje y Criterios de Evaluación.

Gonzalo Gilabert

## Requisitos

- Apache Tomcat 9+
- MySQL 8+
- MySQL Connector/J (mysql-connector-java-8.0.28.jar)

## Instalación

1. Importar la base de datos:
   - Abrir phpMyAdmin o MySQL Workbench
   - Ejecutar el script `database.sql`

2. Configurar el driver JDBC:
   - Copiar `mysql-connector-java-8.0.28.jar` a la carpeta `WEB-INF/lib`
   - O añadirlo al classpath de Tomcat

3. Desplegar en Tomcat:
   - Copiar la carpeta del proyecto a `webapps/` (renombrar a RA6_CRUD_JSP si es necesario)
   - O configurar como proyecto en Eclipse/IntelliJ

4. Acceder a la aplicación:
   - http://localhost:8080/RA6_CRUD_JSP/

## Estructura del proyecto

```
RA6_CRUD_JSP/
├── src/
│   ├── modelo/
│   │   ├── Asignatura.java
│   │   ├── ResultadoAprendizaje.java
│   │   └── CriterioEvaluacion.java
│   └── dao/
│       ├── Database.java
│       ├── AsignaturaDAO.java
│       ├── ResultadoAprendizajeDAO.java
│       └── CriterioEvaluacionDAO.java
├── WebContent/
│   ├── index.jsp
│   ├── asignaturas.jsp
│   ├── resultados.jsp
│   ├── criterios.jsp
│   └── WEB-INF/
│       └── web.xml
├── database.sql
└── README.md
```

## Funcionalidades

- CRUD completo de Asignaturas
- CRUD completo de Resultados de Aprendizaje
- CRUD completo de Criterios de Evaluación
- Relaciones entre tablas (1:N)
- Filtros por asignatura y por RA
- Validación de datos en servidor
- Mensajes de confirmación/error
- Interfaz responsiva con Bootstrap 5

## Tecnologías

- JSP (Java Server Pages)
- JDBC para conexión con MySQL
- Bootstrap 5 (CDN)
- MySQL 8

## Configuración de la BD

Por defecto la conexión usa:
- Host: localhost
- Puerto: 3306
- Base de datos: gestion_academica
- Usuario: root
- Contraseña: (vacía)

Si tu configuración es diferente, edita el archivo `src/dao/Database.java`.
