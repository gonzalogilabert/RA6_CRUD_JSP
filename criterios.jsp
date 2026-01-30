<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="dao.CriterioEvaluacionDAO" %>
            <%@ page import="dao.ResultadoAprendizajeDAO" %>
                <%@ page import="dao.AsignaturaDAO" %>
                    <%@ page import="modelo.CriterioEvaluacion" %>
                        <%@ page import="modelo.ResultadoAprendizaje" %>
                            <%@ page import="modelo.Asignatura" %>
                                <% /* INICIO LOGICA DE NEGOCIO */ request.setCharacterEncoding("UTF-8"); /* CRUCIAL:
                                    Forzar codificación UTF-8 para inputs */ String
                                    accion=request.getParameter("accion"); String mensaje="" ; String tipoMensaje="" ;
                                    CriterioEvaluacionDAO ceDao=new CriterioEvaluacionDAO(); ResultadoAprendizajeDAO
                                    raDao=new ResultadoAprendizajeDAO(); AsignaturaDAO asigDao=new AsignaturaDAO();
                                    String raParam=request.getParameter("ra"); int idRAFiltro=0; if (raParam !=null &&
                                    !raParam.isEmpty()) { try { idRAFiltro=Integer.parseInt(raParam); }
                                    catch(NumberFormatException e) { /* ERROR IGNORADO */ } } if (accion !=null) { if
                                    (accion.equals("crear")) { String descripcion=request.getParameter("descripcion");
                                    String idRAStr=request.getParameter("idResultado"); if (descripcion !=null &&
                                    !descripcion.trim().isEmpty() && idRAStr !=null) { try { int
                                    idRA=Integer.parseInt(idRAStr); CriterioEvaluacion ce=new CriterioEvaluacion();
                                    ce.setDescripcion(descripcion.trim()); ce.setIdResultado(idRA); if
                                    (ceDao.insertar(ce)) { mensaje="Criterio creado correctamente" ;
                                    tipoMensaje="success" ; idRAFiltro=idRA; } else { mensaje="Error al crear criterio"
                                    ; tipoMensaje="danger" ; } } catch (NumberFormatException e) {
                                    mensaje="Datos invalidos" ; tipoMensaje="danger" ; } } else {
                                    mensaje="Completa todos los campos" ; tipoMensaje="warning" ; } } else if
                                    (accion.equals("editar")) { String idStr=request.getParameter("id"); String
                                    descripcion=request.getParameter("descripcion"); String
                                    idRAStr=request.getParameter("idResultado"); if (idStr !=null && descripcion !=null
                                    && idRAStr !=null) { try { int id=Integer.parseInt(idStr); int
                                    idRA=Integer.parseInt(idRAStr); CriterioEvaluacion ce=new CriterioEvaluacion();
                                    ce.setId(id); ce.setDescripcion(descripcion.trim()); ce.setIdResultado(idRA); if
                                    (ceDao.actualizar(ce)) { mensaje="Criterio actualizado" ; tipoMensaje="success" ;
                                    idRAFiltro=idRA; } else { mensaje="Error actualizando" ; tipoMensaje="danger" ; } }
                                    catch (NumberFormatException e) { mensaje="Datos no validos" ; tipoMensaje="danger"
                                    ; } } } else if (accion.equals("eliminar")) { String
                                    idStr=request.getParameter("id"); if (idStr !=null) { try { int
                                    id=Integer.parseInt(idStr); if (ceDao.eliminar(id)) { mensaje="Criterio eliminado" ;
                                    tipoMensaje="success" ; } else { mensaje="Error al eliminar" ; tipoMensaje="danger"
                                    ; } } catch(NumberFormatException e) { mensaje="ID invalido" ; tipoMensaje="danger"
                                    ; } } } } List<ResultadoAprendizaje> listaRA = raDao.listar();
                                    List<CriterioEvaluacion> listaCE;
                                        if (idRAFiltro > 0) {
                                        listaCE = ceDao.obtenerPorRA(idRAFiltro);
                                        } else {
                                        listaCE = ceDao.listar();
                                        }
                                        CriterioEvaluacion ceEditar = null;
                                        String editarId = request.getParameter("editarId");
                                        if (editarId != null) {
                                        try {
                                        ceEditar = ceDao.obtenerPorId(Integer.parseInt(editarId));
                                        } catch (NumberFormatException e) {
                                        /* ERROR IGNORADO */
                                        }
                                        }

                                        /* VARIABLES DE VISTA */
                                        String tituloCard = (ceEditar != null) ? "Editar Criterio" : "Nuevo Criterio";
                                        String iconoCard = (ceEditar != null) ? "fa-pen-to-square" : "fa-plus-circle";
                                        String valorAccion = (ceEditar != null) ? "editar" : "crear";
                                        String textoBoton = (ceEditar != null) ? "Guardar Cambios" : "Crear Criterio";
                                        String valDescripcion = (ceEditar != null) ? ceEditar.getDescripcion() : "";
                                        String valId = (ceEditar != null) ? String.valueOf(ceEditar.getId()) : "";
                                        %>
                                        <!DOCTYPE html>
                                        <html lang="es">

                                        <head>
                                            <meta charset="UTF-8">
                                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                            <title>Gestión de Criterios de Evaluación</title>
                                            <link
                                                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                                                rel="stylesheet">
                                            <link rel="stylesheet"
                                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                                            <link
                                                href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap"
                                                rel="stylesheet">
                                            <style>
                                                :root {
                                                    --primary-color: #7B1FA2;
                                                    --secondary-color: #4A148C;
                                                    --accent-color: #AB47BC;
                                                    --bg-color: #F8F5F9;
                                                    --text-dark: #263238;
                                                    --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                                                }

                                                body {
                                                    background-color: var(--bg-color);
                                                    font-family: 'Outfit', sans-serif;
                                                    color: var(--text-dark);
                                                    min-height: 100vh;
                                                    display: flex;
                                                    flex-direction: column;
                                                }

                                                .navbar-custom {
                                                    background: linear-gradient(135deg, #1B5E20, #2E7D32);
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

                                                .nav-link.active {
                                                    color: white !important;
                                                    font-weight: 700;
                                                    border-bottom: 2px solid #66BB6A;
                                                }

                                                .container-main {
                                                    padding: 40px 0;
                                                }

                                                .page-title {
                                                    color: var(--secondary-color);
                                                    font-weight: 700;
                                                    margin-bottom: 30px;
                                                    border-bottom: 3px solid var(--accent-color);
                                                    display: inline-block;
                                                    padding-bottom: 10px;
                                                }

                                                .card-custom {
                                                    background: white;
                                                    border: none;
                                                    border-radius: 15px;
                                                    box-shadow: var(--card-shadow);
                                                    padding: 25px;
                                                    margin-bottom: 20px;
                                                }

                                                .form-label {
                                                    font-weight: 600;
                                                    color: var(--secondary-color);
                                                }

                                                .form-control:focus,
                                                .form-select:focus {
                                                    border-color: var(--primary-color);
                                                    box-shadow: 0 0 0 0.25rem rgba(123, 31, 162, 0.25);
                                                }

                                                .btn-custom-primary {
                                                    background-color: var(--primary-color);
                                                    color: white;
                                                    border: none;
                                                    padding: 10px 20px;
                                                    border-radius: 8px;
                                                    font-weight: 600;
                                                    transition: all 0.3s;
                                                }

                                                .btn-custom-primary:hover {
                                                    background-color: var(--secondary-color);
                                                    color: white;
                                                    transform: translateY(-2px);
                                                }

                                                .btn-action-edit {
                                                    color: #1976D2;
                                                    background: rgba(25, 118, 210, 0.1);
                                                    border: none;
                                                    padding: 5px 10px;
                                                    border-radius: 5px;
                                                    margin-right: 5px;
                                                    text-decoration: none;
                                                }

                                                .btn-action-delete {
                                                    color: #D32F2F;
                                                    background: rgba(211, 47, 47, 0.1);
                                                    border: none;
                                                    padding: 5px 10px;
                                                    border-radius: 5px;
                                                    margin-right: 5px;
                                                    text-decoration: none;
                                                }

                                                .btn-action-edit:hover,
                                                .btn-action-delete:hover {
                                                    filter: brightness(0.9);
                                                }

                                                .table-custom thead {
                                                    background-color: var(--secondary-color);
                                                    color: white;
                                                }

                                                .table-custom th {
                                                    font-weight: 600;
                                                    border: none;
                                                    padding: 15px;
                                                }

                                                .table-custom td {
                                                    padding: 15px;
                                                    vertical-align: middle;
                                                }

                                                .table-hover tbody tr:hover {
                                                    background-color: rgba(123, 31, 162, 0.05);
                                                }

                                                .footer {
                                                    margin-top: auto;
                                                    background-color: white;
                                                    padding: 25px 0;
                                                    text-align: center;
                                                    border-top: 1px solid rgba(0, 0, 0, 0.05);
                                                    color: #90A4AE;
                                                    font-size: 0.9rem;
                                                }

                                                .filter-section {
                                                    background-color: white;
                                                    padding: 15px;
                                                    border-radius: 10px;
                                                    margin-bottom: 20px;
                                                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
                                                    border-left: 5px solid var(--accent-color);
                                                }
                                            </style>
                                        </head>

                                        <body>
                                            <nav class="navbar navbar-expand-lg navbar-custom">
                                                <div class="container">
                                                    <a class="navbar-brand" href="index.jsp"><i
                                                            class="fa-solid fa-graduation-cap me-2"></i>Gestión
                                                        Académica</a>
                                                    <button class="navbar-toggler border-0 text-white" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#navMenu"><i
                                                            class="fa-solid fa-bars"></i></button>
                                                    <div class="collapse navbar-collapse" id="navMenu">
                                                        <ul class="navbar-nav ms-auto">
                                                            <li class="nav-item ps-3"><a class="nav-link"
                                                                    href="asignaturas.jsp">Asignaturas</a></li>
                                                            <li class="nav-item ps-3"><a class="nav-link"
                                                                    href="resultados.jsp">Resultados</a></li>
                                                            <li class="nav-item ps-3"><a class="nav-link active"
                                                                    href="criterios.jsp">Criterios</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </nav>
                                            <div class="container container-main">
                                                <h2 class="page-title"><i
                                                        class="fa-solid fa-clipboard-check me-2"></i>Criterios de
                                                    Evaluación</h2>
                                                <% if (!mensaje.isEmpty()) { %>
                                                    <div class="alert alert-<%= tipoMensaje %> alert-dismissible fade show shadow-sm"
                                                        role="alert">
                                                        <i class="fa-solid fa-circle-info me-2"></i>
                                                        <%= mensaje %>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="alert"></button>
                                                    </div>
                                                    <% } %>
                                                        <div
                                                            class="filter-section d-flex align-items-center justify-content-between">
                                                            <form class="d-flex align-items-center w-100"
                                                                action="criterios.jsp" method="get">
                                                                <label
                                                                    class="me-3 fw-bold text-secondary text-nowrap"><i
                                                                        class="fa-solid fa-filter me-2"></i>Filtrar por
                                                                    RA:</label>
                                                                <select name="ra" class="form-select"
                                                                    onchange="this.form.submit()">
                                                                    <option value="0">Ver Todos</option>
                                                                    <% for(ResultadoAprendizaje ra : listaRA) { %>
                                                                        <option value="<%= ra.getId() %>" <%
                                                                            if(idRAFiltro==ra.getId()){ %>selected<% }
                                                                                %>>
                                                                                <%= ra.getDescripcion() %>
                                                                        </option>
                                                                        <% } %>
                                                                </select>
                                                            </form>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="card card-custom">
                                                                    <h5 class="mb-4"
                                                                        style="color: var(--secondary-color); font-weight: 700;">
                                                                        <i class='fa-solid <%= iconoCard %> me-2'></i>
                                                                        <%= tituloCard %>
                                                                    </h5>
                                                                    <form method="post" action="criterios.jsp">
                                                                        <input type="hidden" name="accion"
                                                                            value="<%= valorAccion %>">
                                                                        <% if (ceEditar !=null) { %>
                                                                            <input type="hidden" name="id"
                                                                                value="<%= valId %>">
                                                                            <% } %>
                                                                                <div class="mb-3">
                                                                                    <label class="form-label">Resultado
                                                                                        Aprendizaje</label>
                                                                                    <select name="idResultado"
                                                                                        class="form-select" required>
                                                                                        <option value="">Selecciona un
                                                                                            RA...</option>
                                                                                        <% for(ResultadoAprendizaje ra :
                                                                                            listaRA) { %>
                                                                                            <option
                                                                                                value="<%= ra.getId() %>"
                                                                                                <% if((ceEditar !=null
                                                                                                &&
                                                                                                ceEditar.getIdResultado()==ra.getId())
                                                                                                || (ceEditar==null &&
                                                                                                idRAFiltro==ra.getId())){
                                                                                                %>selected<% } %>>
                                                                                                    (ID: <%= ra.getId()
                                                                                                        %>) <%=
                                                                                                            ra.getDescripcion().length()>
                                                                                                            30 ?
                                                                                                            ra.getDescripcion().substring(0,30)+"..."
                                                                                                            :
                                                                                                            ra.getDescripcion()
                                                                                                            %>
                                                                                            </option>
                                                                                            <% } %>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="mb-4">
                                                                                    <label
                                                                                        class="form-label">Descripción
                                                                                        Criterio</label>
                                                                                    <textarea class="form-control"
                                                                                        name="descripcion" rows="4"
                                                                                        required
                                                                                        placeholder="Ej. CE1.a. Identifica componentes hardware..."><%= valDescripcion %></textarea>
                                                                                </div>
                                                                                <button type="submit"
                                                                                    class="btn btn-custom-primary w-100">
                                                                                    <%= textoBoton %>
                                                                                </button>
                                                                                <% if (ceEditar !=null) { %>
                                                                                    <a href="criterios.jsp"
                                                                                        class="btn btn-outline-secondary w-100 mt-2 border-0">Cancelar</a>
                                                                                    <% } %>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="card card-custom p-0 overflow-hidden">
                                                                    <div
                                                                        class="p-4 border-bottom d-flex justify-content-between align-items-center">
                                                                        <h5 class="mb-0"
                                                                            style="color: var(--secondary-color); font-weight: 700;">
                                                                            Lista de Criterios</h5>
                                                                        <span class="badge bg-light text-secondary">
                                                                            <%= listaCE.size() %> Registros
                                                                        </span>
                                                                    </div>
                                                                    <div class="table-responsive">
                                                                        <table
                                                                            class="table table-hover table-custom mb-0">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th class="ps-4">ID</th>
                                                                                    <th>Descripción</th>
                                                                                    <th>ID RA</th>
                                                                                    <th class="text-end pe-4">Acciones
                                                                                    </th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <% if (listaCE.isEmpty()) { %>
                                                                                    <tr>
                                                                                        <td colspan="4"
                                                                                            class="text-center py-5 text-muted">
                                                                                            <i
                                                                                                class="fa-regular fa-folder-open fa-2x mb-3 d-block"></i>
                                                                                            No hay criterios registrados
                                                                                        </td>
                                                                                    </tr>
                                                                                    <% } else { for (CriterioEvaluacion
                                                                                        ce : listaCE) { %>
                                                                                        <tr>
                                                                                            <td
                                                                                                class="ps-4 fw-bold text-secondary">
                                                                                                <%= ce.getId() %>
                                                                                            </td>
                                                                                            <td>
                                                                                                <%= ce.getDescripcion()
                                                                                                    %>
                                                                                            </td>
                                                                                            <td><span
                                                                                                    class="badge bg-secondary">
                                                                                                    <%= ce.getIdResultado()
                                                                                                        %>
                                                                                                </span></td>
                                                                                            <td class="text-end pe-4">
                                                                                                <a href="criterios.jsp?editarId=<%= ce.getId() %>&ra=<%= idRAFiltro %>"
                                                                                                    class="btn-action-edit"
                                                                                                    title="Editar"><i
                                                                                                        class="fa-solid fa-pen"></i></a>
                                                                                                <a href="criterios.jsp?accion=eliminar&id=<%= ce.getId() %>"
                                                                                                    class="btn-action-delete"
                                                                                                    onclick="return confirm('¿Seguro que quieres eliminar este criterio?')"
                                                                                                    title="Eliminar"><i
                                                                                                        class="fa-solid fa-trash"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <% } } %>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                            </div>
                                            <div class="footer">
                                                <div class="container">
                                                    <p class="mb-0">Diseñado y Desarrollado por <strong>Marco Antonio
                                                            Ochavo Fernández</strong> &copy; 2026</p>
                                                </div>
                                            </div>
                                            <script
                                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                                        </body>

                                        </html>