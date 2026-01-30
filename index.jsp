<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión Académica</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome 6 Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="fa-solid fa-graduation-cap me-2"></i>Gestión Académica
            </a>
            <button class="navbar-toggler border-0 text-white" type="button" data-bs-toggle="collapse"
                data-bs-target="#navMenu">
                <i class="fa-solid fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navMenu">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item ps-3">
                        <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
                    </li>
                    <li class="nav-item ps-3">
                        <a class="nav-link" href="resultados.jsp">Resultados</a>
                    </li>
                    <li class="nav-item ps-3">
                        <a class="nav-link" href="criterios.jsp">Criterios</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container hero-section">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h1 class="hero-title">Sistema de Gestión Académica</h1>
                <p class="hero-subtitle">Plataforma integral para administrar asignaturas, definir resultados de
                    aprendizaje y establecer criterios de evaluación de manera eficiente.</p>
            </div>
        </div>

        <div class="row g-4 justify-content-center mt-2">
            <!-- Asignaturas -->
            <div class="col-md-4 animate-card delay-1">
                <a href="asignaturas.jsp" class="card-menu-link">
                    <div class="card card-menu">
                        <div class="card-body">
                            <div class="icon-container">
                                <i class="fa-solid fa-book-open"></i>
                            </div>
                            <h5 class="card-title">Asignaturas</h5>
                            <p class="card-text">Gestiona el catálogo de materias, códigos y organización académica
                                general.</p>
                            <span class="btn-action">Administrar</span>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Resultados de Aprendizaje -->
            <div class="col-md-4 animate-card delay-2">
                <a href="resultados.jsp" class="card-menu-link">
                    <div class="card card-menu">
                        <div class="card-body">
                            <div class="icon-container">
                                <i class="fa-solid fa-bullseye"></i>
                            </div>
                            <h5 class="card-title">Resultados</h5>
                            <p class="card-text">Define y supervisa los objetivos de aprendizaje esperados para cada
                                materia.</p>
                            <span class="btn-action">Gestionar</span>
                        </div>
                    </div>
                </a>
            </div>

            <!-- Criterios de Evaluación -->
            <div class="col-md-4 animate-card delay-3">
                <a href="criterios.jsp" class="card-menu-link">
                    <div class="card card-menu">
                        <div class="card-body">
                            <div class="icon-container">
                                <i class="fa-solid fa-clipboard-check"></i>
                            </div>
                            <h5 class="card-title">Criterios</h5>
                            <p class="card-text">Establece los indicadores de evaluación para medir el rendimiento.
                            </p>
                            <span class="btn-action">Definir</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="container">
            <p class="mb-0">Diseñado y Desarrollado por <strong>Gonzalo Gilabert</strong> &copy; 2026
            </p>
        </div>
    </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>