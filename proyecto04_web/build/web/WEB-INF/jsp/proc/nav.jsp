<%-- 
    Document   : nav
    Created on : 22-feb-2019, 1:57:51
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span> 
            </button>

            <a class="navbar-brand  minav-caja-logo" href="index.php"><img class="minav-logo" src="./assets/imagenes/logo/logo.png">Tactil</a>

        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="index">index</a></li>
                <li><a href="listarProducto">Productos</a></li>
                <li><a href="listarUsuario">Usuarios</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.us != null}">
                        <li id="li-link-nombre-usuario"><a href="perfilUsuario"><span class="glyphicon glyphicon-user"></span> ${us.nombre_usuario}</a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesion</a></li>
                    </c:when>
                    <c:when test="${sessionScope.us == null}">
                        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>

<!--<nav navbar navbar-inverse navbar-fixed-top>
    <ul>
        <li><a href="index">index</a></li>
        <li><a href="listarUsuario">Ver usuarios</a></li>
        <li><a href="insertarUsuario">Insertar usuarios</a></li>
        <li>
            <cchoose>
                <cwhen test="$sessionScope.us != null}">
                    $us.nombre_usuario}
                    <a href="logout">|Cerrar Sesion</a>
                    <br>
                </cwhen>
                <cwhen test="$sessionScope.us == null}">
                    <a href="login">Login</a>
                    <br>
                </cwhen>
                <cotherwise>

                </cotherwise>
            </cchoose>
        </li>
    </ul>
</nav>-->

