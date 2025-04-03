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
            opacity: 0; /* Inicialmente oculto */
            transform: translateY(-50px); /* Empuja el contenedor hacia arriba */
            transition: opacity 1s ease-in-out, transform 1s ease-in-out; /* Animación */
        }

        .form-container {
            flex: 1; /* El formulario ocupa el 50% del espacio disponible */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

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

        .password-visible {
            color: green;
        }

        .password-hidden {
            color: red;
        }

        .password-container {
            position: relative;
            width: 100%;
            display: flex;
            align-items: center;
        }

        .password-container input {
            width: 100%;
            padding: 12px 40px 12px 12px;  /* Aumentamos el padding a la derecha para el icono */
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            height: 50px;
            line-height: 24px;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            font-size: 20px;
            color: #555;
            cursor: pointer;
            top: 50%;
            transform: translateY(-50%);
            user-select: none;
        }

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

        h2 {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .usuario {
            color: red;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            text-decoration: underline;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin-top: 20px;
        }

        label {
            display: block;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 8px;
            color: rgb(0, 0, 0);
        }

        label img {
            width: 34px;
            height: 28px;
            margin-right: 10px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            height: 50px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out; /* Añadido para el zoom */
        }

        /* Efecto de zoom al pasar el mouse por encima */
        button[type="submit"]:hover {
            background-color: rgb(61, 139, 65);
            transform: scale(1.1); /* Aumenta el tamaño del botón */
        }

        button.principal-btn {
            background-color: #007BFF;
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
            background-color: #0056b3;
        }

        .mensaje {
            color: green;
            font-size: 14px;
            text-align: center;
        }

        #login-form {
            width: 100%;
            max-width: 350px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="container" id="login-container">
    <div class="form-container">
        <img src="imagenes/inicio_sesion.png" alt="inicio_sesion" class="inicio_sesion">
        <h2>INICIAR SESIÓN</h2>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

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

            <p id="password-status">Contraseña oculta</p>

            <br>
            <button type="submit">Iniciar Sesión</button>
            <br><br><br>
        </form>

        <br>

        <p class="registro-texto">¿No tienes cuenta? <a href="/registro">Regístrate aquí</a></p>
    </div>

    <div class="tienda-container">
        <img src="imagenes/tienda.png" alt="tienda" class="tienda-imagen">
    </div>
</div>

<script>
    window.onload = function() {
        var container = document.getElementById("login-container");
        setTimeout(function() {
            container.style.opacity = 1; /* Mostrar */
            container.style.transform = "translateY(0)"; /* Deslizar hacia abajo */
        }, 100);
    }

    function togglePassword() {
        var passwordField = document.getElementById("contrasena");
        var passwordStatus = document.getElementById("password-status");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            passwordStatus.textContent = "Contraseña visible";
            passwordStatus.className = "password-visible";
        } else {
            passwordField.type = "password";
            passwordStatus.textContent = "Contraseña oculta";
            passwordStatus.className = "password-hidden";
        }
    }
</script>
</body>
</html>
