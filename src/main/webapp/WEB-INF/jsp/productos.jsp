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
		    font-family: Arial, sans-serif; /* Fuente base para el cuerpo */
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo con un gradiente de azul oscuro a azul claro */
		    color: #333; /* Color del texto */
		    line-height: 1.6; /* Espaciado entre líneas */
		    padding: 20px; /* Espaciado interno */
		    animation: fadeIn 1s ease-in-out; /* Animación de entrada de la página */
		}

		/* Animación para el fadeIn */
		@keyframes fadeIn {
		    0% {
		        opacity: 0; /* Comienza invisible */
		        transform: translateY(30px); /* Comienza desplazado hacia abajo */
		    }
		    100% {
		        opacity: 1; /* Se hace visible */
		        transform: translateY(0); /* Se posiciona en su lugar */
		    }
		}

		/* Contenedor principal */
		.container {
		    max-width: 1000px; /* Ancho máximo */
		    margin: 0 auto; /* Centrado horizontal */
		    background-color: #fff; /* Fondo blanco */
		    padding: 30px; /* Espaciado interno */
		    border-radius: 8px; /* Bordes redondeados */
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Sombra sutil */
		    animation: slideIn 1s ease-in-out; /* Animación de deslizamiento */
		}

		/* Animación para el slideIn */
		@keyframes slideIn {
		    0% {
		        transform: translateY(30px); /* Empieza más abajo */
		        opacity: 0; /* Empieza invisible */
		    }
		    100% {
		        transform: translateY(0); /* Finaliza en su lugar */
		        opacity: 1; /* Se vuelve visible */
		    }
		}

		/* Título */
		h2 {
		    font-size: 2rem; /* Tamaño de la fuente */
		    color: #333; /* Color del texto */
		    text-align: center; /* Centrado del título */
		    margin-bottom: 20px; /* Margen inferior */
		    border-bottom: 2px solid #4CAF50; /* Línea decorativa debajo del título */
		    padding-bottom: 10px; /* Espaciado entre el título y la línea */
		}

		/* Estilo de la tabla de productos */
		table {
		    width: 100%; /* Ocupa todo el ancho disponible */
		    border-collapse: collapse; /* Las celdas se fusionan */
		    margin-bottom: 20px; /* Margen inferior */
		    animation: fadeInTable 1s ease-in-out; /* Animación de entrada para la tabla */
		}

		/* Animación de la tabla */
		@keyframes fadeInTable {
		    0% {
		        opacity: 0; /* Comienza invisible */
		        transform: translateY(20px); /* Comienza desplazada hacia abajo */
		    }
		    100% {
		        opacity: 1; /* Se hace visible */
		        transform: translateY(0); /* Se coloca en su lugar */
		    }
		}

		/* Estilo de celdas de la tabla */
		table th, table td {
		    padding: 12px; /* Espaciado interno */
		    text-align: left; /* Alineación del texto */
		    border-bottom: 1px solid #ddd; /* Línea de separación */
		}

		/* Estilo de las cabeceras de la tabla */
		table th {
		    background-color: #4CAF50; /* Fondo verde */
		    color: white; /* Texto blanco */
		    font-weight: bold; /* Negrita */
		}

		/* Estilo de las celdas de la tabla */
		table td {
		    background-color: #f9f9f9; /* Fondo gris claro */
		}

		/* Estilo para filas pares de la tabla */
		table tr:nth-child(even) td {
		    background-color: #f1f1f1; /* Fondo gris más claro para filas pares */
		}

		/* Mensaje sin productos */
		p {
		    text-align: center; /* Centrado del texto */
		    font-size: 1.2rem; /* Tamaño de fuente */
		    color: #888; /* Color gris claro */
		}

		/* Contenedor de botones */
		.button-container {
		    display: flex; /* Usamos flexbox para organizar los botones */
		    align-items: center; /* Alineación vertical */
		    gap: 10px; /* Espacio entre los botones */
		}

		/* Asegurar que el formulario de editar no altere la alineación */
		.button-container form {
		    display: flex;
		    align-items: center;
		}

		/* Botón de Editar Producto */
		.edit-button {
		    background-color: #4CAF50; /* Fondo verde */
		    color: white; /* Texto blanco */
		    padding: 10px 20px; /* Espaciado interno */
		    font-weight: bold; /* Negrita */
		    border: none; /* Sin borde */
		    cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		    border-radius: 5px; /* Bordes redondeados */
		    font-size: 1rem; /* Tamaño de fuente */
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición de color y escala */
		    display: flex; /* Para alinear el contenido de los botones */
		    align-items: center; /* Centrado vertical del contenido */
		    justify-content: center; /* Centrado horizontal */
		    height: 40px; /* Altura fija para todos los botones */
		}

		/* Botón de Borrar Producto */
		.delete-button {
		    background-color: #f44336; /* Fondo rojo */
		    padding: 10px 20px; /* Espaciado interno */
		    border: none; /* Sin borde */
		    cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		    border-radius: 5px; /* Bordes redondeados */
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición de color y escala */
		    display: flex; /* Para alinear el contenido de los botones */
		    align-items: center; /* Centrado vertical */
		    justify-content: center; /* Centrado horizontal */
		    width: 60px; /* Ancho fijo */
		    height: 60px; /* Altura fija para el botón */
		}

		/* Estilo para el icono de borrar */
		.delete-icon {
		    width: 25px; /* Ancho del icono */
		    height: 25px; /* Alto del icono */
		}

		/* Animación al pasar el ratón sobre el botón de eliminar */
		.delete-button:hover {
		    background-color: #c62828; /* Rojo más oscuro */
		    transform: scale(1.1); /* Aumenta el tamaño */
		}

		/* Animación al pasar el ratón sobre el botón de editar */
		.edit-button:hover {
		    background-color: #45a049; /* Verde más oscuro */
		    transform: scale(1.1); /* Aumenta el tamaño */
		}

		/* Botón Volver */
		.btn-volver {
		    background-color: #007BFF; /* Fondo azul */
		    color: white; /* Texto blanco */
		    font-weight: bold; /* Negrita */
		    padding: 10px 20px; /* Espaciado interno */
		    border: none; /* Sin borde */
		    cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		    border-radius: 5px; /* Bordes redondeados */
		    font-size: 1rem; /* Tamaño de la fuente */
		    transition: background-color 0.3s ease; /* Transición de color */
		}

		/* Efecto hover para el botón de volver */
		.btn-volver:hover {
		    background-color: darkblue; /* Azul más oscuro */
		}

		/* Botón para insertar un nuevo producto */
		.insert-button {
		    background-color: #233dff; /* Fondo azul */
		    color: white; /* Texto blanco */
		    padding: 10px 20px; /* Espaciado interno */
		    border: none; /* Sin borde */
		    font-weight: bold; /* Negrita */
		    cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		    border-radius: 5px; /* Bordes redondeados */
		    font-size: 1rem; /* Tamaño de la fuente */
		    display: flex; /* Para alinear el contenido de los botones */
		    align-items: center; /* Centrado vertical */
		    justify-content: center; /* Centrado horizontal */
		    transition: background-color 0.3s ease; /* Transición de color */
		}

		/* Efecto hover para el botón de insertar */
		.insert-button:hover {
		    background-color: darkblue; /* Azul más oscuro */
		    transform: scale(1.05); /* Aumento de tamaño */
		}

		/* Estilo del icono dentro del botón de insertar */
		.insertar-icon {
		    width: 30px; /* Ancho del icono */
		    height: 25px; /* Alto del icono */
		    margin-right: 10px; /* Espacio entre el icono y el texto */
		}

		/* Formulario de volver al panel */
		form {
		    text-align: center; /* Centrado del formulario */
		    margin-top: 20px; /* Margen superior */
		}

		/* Responsividad: ajustes para pantallas pequeñas */
		@media (max-width: 768px) {
		    .container {
		        padding: 20px; /* Menos espaciado interno en pantallas pequeñas */
		    }

		    table th, table td {
		        padding: 10px; /* Menos espaciado en la tabla */
		    }

		    h2 {
		        font-size: 1.5rem; /* Reducción del tamaño del título */
		    }

		    .button-container {
		        flex-direction: column; /* Organiza los botones en columna */
		    }

		    .edit-button, .delete-button {
		        width: 100%; /* Los botones ocupan todo el ancho disponible */
		        padding: 12px; /* Mayor espaciado interno */
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
                                    <form action="/editarProducto/${producto.id_producto}" method="get">
                                        <button type="submit" class="edit-button">Editar</button>
                                    </form>

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
