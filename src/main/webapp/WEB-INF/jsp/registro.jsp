<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
    <link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
    <div class="container">
		
		<!-- Imagen de registro -->
		<img src="imagenes/registro.png" alt="registro" class="registro">
				
				
        <h2>REGISTRO</h2>
        <br>
		
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
            <label for="nombre"><img src="imagenes/usuario.png" alt="usuario" class="usuario">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required=""><br><br>

			<label for="apellido"><img src="imagenes/usuario.png" alt="usuario" class="usuario">Apellidos:</label>
			<input type="text" id="apellido" name="apellido" required=""><br><br>
						
			<label for="email"><img src="imagenes/correo.png" alt="correo" class="correo">Email:</label>
			<input type="email" id="email" name="email" required=""><br><br>
					   
			<label for="contrasena"><img src="imagenes/contrasena.png" alt="contrasena" class="contrasena">Contraseña:</label>
		
			 <div class="password-container">
			                <input type="password" id="contrasena" name="contrasena" required>
			                <span class="toggle-password" onclick="togglePassword()">
			                    👁️
			                </span>
			            </div>
			<!-- Mensaje que indica si la contraseña está visible o oculta -->
			<p id="password-status"class="password-status">Contraseña oculta</p>
			<br>			
											 
			 <label for="rol"><img src="imagenes/rol.png" alt="rol" class="rol">Rol:</label>
			     <select id="rol" name="rol" required>
			         <option value="usuario">Usuario</option>
			          <option value="Administrador">Administrador</option>
			      </select>
				  <br>
				  <br>


            <!-- Botón para registrar el usuario -->
            <button type="submit" class="registro-btn">Registrarse</button>
        </form>

        <br>

        <!-- Enlace para redirigir a la página de login -->
		<form action="/index" method="get">
		    <button type="submit" class="volver-btn">Volver al Login</button>
		</form>
    </div>
	
	<script>
	        function togglePassword() {
	            var passwordField = document.getElementById("contrasena");
	            var passwordStatus = document.getElementById("password-status");  // Contenedor del mensaje

	            if (passwordField.type === "password") {
	                passwordField.type = "text";  // Mostrar la contraseña
	                passwordStatus.textContent = "Contraseña visible";  // Cambiar el mensaje
	            } else {
	                passwordField.type = "password";  // Ocultar la contraseña
	                passwordStatus.textContent = "Contraseña oculta";  // Cambiar el mensaje
	            }
	        }
	</script>
</body>
</html>
