



<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/head.jsp" />

    <body>
        <jsp:include page="/WEB-INF/jsp/nav.jsp" />
        
        <h2>Index</h2>
        <c:choose>
            <c:when test="${sessionScope.us != null}">
                <h1>Bienvenido/a ${us.nombre_usuario}</h1>
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
        
    </body>
</html>
