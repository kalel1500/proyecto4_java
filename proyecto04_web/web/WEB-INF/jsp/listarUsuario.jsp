<%-- 
    Document   : listarUsuarios
    Created on : 22-feb-2019, 2:13:32
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index"); %>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Lista de usuarios</h1>
    
    <a href="insertarUsuario" class="btn btn-success boton-agregar"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Agregar</a>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Codigo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="per" items="${listaUsuario}">
                    <tr>
                        <th scope="row">${per.id_usuario}</th>
                        <td>${per.nombre_usuario}</td>
                        <td>${per.apellido_usuario}</td>
                        <td>${per.email_usuario}</td>
                        <td>${per.password_usuario}</td>
                        <td><a href="eliminarUsuario?id=${per.id_usuario}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="modificarUsuario?id=${per.id_usuario}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />


