<%-- 
    Document   : login
    Created on : 21-feb-2019, 23:38:37
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/head.jsp" />

    <body>
        <jsp:include page="/WEB-INF/jsp/nav.jsp" />
        
        <c:if test="${sessionScope.us != null}">
            <% response.sendRedirect("index"); %>
        </c:if>
        <h1>Insertar persona</h1>
        <form:form modelAttribute="usu" action="login" method="POST">
            Email:
            <form:input path="email_usuario"/>
            <span class="error_email"></span>
            <br/>
            
            Password:
            <form:password path="password_usuario"/>
            <span class="error_password"></span>
            <br/>
            
            <input type="submit" value="Enviar"/>
            
        </form:form>
        
    </body>
</html>
