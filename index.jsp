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

        <style>
            :root {
                --primary-color: #2E7D32;
                /* Verde bosque elegante */
                --secondary-color: #1B5E20;
                /* Verde más oscuro */
                --accent-color: #66BB6A;
                /* Verde vibrante para acentos */
                --bg-color: #F8F9FA;
                /* Gris muy claro */
                --text-dark: #2C3E50;
                --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                --hover-shadow: 0 20px 40px rgba(46, 125, 50, 0.15);
            }

            body {
                background-color: var(--bg-color);
                font-family: 'Outfit', sans-serif;
                color: var(--text-dark);
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            /* Navbar elegante */
            .navbar-custom {
                background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
                padding: 1rem 0;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .navbar-brand {
                font-weight: 700;
                font-size: 1.5rem;
                color: white !important;
                letter-spacing: 0.5px;
            }

            .nav-link {
                color: rgba(255, 255, 255, 0.85) !important;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .nav-link:hover {
                color: white !important;
                transform: translateY(-2px);
            }

            /* Hero Section */
            .hero-section {
                padding: 80px 0 60px;
                text-align: center;
            }

            .hero-title {
                font-weight: 800;
                color: var(--secondary-color);
                margin-bottom: 1.5rem;
                font-size: 2.5rem;
            }

            .hero-subtitle {
                color: #546E7A;
                font-size: 1.25rem;
                max-width: 600px;
                margin: 0 auto 50px;
                line-height: 1.6;
            }

            /* Cards */
            .card-menu-link {
                text-decoration: none;
                color: inherit;
                display: block;
                height: 100%;
            }

            .card-menu {
                background: white;
                border: none;
                border-radius: 20px;
                padding: 40px 30px;
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                box-shadow: var(--card-shadow);
                height: 100%;
                position: relative;
                overflow: hidden;
                border-top: 5px solid transparent;
            }

            .card-menu::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 5px;
                background: linear-gradient(90deg, var(--accent-color), var(--primary-color));
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .card-menu:hover {
                transform: translateY(-10px);
                box-shadow: var(--hover-shadow);
                border-top-color: var(--primary-color);
            }

            .card-menu:hover::before {
                opacity: 1;
            }

            .icon-container {
                width: 90px;
                height: 90px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 25px;
                font-size: 2.5rem;
                transition: all 0.4s ease;
                background-color: rgba(46, 125, 50, 0.05);
                color: var(--primary-color);
            }

            .card-menu:hover .icon-container {
                background-color: var(--primary-color);
                color: white;
                transform: scale(1.1) rotate(5deg);
            }

            .card-title {
                font-weight: 700;
                margin-bottom: 15px;
                font-size: 1.35rem;
                color: var(--text-dark);
            }

            .card-text {
                color: #78909C;
                font-size: 0.95rem;
                margin-bottom: 25px;
                line-height: 1.5;
            }

            .btn-action {
                display: inline-block;
                padding: 10px 30px;
                border-radius: 50px;
                background-color: rgba(46, 125, 50, 0.1);
                color: var(--primary-color);
                font-weight: 600;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .card-menu:hover .btn-action {
                background-color: var(--primary-color);
                color: white;
            }

            /* Footer */
            .footer {
                margin-top: auto;
                background-color: white;
                padding: 25px 0;
                text-align: center;
                border-top: 1px solid rgba(0, 0, 0, 0.05);
                color: #90A4AE;
                font-size: 0.9rem;
            }

            /* Animations */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .animate-card {
                animation: fadeIn 0.6s ease-out forwards;
            }

            .delay-1 {
                animation-delay: 0.1s;
            }

            .delay-2 {
                animation-delay: 0.2s;
            }

            .delay-3 {
                animation-delay: 0.3s;
            }
        </style>
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
                <p class="mb-0">Diseñado y Desarrollado por <strong>Marco Antonio Ochavo Fernández</strong> &copy; 2026
                </p>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>