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
        }

        /* Título */
        h2 {
            color: black;
            font-weight: bold;
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
        }

		
		/* Botón "Ver Clientes" */
		.cliente-btn{
			background-color: rgb(100, 232, 100); /* Fondo azul */
			    color: white; /* Texto blanco */
				font-weight: bold;
			    padding: 10px 20px; /* Espaciado alrededor del texto */
			    border: none; /* Sin borde */
			    border-radius: 5px; /* Bordes redondeados */
			    cursor: pointer; /* Aparece como puntero */
			    font-size: 16px;
			    transition: background-color 0.3s ease; /* Transición suave */
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
			 <button type="submit" class="cliente-btn">Ver Clientes</button>
		</form>
		<br>
		
		
        <!-- Botón para ver productos -->
        <form action="/administrador/prueba" method="get">
            <button type="submit" class="btn-ver-productos">Ver Productos</button>
        </form>
		<br><br>
		
		<!-- Botón para ver volver atras -->
        <form action="/principal" method="get">
            <button type="submit" class="btn-volver">Volver atrás</button>
        </form>
    </div>
</body>
</html>
