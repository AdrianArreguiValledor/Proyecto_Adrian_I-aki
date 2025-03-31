<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
    <link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
    <div class="container">
        <h2>REGISTRO</h2>
        
        <!-- Mostrar error si existe -->
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <!-- Mostrar mensaje de éxito si existe -->
        <% if (request.getAttribute("mensaje") != null) { %>
            <p class="success"><%= request.getAttribute("mensaje") %></p>
        <% } %>

        <!-- Formulario de registro -->
        <form id="registro-form" action="/formularioRegistro" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required=""><br><br>

			<label for="apellido">Apellidos:</label>
			<input type="text" id="apellido" name="apellido" required=""><br><br>
						
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required=""><br><br>
					   
			<label for="contrasena">Contraseña:</label>
			 <input type="password" id="contrasena" name="contrasena" required=""><br><br>
								 


           

            <!-- Botón para registrar el usuario -->
            <button type="submit" class="registro-btn">Registrarse</button>
        </form>

        <br>

        <!-- Enlace para redirigir a la página de login -->
		<form action="/index" method="get">
		    <button type="submit" class="volver-btn">Volver al Login</button>
		</form>
    </div>
</body>
</html>
