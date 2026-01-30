-- Script para crear la base de datos gestion_academica
-- Marco Antonio Ochavo Fernández

DROP DATABASE IF EXISTS gestion_academica;
CREATE DATABASE gestion_academica CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE gestion_academica;

-- tabla asignaturas
CREATE TABLE asignaturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL
);

-- tabla resultados de aprendizaje
CREATE TABLE resultados_aprendizaje (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    id_asignatura INT NOT NULL,
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id) ON DELETE CASCADE
);

-- tabla criterios evaluacion
CREATE TABLE criterios_evaluacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    id_resultado INT NOT NULL,
    FOREIGN KEY (id_resultado) REFERENCES resultados_aprendizaje(id) ON DELETE CASCADE
);

-- datos de ejemplo asignaturas
INSERT INTO asignaturas (nombre, codigo) VALUES
('Desarrollo Web en Entorno Cliente', 'DWEC'),
('Desarrollo Web en Entorno Servidor', 'DWES'),
('Diseño de Interfaces Web', 'DIW'),
('Despliegue de Aplicaciones Web', 'DAW'),
('Bases de Datos', 'BBDD'),
('Programación', 'PROG');

-- datos resultados aprendizaje
INSERT INTO resultados_aprendizaje (descripcion, id_asignatura) VALUES
('Selecciona las arquitecturas y tecnologías de programación web en entorno cliente', 1),
('Escribe sentencias simples, aplicando la sintaxis del lenguaje', 1),
('Escribe código, identificando y aplicando las funcionalidades del lenguaje', 1),
('Desarrolla aplicaciones web analizando y aplicando las características del modelo orientado a objetos', 2),
('Desarrolla aplicaciones web embebidas en lenguajes de marcas', 2),
('Genera páginas web dinámicas analizando y utilizando BD', 2),
('Planifica la creación de una interfaz web valorando su usabilidad', 3),
('Crea interfaces web utilizando estilos', 3),
('Implanta aplicaciones web en servidores de aplicaciones', 4),
('Administra servidores de transferencia de ficheros', 4),
('Almacena información utilizando bases de datos relacionales', 5),
('Programa bases de datos utilizando lenguajes de programación', 5);

-- datos criterios evaluacion  
INSERT INTO criterios_evaluacion (descripcion, id_resultado) VALUES
('Se han caracterizado las herramientas de programación sobre navegadores', 1),
('Se ha identificado la sintaxis básica del lenguaje', 1),
('Se han integrado scripts en páginas HTML', 1),
('Se han identificado los objetos predefinidos del lenguaje', 2),
('Se han escrito scripts, probando los efectos del código', 2),
('Se han añadido elementos a las páginas utilizando objetos del DOM', 3),
('Se han recuperado datos del servidor web utilizando ajax', 3),
('Se han creado elementos multimedia interactivos', 3),
('Se han seleccionado lenguajes de programación en entorno servidor', 4),
('Se ha reconocido la sintaxis y la semántica del lenguaje', 4),
('Se han configurado sistemas gestores de BD', 5),
('Se ha establecido la conexión desde código', 5),
('Se han utilizado formularios para la recogida de datos', 6),
('Se han aplicado las convenciones de arquitectura de la información', 7),
('Se ha creado la hoja de estilos', 8),
('Se ha identificado la estructura de la aplicacion web', 9),
('Se han configurado los servicios de red implicados', 10);
