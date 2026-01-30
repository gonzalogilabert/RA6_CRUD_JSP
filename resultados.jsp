<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="dao.ResultadoAprendizajeDAO" %>
            <%@ page import="dao.AsignaturaDAO" %>
                <%@ page import="modelo.ResultadoAprendizaje" %>
                    <%@ page import="modelo.Asignatura" %>
                        <% /* INICIO LOGICA DE NEGOCIO */ request.setCharacterEncoding("UTF-8"); /* CRUCIAL: Forzar
                            codificación UTF-8 para inputs */ String accion=request.getParameter("accion"); String
                            mensaje="" ; String tipoMensaje="" ; ResultadoAprendizajeDAO raDao=new
                            ResultadoAprendizajeDAO(); AsignaturaDAO asigDao=new AsignaturaDAO(); String
                            asignaturaParam=request.getParameter("asignatura"); int idAsignaturaFiltro=0; if
                            (asignaturaParam !=null && !asignaturaParam.isEmpty()) { try {
                            idAsignaturaFiltro=Integer.parseInt(asignaturaParam); } catch (NumberFormatException e) { /*
                            ERROR IGNORADO */ } } if (accion !=null) { if (accion.equals("crear")) { String
                            descripcion=request.getParameter("descripcion"); String
                            idAsigStr=request.getParameter("idAsignatura"); if (descripcion !=null &&
                            !descripcion.trim().isEmpty() && idAsigStr !=null) { try { int
                            idAsig=Integer.parseInt(idAsigStr); ResultadoAprendizaje ra=new ResultadoAprendizaje();
                            ra.setDescripcion(descripcion.trim()); ra.setIdAsignatura(idAsig); if (raDao.insertar(ra)) {
                            mensaje="Resultado de aprendizaje creado" ; tipoMensaje="success" ;
                            idAsignaturaFiltro=idAsig; /* mantengo filtro */ } else { mensaje="Error al crear el RA" ;
                            tipoMensaje="danger" ; } } catch (NumberFormatException e) { mensaje="Error en los datos" ;
                            tipoMensaje="danger" ; } } else { mensaje="Rellena todos los campos" ; tipoMensaje="warning"
                            ; } } else if (accion.equals("editar")) { String idStr=request.getParameter("id"); String
                            descripcion=request.getParameter("descripcion"); String
                            idAsigStr=request.getParameter("idAsignatura"); if (idStr !=null && descripcion !=null &&
                            idAsigStr !=null) { try { int id=Integer.parseInt(idStr); int
                            idAsig=Integer.parseInt(idAsigStr); ResultadoAprendizaje ra=new ResultadoAprendizaje();
                            ra.setId(id); ra.setDescripcion(descripcion.trim()); ra.setIdAsignatura(idAsig); if
                            (raDao.actualizar(ra)) { mensaje="RA actualizado correctamente" ; tipoMensaje="success" ;
                            idAsignaturaFiltro=idAsig; } else { mensaje="Error al actualizar" ; tipoMensaje="danger" ; }
                            } catch(NumberFormatException e) { mensaje="Datos no validos" ; tipoMensaje="danger" ; } } }
                            else if (accion.equals("eliminar")) { String idStr=request.getParameter("id"); if (idStr
                            !=null) { try { int id=Integer.parseInt(idStr); if (raDao.eliminar(id)) {
                            mensaje="RA eliminado" ; tipoMensaje="success" ; } else { mensaje="Error al eliminar" ;
                            tipoMensaje="danger" ; } } catch (NumberFormatException e) { mensaje="ID no valido" ;
                            tipoMensaje="danger" ; } } } } List<Asignatura> listaAsignaturas = asigDao.listar();
                            List<ResultadoAprendizaje> listaRA;
                                if (idAsignaturaFiltro > 0) {
                                listaRA = raDao.obtenerPorAsignatura(idAsignaturaFiltro);
                                } else {
                                listaRA = raDao.listar();
                                }
                                ResultadoAprendizaje raEditar = null;
                                String editarId = request.getParameter("editarId");
                                if (editarId != null) {
                                try {
                                raEditar = raDao.obtenerPorId(Integer.parseInt(editarId));
                                } catch (NumberFormatException e) {
                                /* ERROR IGNORADO */
                                }
                                }

                                /* VARIABLES DE VISTA */
                                String tituloCard = (raEditar != null) ? "Editar Resultado" : "Nuevo Resultado";
                                String iconoCard = (raEditar != null) ? "fa-pen-to-square" : "fa-plus-circle";
                                String valorAccion = (raEditar != null) ? "editar" : "crear";
                                String textoBoton = (raEditar != null) ? "Guardar Cambios" : "Crear Resultado";
                                String valDescripcion = (raEditar != null) ? raEditar.getDescripcion() : "";
                                String valId = (raEditar != null) ? String.valueOf(raEditar.getId()) : "";
                                %>
                                <!DOCTYPE html>
                                <html lang="es">

                                <head>
                                    <meta charset="UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <title>Gestión de Resultados de Aprendizaje</title>
                                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                                        rel="stylesheet">
                                    <link rel="stylesheet"
                                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                                    <link
                                        href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap"
                                        rel="stylesheet">
                                    <link href="css/styles.css" rel="stylesheet">
                                </head>

                                <body>
                                    <nav class="navbar navbar-expand-lg navbar-custom">
                                        <div class="container">
                                            <a class="navbar-brand" href="index.jsp"><i
                                                    class="fa-solid fa-graduation-cap me-2"></i>Gestión Académica</a>
                                            <button class="navbar-toggler border-0 text-white" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#navMenu"><i
                                                    class="fa-solid fa-bars"></i></button>
                                            <div class="collapse navbar-collapse" id="navMenu">
                                                <ul class="navbar-nav ms-auto">
                                                    <li class="nav-item ps-3"><a class="nav-link"
                                                            href="asignaturas.jsp">Asignaturas</a></li>
                                                    <li class="nav-item ps-3"><a class="nav-link active"
                                                            href="resultados.jsp">Resultados</a></li>
                                                    <li class="nav-item ps-3"><a class="nav-link"
                                                            href="criterios.jsp">Criterios</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>
                                    <div class="container container-main">
                                        <h2 class="page-title"><i class="fa-solid fa-bullseye me-2"></i>Resultados de
                                            Aprendizaje</h2>
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
                                                        action="resultados.jsp" method="get">
                                                        <label class="me-3 fw-bold text-secondary"><i
                                                                class="fa-solid fa-filter me-2"></i>Filtrar por
                                                            Asignatura:</label>
                                                        <select name="asignatura" class="form-select w-50"
                                                            onchange="this.form.submit()">
                                                            <option value="0">Ver Todas</option>
                                                            <% for(Asignatura a : listaAsignaturas) { %>
                                                                <option value="<%= a.getId() %>" <%
                                                                    if(idAsignaturaFiltro==a.getId()){ %>selected<% } %>
                                                                        >
                                                                        <%= a.getNombre() %>
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
                                                            <form method="post" action="resultados.jsp">
                                                                <input type="hidden" name="accion"
                                                                    value="<%= valorAccion %>">
                                                                <% if (raEditar !=null) { %>
                                                                    <input type="hidden" name="id" value="<%= valId %>">
                                                                    <% } %>
                                                                        <div class="mb-3">
                                                                            <label class="form-label">Asignatura</label>
                                                                            <select name="idAsignatura"
                                                                                class="form-select" required>
                                                                                <option value="">Selecciona una
                                                                                    asignatura...</option>
                                                                                <% for(Asignatura a : listaAsignaturas)
                                                                                    { %>
                                                                                    <option value="<%= a.getId() %>" <%
                                                                                        if((raEditar !=null &&
                                                                                        raEditar.getIdAsignatura()==a.getId())
                                                                                        || (raEditar==null &&
                                                                                        idAsignaturaFiltro==a.getId())){
                                                                                        %>selected<% } %>>
                                                                                            <%= a.getNombre() %>
                                                                                    </option>
                                                                                    <% } %>
                                                                            </select>
                                                                        </div>
                                                                        <div class="mb-4">
                                                                            <label class="form-label">Descripción
                                                                                RA</label>
                                                                            <textarea class="form-control"
                                                                                name="descripcion" rows="4" required
                                                                                placeholder="Ej. RA1. Configura sistemas informáticos..."><%= valDescripcion %></textarea>
                                                                        </div>
                                                                        <button type="submit"
                                                                            class="btn btn-custom-primary w-100">
                                                                            <%= textoBoton %>
                                                                        </button>
                                                                        <% if (raEditar !=null) { %>
                                                                            <a href="resultados.jsp"
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
                                                                    Lista de Resultados</h5>
                                                                <span class="badge bg-light text-secondary">
                                                                    <%= listaRA.size() %> Registros
                                                                </span>
                                                            </div>
                                                            <div class="table-responsive">
                                                                <table class="table table-hover table-custom mb-0">
                                                                    <thead>
                                                                        <tr>
                                                                            <th class="ps-4">ID</th>
                                                                            <th>Descripción</th>
                                                                            <th>ID Asig.</th>
                                                                            <th class="text-end pe-4">Acciones</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <% if (listaRA.isEmpty()) { %>
                                                                            <tr>
                                                                                <td colspan="4"
                                                                                    class="text-center py-5 text-muted">
                                                                                    <i
                                                                                        class="fa-regular fa-folder-open fa-2x mb-3 d-block"></i>
                                                                                    No hay resultados de aprendizaje
                                                                                    registrados
                                                                                    <% if (idAsignaturaFiltro> 0) { %>
                                                                                        para esta asignatura <% } %>
                                                                                </td>
                                                                            </tr>
                                                                            <% } else { for (ResultadoAprendizaje ra :
                                                                                listaRA) { %>
                                                                                <tr>
                                                                                    <td
                                                                                        class="ps-4 fw-bold text-secondary">
                                                                                        <%= ra.getId() %>
                                                                                    </td>
                                                                                    <td>
                                                                                        <%= ra.getDescripcion() %>
                                                                                    </td>
                                                                                    <td><span
                                                                                            class="badge bg-secondary">
                                                                                            <%= ra.getIdAsignatura() %>
                                                                                        </span></td>
                                                                                    <td class="text-end pe-4">
                                                                                        <a href="resultados.jsp?editarId=<%= ra.getId() %>&asignatura=<%= idAsignaturaFiltro %>"
                                                                                            class="btn-action-edit"
                                                                                            title="Editar"><i
                                                                                                class="fa-solid fa-pen"></i></a>
                                                                                        <a href="resultados.jsp?accion=eliminar&id=<%= ra.getId() %>"
                                                                                            class="btn-action-delete"
                                                                                            onclick="return confirm('¿Seguro que quieres eliminar este RA?')"
                                                                                            title="Eliminar"><i
                                                                                                class="fa-solid fa-trash"></i></a>
                                                                                        <a href="criterios.jsp?ra=<%= ra.getId() %>"
                                                                                            class="btn-action-view"
                                                                                            title="Ver Criterios"><i
                                                                                                class="fa-solid fa-list-check"></i>
                                                                                            CE</a>
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
                                            <p class="mb-0">Diseñado y Desarrollado por <strong>Gonzalo
                                                    Gilabert</strong> &copy; 2026</p>
                                        </div>
                                    </div>
                                    <script
                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                                </body>

                                </html>