<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Productos</title>
	<style>
	    /* Reset global */
	    * {
	        margin: 0;
	        padding: 0;
	        box-sizing: border-box;
	    }

	    /* Fondo general */
	    body {
	        font-family: Arial, sans-serif;
	        background: linear-gradient(to bottom, #003366, #66ccff);
	        color: #333;
	        line-height: 1.6;
	        padding: 20px;
	    }

	    /* Contenedor principal */
	    .container {
	        max-width: 1000px;
	        margin: 0 auto;
	        background-color: #fff;
	        padding: 30px;
	        border-radius: 8px;
	        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	    }

	    /* Título */
	    h2 {
	        font-size: 2rem;
	        color: #333;
	        text-align: center;
	        margin-bottom: 20px;
	        border-bottom: 2px solid #4CAF50;
	        padding-bottom: 10px;
	    }

	    /* Tabla de productos */
	    table {
	        width: 100%;
	        border-collapse: collapse;
	        margin-bottom: 20px;
	    }

	    table th, table td {
	        padding: 12px;
	        text-align: left;
	        border-bottom: 1px solid #ddd;
	    }

	    table th {
	        background-color: #4CAF50;
	        color: white;
	        font-weight: bold;
	    }

	    table td {
	        background-color: #f9f9f9;
	    }

	    table tr:nth-child(even) td {
	        background-color: #f1f1f1;
	    }

	    /* Mensaje sin productos */
	    p {
	        text-align: center;
	        font-size: 1.2rem;
	        color: #888;
	    }

	    /* Contenedor de botones */
	    .button-container {
	        display: flex;
	        gap: 10px;
	    }

	    /* Botón de Editar */
	    .edit-button {
	        background-color: #4CAF50;
	        color: white;
	        padding: 12px 20px;
			font-weight:bold;
	        border: none;
	        cursor: pointer;
	        border-radius: 5px;
	        font-size: 1rem;
	        transition: background-color 0.3s ease;
	        display: flex;
	        align-items: center;
	        justify-content: center;
	    }

	    .edit-button:hover {
	        background-color: #45a049;
	    }

	    /* Botón de Borrar */
	    .delete-button {
	        background-color: #f44336;
	        padding: 10px 20px;
	        border: none;
	        cursor: pointer;
	        border-radius: 5px;
	        transition: background-color 0.3s ease;
	        display: flex;
	        align-items: center;
	        justify-content: center;
	    }

	    .delete-button:hover {
	        background-color: #c62828;
	    }

	    .delete-icon {
	        width: 20px; /* Tamaño del icono ajustado al botón */
	        height: 20px;
	    }

	    /* Botón Volver */
	    .btn-volver {
	        background-color: #007BFF;
	        color: white;
			font-weight:bold;
	        padding: 10px 20px;
	        border: none;
	        cursor: pointer;
	        border-radius: 5px;
	        font-size: 1rem;
	        transition: background-color 0.3s ease;
	    }

	    .btn-volver:hover {
	        background-color: darkblue;
	    }

		
		.insert-button {
		    background-color: #233dff; /* Azul */
		    color: white;
		    padding: 10px 20px;
		    border: none;
			font-weight:bold;
		    cursor: pointer;
		    border-radius: 5px;
		    font-size: 1rem;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    transition: background-color 0.3s ease;
		}

		.insert-button:hover {
		    background-color: darkblue; /* Azul más oscuro */
		}

		.insertar-icon {
		    width: 30px; 
		    height: 25px; 
		    margin-right: 10px; /* Espacio entre la imagen y el texto */
		}

		
		
	    /* Formulario de volver al panel */
	    form {
	        text-align: center;
	        margin-top: 20px;
	    }

	    /* Responsividad */
	    @media (max-width: 768px) {
	        .container {
	            padding: 20px;
	        }

	        table th, table td {
	            padding: 10px;
	        }

	        h2 {
	            font-size: 1.5rem;
	        }

	        .button-container {
	            flex-direction: column;
	        }

	        .edit-button, .delete-button {
	            width: 100%;
	            padding: 12px;
	        }
	    }
	</style>

    <script>
        function confirmarBorrado(productId) {
            if (confirm("¿Estás seguro de que quieres borrar este producto?")) {
                window.location.href = "/borrarProducto/" + productId;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Lista de Productos</h2>

		
		<!-- Botón para insertar un nuevo producto -->
		<div style="text-align: center; margin-bottom: 20px;">
		    <a href="/insertarProducto" style="text-decoration: none;">
		        <button class="insert-button">
		            <img src="<c:url value='/imagenes/insertar.png' />" alt="Insertar" class="insertar-icon">
		            Insertar Producto
		        </button>
		    </a>
		</div>
		
		
        <!-- Mostrar mensaje de éxito o error si existe -->
        <c:if test="${not empty mensaje}">
            <div class="alert">
                <p>${mensaje}</p>
            </div>
        </c:if>

        <c:choose>
            <c:when test="${not empty productos}">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Categoría</th>
                        <th>Acciones</th>
                    </tr>
                    <c:forEach var="producto" items="${productos}">
                        <tr>
                            <td>${producto.id_producto}</td>
                            <td>${producto.nombre}</td>
                            <td>${producto.descripcion}</td>
                            <td>${producto.precio} $</td>
                            <td>${producto.stock} unidades</td>
                            <td>${producto.categoria}</td>
                            <td>
                                <div class="button-container">
                                    <!-- Botón de Editar Producto -->
                                    <a href="/editarProducto/${producto.id_producto}">
                                        <button class="edit-button">Editar</button>
                                    </a>

									<!-- Botón de Borrar Producto -->
									<button class="delete-button" onclick="confirmarBorrado(${producto.id_producto})">
										<img src="<c:url value='/imagenes/papelera.png' />" alt="Borrar" class="delete-icon">
									</button>

                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>No hay productos disponibles.</p>
            </c:otherwise>
        </c:choose>

        <br>
        <!-- Botón para volver al panel de administrador -->
        <form action="/administrador" method="get">
            <button type="submit" class="btn-volver">Volver al Panel de Administrador</button>
        </form>
    </div>
</body>
</html>
