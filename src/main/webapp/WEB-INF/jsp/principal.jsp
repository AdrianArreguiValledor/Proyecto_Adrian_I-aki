<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Página JSP Sencilla</title>
    <link rel="stylesheet" type="text/css" href="style3.css">
</head>
<body>
    <div class="container"> <!-- Contenedor con clase container -->
        <h1>Bienvenido a tu primera pagina JSP!</h1>
        <p>Esta es una pagina JSP simple.</p>
        <p>El tiempo de ejecucion de la pagina JSP es: <%= new java.util.Date() %></p>

        <!-- Utilizando JSTL para mostrar un mensaje -->
        <c:choose>
            <c:when test="${not empty param.name}">
                <p>Hola, <b>${param.name}</b>!</p>
            </c:when>
            <c:otherwise>
                <p>Hola, visitante!</p>
            </c:otherwise>
        </c:choose>

        <p>Para personalizar el saludo, agrega el parametro <code>?name=TuNombre</code> a la URL.</p>
		<br>
		
		<!-- Boton administrador-->
		<form action="/administrador" method="get">
			<input type="hidden" name="email" value="${session.email}">
			<button type="submit" class="administrador-btn">Ir al Administrador</button>
			</form>
		
			<br>
			<br>
			
        <!-- Enlace para redirigir a la página de login -->
        <form action="/index" method="get">
            <button type="submit" class="volver-btn">Volver al Login</button>
        </form>
        
			
    </div>
</body>
</html>
