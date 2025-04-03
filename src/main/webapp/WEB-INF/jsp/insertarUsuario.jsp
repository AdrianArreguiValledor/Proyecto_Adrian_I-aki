<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Usuario</title>
    <style>
        /* Estilo general de la página */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #004080, #66ccff); /* Azul degradado */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
        }

        /* Contenedor del formulario */
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 50%;
            max-width: 500px;
            text-align: center;
            opacity: 0;
            animation: slideIn 0.8s forwards 0.5s;
        }

        /* Título del formulario */
        .form-container h1 {
            color: #003366;
            font-size: 24px;
            margin-bottom: 20px;
            animation: fadeInTitle 1s ease-in-out;
        }

        /* Campos de entrada y select */
        .form-container input, .form-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
            opacity: 0;
            animation: fadeInInput 1s ease-in-out forwards;
        }

        /* Estilo para el botón de Guardar Usuario */
        .form-container button {
            padding: 12px;
            background-color: #28a745; /* Verde */
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            width: 100%;
            opacity: 0;
            animation: fadeInButton 1s ease-in-out forwards 1s;
        }

        /* Efecto de zoom en el botón de Guardar Usuario */
        .form-container button:hover {
            background-color: #218838;
            transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
        }

        /* Botón de Volver */
        .back-button {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            text-align: center;
            background-color: #007bff; /* Azul */
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s ease;
            border: none;
            cursor: pointer;
            opacity: 0;
            animation: fadeInBackButton 1s ease-in-out forwards 1.2s;
        }

        /* Efecto de zoom en el botón de Volver */
        .back-button:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
        }

        /* Etiquetas */
        .form-container label {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            display: block;
            margin-top: 15px;
            text-align: left;
        }

        /* Animaciones */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInTitle {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            0% {
                transform: translateY(-30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInInput {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInButton {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInBackButton {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

    </style>
</head>
<body>
    <div class="form-container">
        <h1>Insertar Nuevo Usuario</h1>
        <form action="/guardar" method="post">
            <label for="firstName">Nombre:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Apellido:</label>
            <input type="text" id="lastName" name="lastName" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Telefono:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="age">Edad:</label>
            <input type="number" id="age" name="age" required min="0">

            <label for="gender">Genero:</label>
            <select id="gender" name="gender" required>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                <option value="Otro">Otro</option>
            </select>

            <label for="role">Rol:</label>
            <select id="role" name="role" required>
                <option value="Admin">Admin</option>
                <option value="Usuario">Usuario</option>
            </select>
            <br><br>
            <button type="submit">Guardar Usuario</button>
            <br><br>
            <a href="/cliente" class="back-button">Volver Atras</a>
        </form>
    </div>
</body>
</html>
