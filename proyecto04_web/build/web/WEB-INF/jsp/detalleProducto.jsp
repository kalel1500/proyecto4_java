<%-- 
    Document   : detalleProducto
    Created on : 24-feb-2019, 23:25:41
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
    <div class="row">
        <div class="col-md-10 col-sm-10 col-xs-10 div-titulo1-detalleProd">
            <h1 class="page-header">${producto.producte_nom}</h1>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2 div-titulo2-detalleProd">
            <a href="listarProducto"><h3 class="page-header">Volver</h3></a>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-5 mb-4">
            <div class="">
                <div class="div-img-detalle-prod">
                    <img alt="imagen: ${producto.producte_nom}" class="img-fluid img-detalle-prod" src="${producto.producte_fotoRuta}${producto.producte_fotoNom}${producto.producte_fotoExt}">
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-12 col-lg-6">
            <div class="col-sm-12">
                <div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-md-3">Precio:</label>
                        <div class="col-sm-8 col-md-9">
                            <p class="precio-detalle-prod">€${producto.producte_preu}</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-md-3">Descuento:</label>
                        <div class="col-sm-8 col-md-9">
                            <p>${producto.producte_descompte}%</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-md-3">Serie:</label>
                        <div class="col-sm-8 col-md-9">
                            <p>${producto.serie_nom}</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-md-3">Categoria:</label>
                        <div class="col-sm-8 col-md-9">
                            <p>${producto.categoria_nom}</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-md-3">Description:</label>
                        <div class="col-sm-8 col-md-9">
                            <p class="justify">${producto.producte_descripcio}</p>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>Bloque</th>
                    <th>Pasillo</th>
                    <th>Valda</th>

                    <th>Estoc maximo</th>
                    <th>Estoc minimo</th>
                    <th>Estoc actual</th>
                    
                    <th>Modificar/Eliminar <span class="negrita">TODO</span> el producto</th>

                </tr>
            </thead>
            <tbody>
                <% int contador = 0; %>
                <c:forEach var="estLug" items="${listaEstocLugar}">
                    <% contador = contador + 1;%>
                    <tr>
                        <th>Registro <%=contador%>:</th>
                        <td>${estLug.lloc_bloc}</td>
                        <td>${estLug.lloc_passadis}</td>
                        <td>${estLug.lloc_lleixa}</td>

                        <td>${estLug.estoc_maxim}</td>
                        <td>${estLug.estoc_minim}</td>
                        <td>${estLug.estoc_quantitat}</td>
                        
                        <td>
                            <a href="modificarProducto?id=${estLug.producte_id}"><span class="glyphicon glyphicon-pencil"></span></a>
                            <a href="eliminarProducto?id=${estLug.producte_id}"><span class="glyphicon glyphicon-trash"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />

