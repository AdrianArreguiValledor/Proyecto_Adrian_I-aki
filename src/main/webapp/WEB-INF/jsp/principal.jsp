<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pagina JSP Sencilla</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
            animation: fadeIn 1s ease-out;
        }

        /* Contenedor principal */
        .container {
            background-color: rgb(85, 85, 85); /* Fondo negro */
            color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease;
            max-width: 800px;
            margin: auto;
            opacity: 0;
            animation: slideIn 1s forwards;
        }

        /* Efecto al pasar el ratón por encima */
        .container:hover {
            background-color: #333;
        }

        /* Titulo principal */
        h1 {
            font-weight: bold;
            color: #fff;
            margin-top: 0;
            padding-top: 20px;
            font-size: 35px;
        }

        /* Estilo para los mensajes */
        p {
            font-weight: normal;
            color: #fff;
        }

        /* Estilo para los botones */
        button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            margin-top: 20px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        button:hover {
            transform: scale(1.1);
        }

        .volver-btn {
            background-color: #007BFF;
            color: white;
        }

        .volver-btn:hover {
            background-color: #0056b3;
        }

        .administrador-btn {
            background-color: red;
            color: white;
        }

        .administrador-btn:hover {
            background-color: rgb(193, 2, 46);
        }

        /* Estilo para el contenedor con scroll */
        .scroll-container {
            overflow-y: scroll;
            height: 400px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: red;
            margin-top: 20px;
            color: #333;
            max-width: 95%;
            animation: scrollIn 1s ease-out;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .scroll-container:hover {
            transform: scale(1.05);
            background-color: darkred; /* Cambio de color al pasar el ratón */
        }

        /* Estilo para los párrafos de error */
        .error {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 20px;
        }

        /* Estilo para los elementos de la pagina de usuario */
        h2 {
            font-size: 30px;
            color: #fff;
            font-weight: bold;
            margin-top: 20px;
        }

        strong {
            color: #ffeb3b;
        }

        /* Animaciones */
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

        @keyframes scrollIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenido a tu primera pagina JSP!</h1>
        <p>Esta es una pagina JSP simple.</p>
        <p>El tiempo de ejecucion de la pagina JSP es: <%= new java.util.Date() %></p>

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

        <c:if test="${sessionScope.rol == 'Administrador'}">
            <form action="/administrador" method="get">
                <button type="submit" class="administrador-btn">Ir al Administrador</button>
            </form>
            <br><br>
        </c:if>

        <form action="/index" method="get">
            <button type="submit" class="volver-btn">Volver al Login</button>
        </form>

        <br><br>

        <div class="scroll-container">
            <h2>Informacion del Usuario</h2>
            <p><strong>Nombre:</strong> Emily Johnson</p>
            <p><strong>Nombre de Soltera:</strong> Smith</p>
            <p><strong>Edad:</strong> 28</p>
            <p><strong>Genero:</strong> Femenino</p>
            <p><strong>Email:</strong> emily.johnson@x.dummyjson.com</p>
            <p><strong>Telefono:</strong> +81 965-431-3024</p>
            <p><strong>Usuario:</strong> emilys</p>
            <p><strong>Fecha de Nacimiento:</strong> 30 de mayo de 1996</p>
            <p><strong>Grupo Sanguineo:</strong> O-</p>
            <p><strong>Altura:</strong> 193.24 cm</p>
            <p><strong>Peso:</strong> 63.16 kg</p>
            <p><strong>Color de ojos:</strong> Verde</p>
            <p><strong>Cabello:</strong> Marron, Rizado</p>
            <p><strong>Direccion:</strong> 626 Main Street, Phoenix, Mississippi, 29112</p>
            <p><strong>Universidad:</strong> University of Wisconsin--Madison</p>
            <p><strong>Trabajo:</strong> Sales Manager en Dooley, Kozey and Cronin</p>
            <p><strong>Departamento:</strong> Ingenieria</p>
            <p><strong>Tarjeta Bancaria:</strong> 9289 **** **** 1815 (Elo)</p>
            <p><strong>Criptomoneda:</strong> Bitcoin (Ethereum ERC20)</p>
            <p><strong>Rol:</strong> Administrador</p>
        </div>
    </div>

    <script>
        // Añadir interactividad al cargar la pagina
        window.onload = function() {
            // Efecto de animacion al cargar la pagina
            const container = document.querySelector('.container');
            container.style.animation = 'slideIn 1s forwards';

            // Mostrar mensaje de bienvenida con nombre si esta presente
            const nameParam = new URLSearchParams(window.location.search).get('name');
            if (nameParam) {
                document.querySelector('h1').textContent = `Bienvenido, ${nameParam}!`;
            }
        };
    </script>
</body>
</html>
