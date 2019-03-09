<%-- 
    Document   : perfilUsuario
    Created on : 25-feb-2019, 20:23:37
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
    <h1>Perfil</h1>
    <c:choose>
        <c:when test="${sessionScope.us != null}">
            <h2>Bienvenido/a ${us.nombre_usuario}</h2>
            <table>
                <tr>
                    <th>Id:</th>
                    <td>${us.id_usuario}</td>
                </tr>
                <tr>
                    <th>Nombre:</th>
                    <td>${us.nombre_usuario}</td>
                </tr>
                <tr>
                    <th>Apellido:</th>
                    <td>${us.apellido_usuario}</td>
                </tr>
                <tr>
                    <th>Correo:</th>
                    <td>${us.email_usuario}</td>
                </tr>
                <tr>
                    <th>Contraseña:</th>
                    <td>${us.password_usuario}</td>
                </tr>
            </table>
            
        </c:when>
        <c:when test="${sessionScope.us == null}">
            Aun no te has registrado.
        </c:when>
        <c:otherwise>
            do this when nothing else is true
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />