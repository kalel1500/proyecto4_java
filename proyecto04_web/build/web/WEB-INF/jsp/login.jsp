<%-- 
    Document   : login
    Created on : 21-feb-2019, 23:38:37
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("listarProducto");%>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1>Login</h1>
        </div>
    </div>

    <form:form class="form-horizontal form-con-fondo" modelAttribute="usu" action="login" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="email_usuario">Email:</label>
            <div class="col-sm-10">
                <form:input type="email" path="email_usuario" class="form-control"/>
                <form:errors path="email_usuario" style="color: red;" />
                <span id="err_email_usuario" style="color: red;"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="password_usuario">Password:</label>
            <div class="col-sm-10">
                <form:input type="password" path="password_usuario" class="form-control"/>
                <form:errors path="password_usuario" style="color: red;" />
                <span id="err_password_usuario" style="color: red;"></span>
            </div>
        </div>

        <c:if test="${msgLogin eq 'incorrecto'}">
            <div class="col-md-12 text-center alert alert-danger">
            <span style="color: red;"> El usuario o la contraseña son incorrectos</span>
            </div>
        </c:if>

        <form:input path="nombre_usuario" type="hidden" value="r" />
        <form:input path="apellido_usuario" type="hidden" value="r" />

        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="Enviar"/>
            </div>
        </div>

    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />

