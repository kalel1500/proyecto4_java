



<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us != null}">
    <% response.sendRedirect("listarProducto");%>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Index</h1>
    imagen con <a href="login">link</a> a login
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />