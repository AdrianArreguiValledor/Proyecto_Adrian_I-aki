<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<div class="container" id="login-container">
    <!-- Contenedor del formulario -->
    <div class="form-container">
        <!-- Imagen de inicio de sesion -->
        <img src="imagenes/inicio_sesion.png" alt="inicio_sesion" class="inicio_sesion">

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
            <label for="email"><img src="imagenes/correo.png" alt="inicio_sesion" class="inicio_sesion">Email:</label>
            <input type="email" id="email" name="email" required=""><br><br>

            <label for="contrasena">
                <img src="imagenes/contrasena.png" alt="contrasena" class="contrasena">Contraseña:
            </label>
            <div class="password-container">
                <input type="password" id="contrasena" name="contrasena" required>
                <span class="toggle-password" onclick="togglePassword()">👁️</span>
            </div>
            
            <!-- Mensaje que indica si la contraseña está visible o oculta -->
            <p id="password-status">Contraseña oculta</p>

            <br>
            <button type="submit">Iniciar Sesión</button>
            <br><br><br>
        </form>

		<br>
		
        <!-- Enlace para ir registrarse -->
        <p class="registro-texto">¿No tienes cuenta? <a href="/registro">Regístrate aquí</a></p>
    </div>

    <!-- Contenedor de la imagen de la tienda -->
    <div class="tienda-container">
        <img src="imagenes/tienda.png" alt="tienda" class="tienda-imagen">
    </div>
</div>
    
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("contrasena");
            var passwordStatus = document.getElementById("password-status");  // Contenedor del mensaje

            if (passwordField.type === "password") {
                passwordField.type = "text";  // Mostrar la contraseña
                passwordStatus.textContent = "Contraseña visible";  // Cambiar el mensaje
                passwordStatus.className = "password-visible"; // Aplicar estilo verde
            } else {
                passwordField.type = "password";  // Ocultar la contraseña
                passwordStatus.textContent = "Contraseña oculta";  // Cambiar el mensaje
                passwordStatus.className = "password-hidden"; // Aplicar estilo rojo
            }
        }

        // Animación al cargar la página
        window.onload = function() {
            document.getElementById("login-container").style.opacity = 0;
            document.getElementById("login-container").style.transition = "opacity 2s ease-in-out";
            setTimeout(function() {
                document.getElementById("login-container").style.opacity = 1;
            }, 100);
        }
    </script>
</body>
</html>
