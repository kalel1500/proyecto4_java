<%-- 
    Document   : listarUsuarios
    Created on : 22-feb-2019, 2:13:32
    Author     : Usuario
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/jsp/head.jsp" />

    <body>
        <jsp:include page="/WEB-INF/jsp/nav.jsp" />
        
        <h1>Lista de usuarios</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Eliminar</th>
                    <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="per" items="${listaUsuario}">
                    <tr>
                        <td>${per.id_usuario}</td>
                        <td>${per.nombre_usuario}</td>
                        <td>${per.apellido_usuario}</td>
                        <td>${per.email_usuario}</td>
                        <td>${per.password_usuario}</td>
                        <td><a href="eliminar?id=${per.id_usuario}">Eliminar</a></td>
                        <td><a href="modificar?id=${per.id_usuario}">Modificar</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
