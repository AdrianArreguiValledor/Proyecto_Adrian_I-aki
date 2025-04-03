<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Producto</title>
    <style>
        /* Estilos similares al formulario de edición */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            color: #333;
            line-height: 1.6;
            padding: 20px;
            margin: 0;
            animation: fadeIn 1s ease-in-out; /* Animación al cargar la página */
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            animation: slideIn 1s ease-in-out; /* Animación para el contenedor */
        }

        @keyframes slideIn {
            0% {
                transform: translateY(30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h2 {
            font-size: 2rem;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 1.1rem;
        }

        input, select {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: all 0.3s ease; /* Efecto al interactuar con los campos */
        }

        input:focus, select:focus {
            border-color: #4CAF50; /* Color verde cuando hay foco */
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.6); /* Sombra verde */
        }

        button {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05); /* Agrandar el botón al pasar el ratón */
        }

        /* Estilo para el botón "Volver a la lista de productos" */
        .back-button button {
            background-color: #007BFF;
            color: white;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .back-button button:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Efecto al pasar el ratón */
        }

        .back-button {
            text-align: center;
            margin-top: 20px;
        }

        .alert {
            background-color: #f44336;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Insertar Nuevo Producto</h2>

        <!-- Mostrar mensaje de éxito si existe -->
        <c:if test="${not empty mensaje}">
            <div class="alert">
                <p>${mensaje}</p>
            </div>
        </c:if>

        <!-- Formulario para insertar un producto -->
        <form action="/guardarProducto" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required />

            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" required />

            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" step="0.01" required min="0" />

            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" required min="0" />

            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria" required>
                <option value="portatil">Portátil</option>
                <option value="ordenador">Ordenador</option>
                <option value="periferico">Periférico</option>
            </select>

            <br>

            <button type="submit">Guardar Producto</button>
        </form>

        <br>
        <!-- Botón para volver a la lista de productos -->
        <div class="back-button">
            <form action="/administrador/prueba" method="get">
                <button type="submit">Volver a la lista de productos</button>
            </form>
        </div>
    </div>
</body>
</html>
