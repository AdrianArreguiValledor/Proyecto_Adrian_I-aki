<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Producto</title>
    <style>
        /* Estilos CSS similares a los de la lista de productos */
        body {
            font-family: Arial, sans-serif;
             background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
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
			font-weight:bold;
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
            padding: 10px;
			font-weight:bold;
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
		button.btn-volver {
		    background-color: #f44336; /* Rojo */
		    color: white;
		    padding: 10px;
		    font-weight: bold;
		    border: none;
		    cursor: pointer;
		    border-radius: 5px;
		    font-size: 1rem;
		    transition: background-color 0.3s ease;
		    width: 100%;
		}

		button.btn-volver:hover {
		    background-color: #c62828; /* Rojo más oscuro en hover */
		}
		
    </style>
</head>
<body>
    <div class="container">
        <h2>Editar Producto</h2>
        
        <!-- Mostrar mensaje de éxito o error si existe -->
        <c:if test="${not empty mensaje}">
            <div class="alert">
                <p>${mensaje}</p>
            </div>
        </c:if>

		<br>
		
        <!-- Formulario para editar el producto -->
        <form action="/actualizarProducto" method="post">
            <input type="hidden" name="id_producto" value="${producto.id_producto}" />

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="${producto.nombre}" required />

			
            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" value="${producto.descripcion}" required />

			
			<label for="precio">Precio:</label>
			<input type="number" id="precio" name="precio" step="0.01" value="${producto.precio}" min="0" required />

			<label for="stock">Stock:</label>
			<input type="number" id="stock" name="stock" value="${producto.stock}" min="0" required />


			
            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria" required>
                <option value="portatil" ${producto.categoria == 'portatil' ? 'selected' : ''}>Portátil</option>
                <option value="ordenador" ${producto.categoria == 'ordenador' ? 'selected' : ''}>Ordenador</option>
                <option value="periferico" ${producto.categoria == 'periferico' ? 'selected' : ''}>Periférico</option>
            </select>

			<br>
			
            <button type="submit">Actualizar Producto</button>
        </form>

		<br>
		
        <!-- Botón para volver a la lista de productos -->
		<!-- Botón para volver a la lista de productos -->
		<div class="back-button">
		    <form action="/administrador/prueba" method="get">
		        <button type="submit" class="btn-volver">Volver a la lista de productos</button>
		    </form>
		</div>
    </div>
</body>
</html>
