<%-- 
    Document   : insertarUsuario
    Created on : 22-feb-2019, 2:18:59
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/head.jsp" />

    <body>
        <jsp:include page="/WEB-INF/jsp/nav.jsp" />
        
        <h1>Insertar usuario</h1>
        
        <form:form modelAttribute="usuario" action="insertarUsuario" method="POST">
            Nombre:
            <form:input path="nombre_usuario"/> <br/>
            Apellido:
            <form:input path="apellido_usuario"/> <br/>
            Email:
            <form:input path="email_usuario"/> <br/>
            Password:
            <form:input path="password_usuario"/> <br/>
            
            <input type="submit" value="Enviar"/>
        </form:form>
    </body>
</html>
