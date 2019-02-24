<%-- 
    Document   : modificarUsuario
    Created on : 22-feb-2019, 2:23:33
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Modificar usuario</h1>
    <form:form modelAttribute="usuario" action="modificarUsuario" method="POST">
        Nombre:
        <form:input path="nombre_usuario"/> <br/>
        Apellido:
        <form:input path="apellido_usuario"/> <br/>
        Password:
        <form:input path="password_usuario"/> <br/>
        Email:
        <form:input path="email_usuario"/> <br/>

        <form:hidden path="id_usuario" />
        <input type="submit" value="Enviar"/>
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
