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
    <form:form class="form-horizontal" modelAttribute="usuario" action="modificarUsuario" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_usuario">Nombre:</label>
            <div class="col-sm-10">
                <form:input path="nombre_usuario" class="form-control"/>
            </div>
        </div>
            
        <div class="form-group">
            <label class="control-label col-sm-2" for="apellido_usuario">Apellido:</label>
            <div class="col-sm-10">
                <form:input path="apellido_usuario" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="email_usuario">Email:</label>
            <div class="col-sm-10">
                <form:input path="email_usuario" class="form-control"/>
            </div>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="password_usuario">Password:</label>
            <div class="col-sm-10">
                <form:input path="password_usuario" class="form-control"/>
            </div>
        </div>
        
        <form:hidden path="id_usuario" />
        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="Enviar"/>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
