<%-- 
    Document   : login
    Created on : 21-feb-2019, 23:38:37
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("index");%>
</c:if>

<div class="container">
    <h1>Login</h1>
    <form:form class="form-horizontal form-con-fondo" modelAttribute="usu" action="login" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_usuario">Email:</label>
            <div class="col-sm-10">
                <form:input path="email_usuario" class="form-control"/>
                <span class="error_email"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_usuario">Password:</label>
            <div class="col-sm-10">
                <form:input type="password" path="password_usuario" class="form-control"/>
                <span class="error_password"></span>
            </div>
        </div>

        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="Enviar"/>
            </div>
        </div>

    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />

