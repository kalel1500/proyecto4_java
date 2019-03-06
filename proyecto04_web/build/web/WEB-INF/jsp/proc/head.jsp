<%-- 
    Document   : head
    Created on : 22-feb-2019, 1:51:35
    Author     : Usuario
--%>
<!DOCTYPE html>
<% String title = (String) request.getAttribute("title"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${title}</title>
        <link rel="icon" type="image/png" href="img/otros/logo.jpeg"/>
        
        <!--Librerias bootstrap-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <!--Librerias letas-->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
        
        <!--css y js propios-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css" type="text/css" media="all" />
        <script src="${pageContext.request.contextPath}/js/js.js"></script>
    </head>
    
    <% 
        if(title.equals("Inicio")) { 
            %> <body class="body-inicio"> <%
        } else {
            %> <body> <%
        }
    %>
        
        <% 
            if(!title.equals("Inicio")) {
                %> <jsp:include page="/WEB-INF/jsp/proc/nav.jsp" /> <%
            }
        %>
        
        <section>