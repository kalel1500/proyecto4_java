<%-- 
    Document   : detalleProducto
    Created on : 24-feb-2019, 23:25:41
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>${producto.producte_nom}</h1>
    
    <img src="${producto.producte_fotoRuta}${producto.producte_fotoNom}${producto.producte_fotoExt}">
    <br>
    Precio: ${producto.producte_preu}
    <br>
    Descripción: ${producto.producte_descripcio}
    <br>
    Descuento: ${producto.producte_descompte}
    <br>
    Serie: ${producto.serie_nom}
    <br>
    Categoria: ${producto.categoria_nom}
    
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />

