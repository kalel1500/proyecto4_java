<%-- 
    Document   : modificarCategoria
    Created on : 27-feb-2019, 19:33:40
    Author     : Categoria
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Modificar categoria</h1>
    <form:form class="form-horizontal form-con-fondo" modelAttribute="categoria" action="modificarCategoria" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_categoria">Nombre:</label>
            <div class="col-sm-10">
                <form:input path="categoria_nom" class="form-control"/>
            </div>
        </div>
            
        <form:hidden path="categoria_id" />
        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="Enviar"/>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
