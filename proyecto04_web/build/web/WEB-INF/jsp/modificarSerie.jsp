<%-- 
    Document   : modificarSerie
    Created on : 27-feb-2019, 20:02:01
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Modificar serie</h1>
    <form:form class="form-horizontal form-con-fondo" modelAttribute="serie" action="modificarSerie" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-2" for="nombre_serie">Nombre:</label>
            <div class="col-sm-10">
                <form:input path="serie_nom" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="categoria_id">Categoria:</label>
            <div class="col-sm-10">
                <form:select path="categoria_id" class="form-control">
                    <form:option value="0">-Selecciona-</form:option>
                    <c:forEach var="cat" items="${listaCategoria}">
                        <form:option value="${cat.categoria_id}">${cat.categoria_nom}</form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <form:hidden path="serie_id" />

        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="Enviar"/>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />
