<%-- 
    Document   : listarProducto
    Created on : 24-feb-2019, 0:29:25
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/proc/head.jsp" />

<div class="container">
    <h1>Lista de productos</h1>
    <button type="button" class="btn btn-success">
        <a href="insertarProducto"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Agregar</a>
    </button>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th>Foto</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Descuento</th>
                    <th>Descripcion</th>
                    <th>Serie</th>
                    <th>Categoria</th>
                    <th>Ver Producto</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="per" items="${listaProducto}">
                    <tr>

                        <th scope="row">${per.producte_id}</th>
                        <td><img src="${per.producte_fotoRuta}${per.producte_fotoNom}${per.producte_fotoExt}"></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.producte_nom}</a></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.producte_preu}</a></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.producte_descripcio}</a></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.producte_descompte}</a></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.serie_nom}</a></td>
                        <td><a href="detalleProducto?id=${per.producte_id}">${per.categoria_nom}</a></td>

                        <td><a href="detalleProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-eye-open"></span></a></td>
                        <td><a href="eliminarProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                        <td><a href="modificarProducto?id=${per.producte_id}"><span class="glyphicon glyphicon-pencil"></span></a></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/proc/footer.jsp" />


