<%-- 
    Document   : insertarCategoria
    Created on : 27-feb-2019, 19:25:02
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
    <h1>Insertar categoria</h1>
   
    <form:form class="form-horizontal form-con-fondo" modelAttribute="categoria" action="insertarCategoria" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="categoria_nom">Nombre:</label>
            <div class="col-sm-10">
                <form:input path="categoria_nom" class="form-control"/>
                <form:errors path="categoria_nom" style="color: red;" />
                <span id="err_categoria_nom" style="color: red;"></span>
            </div>
        </div>
        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-2">
                <a href="listarCategoria" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="col-sm-offset-1 col-sm-2">
                <input type="submit" class="btn btn-success" value="Enviar"/>
            </div>
        </div>
        
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
