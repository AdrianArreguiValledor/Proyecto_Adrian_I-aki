<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* Reset básico */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom, #1e3c72, #2a5298);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 480px;
            animation: fadeInUp 0.8s ease-out forwards;
            transform: translateY(40px);
            opacity: 0;
        }

        @keyframes fadeInUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            gap: 12px;
        }

        .header img {
            width: 40px;
            height: 40px;
        }

        .header h2 {
            color: #dc3545;
            font-size: 28px;
            font-weight: bold;
        }

        p.error,
        p.success {
            font-size: 15px;
            margin-bottom: 15px;
            text-align: center;
            font-weight: bold;
        }

        p.error {
            color: #d9534f;
        }

        p.success {
            color: #28a745;
        }

        label {
            font-weight: 600;
            font-size: 16px;
            display: flex;
            align-items: center;
            margin-bottom: 6px;
            color: #444;
        }

        label img {
            width: 28px;
            height: 24px;
            margin-right: 8px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select#rol {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: border-color 0.3s;
        }

        input:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        select#rol {
            background-color: #f9f9f9;
            cursor: pointer;
        }

        .password-container {
            position: relative;
        }

        .password-container input {
            padding-right: 40px;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            font-size: 18px;
            color: #666;
            cursor: pointer;
            user-select: none;
        }

        #password-status,
        #password-strength,
        #email-message {
            font-size: 14px;
            font-weight: 500;
            text-align: left;
            margin-top: -15px;
            margin-bottom: 15px;
        }

        .password-visible {
            color: #28a745;
        }

        .password-hidden {
            color: #dc3545;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button.registro-btn {
            background-color: #28a745;
            color: white;
        }

        button.registro-btn:hover {
            background-color: #218838;
            transform: scale(1.03);
        }

        button.volver-btn {
            background-color: #007bff;
            color: white;
            margin-top: 12px;
        }

        button.volver-btn:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        form {
            width: 100%;
            max-width: 450px;
            margin: 0 auto;
        }

        /* RESPONSIVE */
        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }

            .header {
                flex-direction: column;
                gap: 10px;
            }

            .header h2 {
                font-size: 22px;
                text-align: center;
            }

            label img {
                width: 24px;
                height: 20px;
            }

            input, select, button {
                font-size: 14px;
                padding: 10px;
            }

            .toggle-password {
                right: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="imagenes/registro.png" alt="registro" class="registro">
            <h2>REGISTRO</h2>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <% if (request.getAttribute("mensaje") != null) { %>
            <p class="success"><%= request.getAttribute("mensaje") %></p>
        <% } %>

        <form id="registro-form" action="/formularioRegistro" method="post">
            <label for="nombre"><img src="imagenes/usuario.png" alt="usuario">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>

            <label for="apellido"><img src="imagenes/usuario.png" alt="usuario">Apellidos:</label>
            <input type="text" id="apellido" name="apellido" required><br><br>

            <label for="email"><img src="imagenes/correo.png" alt="correo">Email:</label>
            <input type="email" id="email" name="email" required oninput="validateEmail()"><br><br>
            <p id="email-message"></p>

            <label for="contrasena"><img src="imagenes/contrasena.png" alt="contrasena">Contraseña:</label>
            <div class="password-container">
                <input type="password" id="contrasena" name="contrasena" required oninput="checkPasswordStrength()">
                <span class="toggle-password" onclick="togglePassword()">👁️</span>
            </div>
            <p id="password-status" class="password-status">Contraseña oculta</p>
            <p id="password-strength"></p><br>

            <label for="rol"><img src="imagenes/rol.png" alt="rol">Rol:</label>
            <select id="rol" name="rol" required>
                <option value="usuario">Usuario</option>
                <option value="Administrador">Administrador</option>
            </select>
            <br><br>

            <button type="submit" class="registro-btn">Registrarse</button>
        </form>

        <br>

        <form action="/index" method="get">
            <button type="submit" class="volver-btn">Volver al Login</button>
        </form>
    </div>

    <script>
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

        function validateEmail() {
            var email = document.getElementById("email").value;
            var emailMessage = document.getElementById("email-message");
            var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (regex.test(email)) {
                emailMessage.textContent = "Email válido";
                emailMessage.style.color = "green";
            } else {
                emailMessage.textContent = "Email no válido";
                emailMessage.style.color = "red";
            }
        }

        function checkPasswordStrength() {
            var password = document.getElementById("contrasena").value;
            var strengthMessage = document.getElementById("password-strength");
            var score = 0;

            if (password.length >= 8) score++;
            if (/[A-Z]/.test(password)) score++;
            if (/[a-z]/.test(password)) score++;
            if (/\d/.test(password)) score++;
            if (/[^A-Za-z0-9]/.test(password)) score++;

            if (score < 2) {
                strengthMessage.textContent = "Contraseña débil";
                strengthMessage.style.color = "red";
            } else if (score < 4) {
                strengthMessage.textContent = "Contraseña moderada";
                strengthMessage.style.color = "orange";
            } else {
                strengthMessage.textContent = "Contraseña fuerte";
                strengthMessage.style.color = "green";
            }
        }
    </script>
</body>
</html>
