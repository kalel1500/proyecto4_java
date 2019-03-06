<%-- 
    Document   : listarCategoria
    Created on : 27-feb-2019, 18:16:52
    Author     : Categoria
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index"); %>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Lista de Categorias</h1>
    
    <a href="insertarCategoria" class="btn btn-success boton-agregar"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Agregar</a>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Codigo</th>
                    <th>Nombre</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cat" items="${listaCategoria}">
                    <tr>
                        <th scope="row">${cat.categoria_id}</th>
                        <td>${cat.categoria_nom}</td>
                        <td><a href="eliminarCategoria?id=${cat.categoria_id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="modificarCategoria?id=${cat.categoria_id}"><span class="glyphicon glyphicon-pencil"></span></a></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />