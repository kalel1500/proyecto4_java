<%-- 
    Document   : modificarProducto
    Created on : 06-mar-2019, 7:44:16
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
    <h1>Modificar producto</h1>
    <form:form class="form-horizontal form-con-fondo" modelAttribute="producto" action="modificarProducto" method="POST">
        <div class="form-group">
            <label class="control-label col-sm-3" for="producte_nom">Nombre:</label>
            <div class="col-sm-9">
                <form:input path="producte_nom" class="form-control"/>
                <form:errors path="producte_nom" style="color: red;" />
                <span id="err_producte_nom" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="producte_preu">Precio:</label>
            <div class="col-sm-9">
                <form:input type="number" step="0.01" min="0" path="producte_preu" class="form-control"/>
                <form:errors path="producte_preu" style="color: red;" />
                <span id="err_producte_preu" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="producte_descripcio">Descripcion:</label>
            <div class="col-sm-9">
                <form:textarea path="producte_descripcio" class="form-control"/>
                <form:errors path="producte_descripcio" style="color: red;" />
                <span id="err_producte_descripcio" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="producte_descompte">Descuento:</label>
            <div class="col-sm-9">
                <form:input path="producte_descompte" class="form-control"/>
                <form:errors path="producte_descompte" style="color: red;" />
                <span id="err_producte_descompte" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="serie_nom">Serie:</label>
            <div class="col-sm-9">
                <form:select path="serie_nom" class="form-control">
                    <form:option value="">-Selecciona-</form:option>
                    <c:forEach var="list" items="${listaSerie}">
                        <form:option value="${list.serie_nom}">${list.serie_nom}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="serie_nom" style="color: red;" />
                <span id="err_serie_nom" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="estoc_quantitat">Estoc actual:</label>
            <div class="col-sm-9">
                <form:input path="estoc_quantitat" class="form-control"/>
                <form:errors path="estoc_quantitat" style="color: red;" />
                <span id="err_estoc_quantitat" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="estoc_minim">Estoc minimo:</label>
            <div class="col-sm-9">
                <form:input path="estoc_minim" class="form-control"/>
                <form:errors path="estoc_minim" style="color: red;" />
                <span id="err_estoc_minim" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="estoc_maxim">Estoc maximo:</label>
            <div class="col-sm-9">
                <form:input path="estoc_maxim" class="form-control"/>
                <form:errors path="estoc_maxim" style="color: red;" />
                <span id="err_estoc_maxim" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="lloc_bloc">Bloque:</label>
            <div class="col-sm-9">
                <form:select path="lloc_bloc" class="form-control">
                    <form:option value="">-Selecciona-</form:option>
                    <c:forEach var="list" items="${listaBloqueLugar}">
                        <form:option value="${list.lloc_bloc}">${list.lloc_bloc}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="lloc_bloc" style="color: red;" />
                <span id="err_lloc_bloc" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="lloc_passadis">Pasillo</label>
            <div class="col-sm-9">
                <form:select path="lloc_passadis" class="form-control">
                    <form:option value="">-Selecciona-</form:option>
                    <c:forEach var="list" items="${listaPasilloLugar}">
                        <form:option value="${list.lloc_passadis}">${list.lloc_passadis}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="lloc_passadis" style="color: red;" />
                <span id="err_lloc_passadis" style="color: red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3" for="lloc_lleixa">Estante:</label>
            <div class="col-sm-9">
                <form:select path="lloc_lleixa" class="form-control">
                    <form:option value="">-Selecciona-</form:option>
                    <c:forEach var="list" items="${listaEstanteLugar}">
                        <form:option value="${list.lloc_lleixa}">${list.lloc_lleixa}</form:option>
                    </c:forEach>
                </form:select>
                <form:errors path="lloc_lleixa" style="color: red;" />
                <span id="err_lloc_lleixa" style="color: red;"></span>
            </div>
        </div>
            
        <form:hidden path="producte_id" />
        
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-2">
                <a href="listarProducto" class="btn btn-danger">Cancelar</a>
            </div>
            <div class="col-sm-offset-1 col-sm-2">
                <input type="submit" class="btn btn-success" value="Enviar"/>
            </div>
        </div>
    </form:form>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />

