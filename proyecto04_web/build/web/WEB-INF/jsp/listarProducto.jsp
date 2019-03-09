<%-- 
    Document   : listarProducto
    Created on : 24-feb-2019, 0:29:25
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.us == null}">
    <% response.sendRedirect("index"); %>
</c:if>
<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container" id="cont">
    <h1>Lista de productos</h1>
    
    <a href="insertarProducto" class="btn btn-success boton-agregar"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Agregar</a>

    <div class="container div-contenedor-buscador">
        <!--        <div class="row">-->
        <form:form class="form-horizontal col-sm-12" modelAttribute="producto" action="filtrarProducto" method="POST">
            <div class="form-group col-sm-3">
                <label class="control-label col-sm-5" for="producte_id">Codigo:</label>
                <div class="col-sm-7">
                    <form:input path="producte_id" class="form-control"/>
                </div>
            </div>

            <div class="form-group col-sm-3">
                <label class="control-label col-sm-5" for="producte_nom">Nombre:</label>
                <div class="col-sm-7">
                    <form:input path="producte_nom" class="form-control"/>
                </div>
            </div>

            <%-- <div class="form-group col-sm-3">
                <label class="control-label col-sm-4" for="producte_nom">Serie:</label>
                <div class="col-sm-8" id="cargar-select-serie">
                    <form:select path="serie_id" class="form-control">
                        <form:option value="0">-Selecciona-</form:option>
                        <c:forEach var="ser" items="${listaSerie}">
                            <form:option value="${ser.serie_id}">${ser.serie_nom}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div> --%>

            <div class="form-group col-sm-4">
                <label class="control-label col-sm-4" for="categoria_nom">Categoria:</label>
                <div class="col-sm-8">
                    <form:select path="categoria_nom" class="form-control">
                        <form:option value="">-Selecciona-</form:option>
                        <c:forEach var="cat" items="${listaCategoria}">
                            <form:option value="${cat.categoria_nom}">${cat.categoria_nom}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
            </div>

            <div class="form-group col-sm-1">
                <input class="btn btn-info" type="submit" value="Filtrar" />
            </div>
            <div class="form-group col-sm-1">
                <a href="listarProducto" class="btn btn-danger">Limpiar</a>
            </div>
        </form:form>
        <!--        </div>-->
    </div>


    <div class="container lista-prod">
        <c:forEach var="per" items="${listaProducto}">
            <div class="row fila-lista-prod alinear-contenido-vertical">
                
                    <div class="col-md-0">${per.producte_id}</div>
                    <div class="col-md-2">
                        <a href="detalleProducto?id=${per.producte_id}">
                            <img class="img-lista-prod" alt="imagen: ${per.producte_nom}" src="${per.producte_fotoRuta}${per.producte_fotoNom}${per.producte_fotoExt}">
                        </a>
                    </div>
                    <div class="col-md-7">
                        <div class="col-md-12 nombre-lista-prod"><a href="detalleProducto?id=${per.producte_id}">${per.producte_nom}</a></div>

                        <div class="col-md-3 precio-lista-prod"><span class="negrita">Precio:</span> €${per.producte_preu}</div>
                        <div class="col-md-3 descuento-lista-prod"><span class="negrita">Descuento:</span> ${per.producte_descompte}%</div>
                        <div class="col-md-3 serie-lista-prod"><span class="negrita">Serie:</span> ${per.serie_nom}</div>
                        <div class="col-md-3 categoria-lista-prod"><span class="negrita">Categoria:</span> ${per.categoria_nom}</div>

                        <div class="col-md-12 descripcion-lista-prod">${per.producte_descripcio}</div>

                        <div class="col-md-1">
                            <a href="detalleProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-eye-open"></span></a>
                        </div>
                        <div class="col-md-1">
                            <a href="eliminarProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                        <div class="col-md-1">
                            <a href="modificarProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-pencil"></span></a>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <div class="col-md-12">
<!--                            <span class="negrita">ESTOC:</span>-->
                            <div class=""><span class="negrita">Estoc actual:</span> ${per.estoc_quantitat}</div>
                            <div class=""><span class="negrita">Estoc minimo:</span> ${per.estoc_minim}</div>
                            <div class=""><span class="negrita">Estoc maximo:</span> ${per.estoc_maxim}</div>
                        </div>
<!--                        <div class="col-md-7">
                            <span class="negrita">LUGAR:</span>
                            <div class=""><span class="negrita">Bloque:</span> Bloque 1</div>
                            <div class=""><span class="negrita">Passillo</span> Passillo 1</div>
                            <div class=""><span class="negrita">Estante:</span> Estante 1</div>
                        </div>-->
                    </div>
                

            </div>
        </c:forEach>

    </div>
</div>

<script type="text/javascript">
//    $('#categoria_nom').change(
//            function () {
//                $('#cont').load('cargarSelectSerie',
//                        "categoria_nom=" + $('#categoria_nom').val());
//                        
//            }
//    );
</script>
<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />


