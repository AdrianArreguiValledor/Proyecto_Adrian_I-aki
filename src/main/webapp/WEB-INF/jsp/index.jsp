<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	    <h2>INICIAR SESIÓN</h2>
	    
		<!-- Mostrar error si existe -->
		    <% if (request.getAttribute("error") != null) { %>
		        <p class="error"><%= request.getAttribute("error") %></p>
		    <% } %>

		    <!-- Mostrar mensaje si existe -->
		    <% if (request.getAttribute("mensaje") != null) { %>
		        <p class="mensaje"><%= request.getAttribute("mensaje") %></p>
		    <% } %>
			
	    <form id="login-form" action="formularioLogin" method="post">
	        <label for="email">Email:</label>
	        <input type="email" id="email" name="email" required=""><br><br>

	        <label for="contrasena">Contraseña:</label>
	        <input type="password" id="contrasena" name="contrasena" required=""><br><br>

	        <button type="submit">Iniciar Sesión</button>
			<br>
			<br>
	    </form>

		<!-- Botón para ir registrarse -->
		<form action="/registro" method="get">
		    <button type="submit" class="registro-btn">Registrarse</button>
		</form>
			
	</div>

	</body>
	</html>
 
	