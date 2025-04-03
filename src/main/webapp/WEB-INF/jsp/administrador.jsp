<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Administrador</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-out;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 550px;
            height: 400px;
            max-width: 700px;
            text-align: center;
            opacity: 0;
            animation: slideIn 1s forwards;
        }

        /* Título */
        h2 {
            color: black;
            font-weight: bold;
            font-size: 30px;
        }

        /* Estilo para el nombre de usuario */
        .usuario {
            color: red; /* Color rojo */
            font-size: 18px;
            font-weight: bold;
            text-decoration: underline; /* Subrayado */
            margin-top: 20px;
        }

        /* Estilo para el mensaje */
        p {
            font-size: 16px;
            color: #333;
        }

        /* Estilos para los botones */
        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
            font-weight: bold;
            transition: transform 0.3s ease-in-out;
        }

        button:hover {
            transform: scale(1.05); /* Efecto de escala al pasar el ratón */
        }

        /* Botón "Ver Clientes" */
        .cliente-btn {
            background-color: rgb(100, 232, 100); /* Fondo verde */
            color: white; /* Texto blanco */
            font-weight: bold;
        }

        .cliente-btn:hover {
            background-color: rgb(26, 170, 26); /* Cambia el color a un tono más oscuro al pasar el ratón */
        }

        /* Botón "Ver Productos" */
        .btn-ver-productos {
            background-color: red;
            color: white;
        }

        .btn-ver-productos:hover {
            background-color: darkred;
        }

        /* Botón "Volver atrás" */
        .btn-volver {
            background-color: #007BFF;
            color: white;
        }

        .btn-volver:hover {
            background-color: darkblue;
        }

        /* Animación de entrada */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Panel de Administrador</h2>
        <br>

        <p class="usuario"><strong>Usuario:</strong> ${usuario}</p>
        <p>${mensaje}</p>
        <br>

        <!-- Botón para ver clientes -->
        <form action="/cliente" method="get">
            <button type="submit" class="cliente-btn" onclick="return confirmAction('clientes')">Ver Clientes</button>
        </form>
        <br>

        <!-- Botón para ver productos -->
        <form action="/administrador/prueba" method="get">
            <button type="submit" class="btn-ver-productos" onclick="return confirmAction('productos')">Ver Productos</button>
        </form>
        <br><br>

        <!-- Botón para volver atrás -->
        <form action="/principal" method="get">
            <button type="submit" class="btn-volver" onclick="return confirmAction('volver')">Volver atrás</button>
        </form>
    </div>

    <script>
        // Función para confirmar la acción antes de navegar
        function confirmAction(action) {
            let message = '';

            switch(action) {
                case 'clientes':
                    message = '¿Estás seguro de que deseas ver los clientes?';
                    break;
                case 'productos':
                    message = '¿Estás seguro de que deseas ver los productos?';
                    break;
                case 'volver':
                    message = '¿Estás seguro de que deseas volver atrás?';
                    break;
            }

            return confirm(message); // Muestra un cuadro de confirmación
        }
    </script>
</body>
</html>
