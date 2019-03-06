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
            Id: ${us.id_usuario} <br>
            Nombre: ${us.nombre_usuario} <br>
            Apellido: ${us.apellido_usuario} <br>
            Correo: ${us.email_usuario} <br>
            Contraseña: ${us.password_usuario} <br>
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