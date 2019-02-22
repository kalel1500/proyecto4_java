<%-- 
    Document   : nav
    Created on : 22-feb-2019, 1:57:51
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav>
    <ul>
        <li><a href="index">index</a></li>
        <li><a href="listarUsuario">Ver usuarios</a></li>
        <li><a href="insertarUsuario">Insertar usuarios</a></li>
        <li>
            <c:choose>
                <c:when test="${sessionScope.us != null}">
                    ${us.nombre_usuario}
                    <a href="logout">|Cerrar Sesion</a>
                    <br>
                </c:when>
                <c:when test="${sessionScope.us == null}">
                    <a href="login">Login</a>
                    <br>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</nav>
            
