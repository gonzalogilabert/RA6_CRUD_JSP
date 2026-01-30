<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="dao.AsignaturaDAO" %>
            <%@ page import="modelo.Asignatura" %>
                <% /* INICIO LOGICA DE NEGOCIO */ request.setCharacterEncoding("UTF-8"); /* CRUCIAL: Forzar codificación
                    UTF-8 para inputs */ String accion=request.getParameter("accion"); String mensaje="" ; String
                    tipoMensaje="" ; AsignaturaDAO dao=new AsignaturaDAO(); if (accion !=null) { if
                    (accion.equals("crear")) { String nombre=request.getParameter("nombre"); String
                    codigo=request.getParameter("codigo"); if (nombre !=null && !nombre.trim().isEmpty() && codigo
                    !=null && !codigo.trim().isEmpty()) { Asignatura asig=new Asignatura();
                    asig.setNombre(nombre.trim()); asig.setCodigo(codigo.trim()); if (dao.insertar(asig)) {
                    mensaje="Asignatura creada correctamente" ; tipoMensaje="success" ; } else {
                    mensaje="Error al crear la asignatura" ; tipoMensaje="danger" ; } } else {
                    mensaje="Debes rellenar todos los campos" ; tipoMensaje="warning" ; } } else if
                    (accion.equals("editar")) { String idStr=request.getParameter("id"); String
                    nombre=request.getParameter("nombre"); String codigo=request.getParameter("codigo"); if (idStr
                    !=null && nombre !=null && codigo !=null) { try { int id=Integer.parseInt(idStr); Asignatura
                    asig=new Asignatura(); asig.setId(id); asig.setNombre(nombre.trim()); asig.setCodigo(codigo.trim());
                    if (dao.actualizar(asig)) { mensaje="Asignatura actualizada correctamente" ; tipoMensaje="success" ;
                    } else { mensaje="Error al actualizar" ; tipoMensaje="danger" ; } } catch (NumberFormatException e)
                    { mensaje="ID no valido" ; tipoMensaje="danger" ; } } } else if (accion.equals("eliminar")) { String
                    idStr=request.getParameter("id"); if (idStr !=null) { try { int id=Integer.parseInt(idStr); if
                    (dao.eliminar(id)) { mensaje="Asignatura eliminada" ; tipoMensaje="success" ; } else {
                    mensaje="Error al eliminar" ; tipoMensaje="danger" ; } } catch(NumberFormatException e) {
                    mensaje="ID no valido" ; tipoMensaje="danger" ; } } } } List<Asignatura> listaAsignaturas =
                    dao.listar();
                    Asignatura asigEditar = null;
                    String idEditar = request.getParameter("editarId");
                    if (idEditar != null) {
                    try {
                    asigEditar = dao.obtenerPorId(Integer.parseInt(idEditar));
                    } catch (NumberFormatException e) {
                    /* ERROR IGNORADO */
                    }
                    }

                    /* VARIABLES DE VISTA PRE-CALCULADAS */
                    String tituloCard = (asigEditar != null) ? "Editar Asignatura" : "Nueva Asignatura";
                    String iconoCard = (asigEditar != null) ? "fa-pen-to-square" : "fa-plus-circle";
                    String valorAccion = (asigEditar != null) ? "editar" : "crear";
                    String textoBoton = (asigEditar != null) ? "Guardar Cambios" : "Crear Asignatura";
                    String valNombre = (asigEditar != null) ? asigEditar.getNombre() : "";
                    String valCodigo = (asigEditar != null) ? asigEditar.getCodigo() : "";
                    String valId = (asigEditar != null) ? String.valueOf(asigEditar.getId()) : "";
                    %>
                    <!DOCTYPE html>
                    <html lang="es">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Gestión de Asignaturas</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                            rel="stylesheet">
                        <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap"
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
                                        <li class="nav-item ps-3"><a class="nav-link active"
                                                href="asignaturas.jsp">Asignaturas</a></li>
                                        <li class="nav-item ps-3"><a class="nav-link"
                                                href="resultados.jsp">Resultados</a></li>
                                        <li class="nav-item ps-3"><a class="nav-link" href="criterios.jsp">Criterios</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                        <div class="container container-main">
                            <h2 class="page-title"><i class="fa-solid fa-book-open me-2"></i>Gestión de Asignaturas</h2>
                            <% if (!mensaje.isEmpty()) { %>
                                <div class="alert alert-<%= tipoMensaje %> alert-dismissible fade show shadow-sm"
                                    role="alert">
                                    <i class="fa-solid fa-circle-info me-2"></i>
                                    <%= mensaje %>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                                <% } %>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card card-custom">
                                                <h5 class="mb-4"
                                                    style="color: var(--secondary-color); font-weight: 700;">
                                                    <i class='fa-solid <%= iconoCard %> me-2'></i>
                                                    <%= tituloCard %>
                                                </h5>
                                                <form method="post" action="asignaturas.jsp">
                                                    <input type="hidden" name="accion" value="<%= valorAccion %>">
                                                    <% if (asigEditar !=null) { %>
                                                        <input type="hidden" name="id" value="<%= valId %>">
                                                        <% } %>
                                                            <div class="mb-3">
                                                                <label class="form-label">Nombre</label>
                                                                <input type="text" class="form-control" name="nombre"
                                                                    value="<%= valNombre %>" required
                                                                    placeholder="Ej. Desarrollo Web">
                                                            </div>
                                                            <div class="mb-4">
                                                                <label class="form-label">Código</label>
                                                                <input type="text" class="form-control" name="codigo"
                                                                    value="<%= valCodigo %>" required
                                                                    placeholder="Ej. DWEC">
                                                            </div>
                                                            <button type="submit" class="btn btn-custom-primary w-100">
                                                                <%= textoBoton %>
                                                            </button>
                                                            <% if (asigEditar !=null) { %>
                                                                <a href="asignaturas.jsp"
                                                                    class="btn btn-outline-secondary w-100 mt-2 border-0">Cancelar</a>
                                                                <% } %>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card card-custom p-0 overflow-hidden">
                                                <div class="p-4 border-bottom">
                                                    <h5 class="mb-0"
                                                        style="color: var(--secondary-color); font-weight: 700;">Lista
                                                        de Asignaturas</h5>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-custom mb-0">
                                                        <thead>
                                                            <tr>
                                                                <th class="ps-4">ID</th>
                                                                <th>Nombre</th>
                                                                <th>Código</th>
                                                                <th class="text-end pe-4">Acciones</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% if (listaAsignaturas.isEmpty()) { %>
                                                                <tr>
                                                                    <td colspan="4" class="text-center py-4 text-muted">
                                                                        No hay asignaturas registradas</td>
                                                                </tr>
                                                                <% } else { for (Asignatura asig : listaAsignaturas) {
                                                                    %>
                                                                    <tr>
                                                                        <td class="ps-4 fw-bold text-secondary">
                                                                            <%= asig.getId() %>
                                                                        </td>
                                                                        <td>
                                                                            <%= asig.getNombre() %>
                                                                        </td>
                                                                        <td><span
                                                                                class="badge bg-light text-dark border">
                                                                                <%= asig.getCodigo() %>
                                                                            </span></td>
                                                                        <td class="text-end pe-4">
                                                                            <a href="asignaturas.jsp?editarId=<%= asig.getId() %>"
                                                                                class="btn-action-edit"
                                                                                title="Editar"><i
                                                                                    class="fa-solid fa-pen"></i></a>
                                                                            <a href="asignaturas.jsp?accion=eliminar&id=<%= asig.getId() %>"
                                                                                class="btn-action-delete"
                                                                                onclick="return confirm('¿Seguro que quieres eliminar esta asignatura?')"
                                                                                title="Eliminar"><i
                                                                                    class="fa-solid fa-trash"></i></a>
                                                                            <a href="resultados.jsp?asignatura=<%= asig.getId() %>"
                                                                                class="btn-action-view"
                                                                                title="Ver Resultados"><i
                                                                                    class="fa-solid fa-eye"></i> RA</a>
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
                                <p class="mb-0">Diseñado y Desarrollado por <strong>Gonzalo Gilabert</strong> &copy;
                                    2026</p>
                            </div>
                        </div>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    </body>

                    </html>