<%-- 
    Document   : head
    Created on : 22-feb-2019, 1:51:35
    Author     : Usuario
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tactil</title>
        
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/estilos.css" type="text/css" media="all" />
        <script src="${pageContext.request.contextPath}/js/js.js"></script>
        
        <style>
            td a {
                display: block;
                color: #333;
            }
            td a:hover {
                text-decoration: none;
                color: #333;
            }
            tr:hover {
                background-color: #e2e2e2;
                
            }
            button a {
                color: white;
            }
            button {
                margin: 15px 5px !important;
            }
        </style>
    </head>
    
    <body style="margin-top: 51px">
        <jsp:include page="/WEB-INF/jsp/proc/nav.jsp" />
        
        <section>