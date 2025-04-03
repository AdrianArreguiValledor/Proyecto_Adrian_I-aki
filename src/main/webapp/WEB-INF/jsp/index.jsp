<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
	
	<style>
	        /* Estilos generales */
	        body {
	            font-family: Arial, sans-serif;
	            background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
	            margin: 0;
	            padding: 0;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            height: 100vh;
	            text-align: center;
	        }

	        .producto-info {
	            background-color: #f8f9fa;
	            padding: 15px;
	            margin-bottom: 10px;
	            border-radius: 5px;
	            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	        }

	        /* Contenedor principal */
	        .container {
	            display: flex; /* Coloca los elementos en fila */
	            justify-content: center; /* Centra ambos elementos */
	            align-items: center; /* Centra verticalmente */
	            background-color: white;
	            padding: 30px;
	            border-radius: 8px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            width: 100%;
	            max-width: 900px; /* Aumenta el ancho del contenedor */
	            margin: 0 auto;
	        }

	        /* Estilo para el contenedor del formulario */
	        .form-container {
	            flex: 1; /* El formulario ocupa el 50% del espacio disponible */
	            display: flex;
	            flex-direction: column;
	            justify-content: center;
	            align-items: center;
	        }

	        /* Imagen de la tienda */
	        .tienda-container {
	            flex: 1; /* La imagen ocupa el 50% del espacio disponible */
	            display: flex;
	            justify-content: center;
	            margin-left: 70px;
	        }

	        .tienda-imagen {
	            width: 500px;
	            height: 550px;
	            object-fit: cover; /* Mantiene la proporción de la imagen */
	            max-width: 650px; /* Limita el tamaño máximo de la imagen */
	        }

	        /* Estilo para el formulario */
	        form {
	            width: 100%;
	            max-width: 350px;
	            margin: 0 auto;
	            padding: 20px;
	        }

	        #password-status {
	            font-size: 18px; /* Letra grande */
	            font-weight: bold; /* Negrita */
	            text-align: center;
	            margin-top: 10px;
	        }

	        /* Cuando la contraseña esté visible */
	        .password-visible {
	            color: green;
	        }

	        /* Cuando la contraseña esté oculta */
	        .password-hidden {
	            color: red;
	        }

	        /* Contenedor del campo de contraseña */
	        .password-container {
	            position: relative;
	            width: 100%;
	            display: flex;
	            align-items: center;  /* Centra el icono y el input verticalmente */
	        }

	        /* Estilo del campo de contraseña */
	        .password-container input {
	            width: 100%;
	            padding: 12px 40px 12px 12px;  /* Aumentamos el padding a la derecha para el icono */
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            box-sizing: border-box;
	            font-size: 16px;
	            height: 50px;  /* Aumenta la altura del input */
	            line-height: 24px;  /* Alinea el texto dentro del input */
	        }

	        /* Estilo del icono del ojo */
	        .toggle-password {
	            position: absolute;
	            right: 12px;  /* Ajustamos un poco el espacio a la derecha */
	            font-size: 20px;  /* Puedes cambiar el tamaño si deseas que el icono sea más grande */
	            color: #555;
	            cursor: pointer;
	            top: 50%;  /* Centra el icono verticalmente */
	            transform: translateY(-50%);  /* Ajuste fino para centrarlo perfectamente */
	            user-select: none;  /* Evita que el texto sea seleccionable */
	        }

	        /* Añadimos estilo para el enlace de registro */
	        .registro-texto {
	            margin-top: 20px;
	            font-size: 18px;
	        }

	        .registro-texto a {
	            color: #4CAF50;
	            text-decoration: none;
	            font-weight: bold;
	        }

	        .registro-texto a:hover {
	            text-decoration: underline;
	        }

	        /* Título */
	        h2 {
	            color: red;
	            font-weight: bold;
	            text-align: center;
	            margin-bottom: 20px; /* Espacio entre el título y el formulario */
	        }

	        /* Estilo para el párrafo de nombre de usuario */
	        .usuario {
	            color: red; /* Color rojo para el texto */
	            font-size: 18px;
	            font-weight: bold;
	            text-align: center;
	            text-decoration: underline; /* Subraya la palabra 'Usuario' */
	        }

	        /* Formularios */
	        form {
	            background-color: white;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            width: 100%;
	            margin-top: 20px;
	        }

	        /* Etiquetas */
	        label {
	            display: block;
	            font-size: 20px;
	            font-weight: bold;
	            margin-bottom: 8px;
	            color: rgb(0, 0, 0);
	        }

	        /* Ajuste de las imágenes dentro de las etiquetas */
	        label img {
	            width: 34px; /* Ajusta el tamaño de las imágenes */
	            height: 28px;
	            margin-right: 10px; /* Espacio entre la imagen y el texto */
	        }

	        /* Estilo de los inputs */
	        input[type="email"],
	        input[type="password"] {
	            width: 100%;
	            padding: 12px;
	            margin-bottom: 20px;
	            border: 1px solid #ccc;
	            border-radius: 4px;
	            box-sizing: border-box;
	        }

	        /* Estilo para los botones */
	        button[type="submit"] {
	            width: 100%; /* Ocupa el 100% del contenedor */
	            padding: 10px;
	            background-color: #4CAF50;
	            color: white;
	            font-weight: bold;
	            border: none;
	            border-radius: 4px;
	            font-size: 16px;
	            height: 50px;  /* Aumenta la altura del input */
	            cursor: pointer;
	        }

	        /* Hover para el botón de "Iniciar Sesion" */
	        button[type="submit"]:hover {
	            background-color: rgb(61, 139, 65);
	        }

	        /* Estilo para el botón "Volver atras" */
	        button.principal-btn {
	            background-color: #007BFF; /* Azul */
	            width: 100%;
	            padding: 10px;
	            border: none;
	            font-weight: bold;
	            border-radius: 4px;
	            font-size: 16px;
	            color: white;
	            cursor: pointer;
	            margin-top: 10px;
	        }

	        button.principal-btn:hover {
	            background-color: #0056b3; /* Azul más oscuro para hover */
	        }

	        /* Estilo */
	        .mensaje {
	            color: green;
	            font-size: 14px;
	            text-align: center;
	        }

	        /* Asegura que el formulario se centre correctamente */
	        #login-form {
	            width: 100%;
	            max-width: 350px;
	            margin: 0 auto;
	        }
	    </style>
</head>
<body>
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
