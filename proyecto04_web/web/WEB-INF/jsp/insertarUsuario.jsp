<%-- 
    Document   : insertarUsuario
    Created on : 22-feb-2019, 2:18:59
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
    <div class="row">
        <div class="col-md-12 text-center">
            <h1>Insertar usuario</h1>
        </div>
    </div>
    
   
    <form:form method="POST" modelAttribute="usuario" action="insertarUsuario" class="form-horizontal form-con-fondo">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_usuario">Nombre:</label>
            <div class="col-sm-10">
                <form:input class="form-control" path="nombre_usuario"/>
                <form:errors path="nombre_usuario" style="color: red;" />
                <span id="err_nombre_usuario" style="color: red;"></span>
            </div>
        </div>
            
        <div class="form-group">
            <label class="control-label col-sm-2" for="apellido_usuario">Apellido:</label>
            <div class="col-sm-10">
                <form:input path="apellido_usuario" class="form-control"/>
                <form:errors path="apellido_usuario" style="color: red;" />
                <span id="err_apellido_usuario" style="color: red;"></span>
            </div>
        </div>
            
        <div class="form-group">
            <label class="control-label col-sm-2" for="email_usuario">Email:</label>
            <div class="col-sm-10">
                <form:input path="email_usuario" class="form-control"/>
                <form:errors path="email_usuario" style="color: red;" />
                <span id="err_email_usuario" style="color: red;"></span>
            </div>
        </div>
        
        <div class="form-group">
            <label class="control-label col-sm-2" for="password_usuario">Password:</label>
            <div class="col-sm-10">
                <form:input path="password_usuario" class="form-control"/>
                <form:errors path="password_usuario" style="color: red;" />
                <span id="err_password_usuario" style="color: red;"></span>
            </div>
        </div>
        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-2">
                <a href="listarUsuario" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="col-sm-offset-1 col-sm-2">
                <input type="submit" class="btn btn-success" value="Enviar"/>
            </div>
        </div>
        
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
