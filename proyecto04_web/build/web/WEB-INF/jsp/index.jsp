



<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("listarProducto");%>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <div class="centrado-automatico">
        <a href="login"><img class="imgInicio" src="img/otros/logo.jpeg"></a>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />