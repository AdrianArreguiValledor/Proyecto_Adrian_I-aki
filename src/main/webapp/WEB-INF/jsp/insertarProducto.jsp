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
            background: #f4f4f9;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
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
        }

        button {
            background-color: #4CAF50;
            color: white;
			font-weight:bold;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Estilo para el botón "Volver a la lista de productos" */
        .back-button button {
            background-color: #007BFF; /* Color solicitado */
            color: white;
			font-weight:bold;
        }

        .back-button button:hover {
            background-color: #0056b3; /* Color al pasar el ratón */
        }

        .back-button {
            text-align: center;
            margin-top: 20px;
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
            <input type="number" id="precio" name="precio" step="0.01" required />

            <label for="stock">Stock:</label>
            <input type="number" id="stock" name="stock" required />

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
