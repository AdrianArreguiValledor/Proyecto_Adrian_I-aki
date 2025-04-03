<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Producto</title>
    <style>
		/* Estilos CSS similares a los de la lista de productos */
		body {
		    font-family: Arial, sans-serif; /* Fuente para el texto */
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo degradado de azul oscuro a azul claro */
		    color: #333; /* Color del texto en gris oscuro */
		    line-height: 1.6; /* Altura de línea para mejorar la legibilidad */
		    padding: 20px; /* Relleno alrededor del contenido */
		    margin: 0; /* Elimina márgenes predeterminados */
		    animation: fadeIn 1s ease-in-out; /* Animación de entrada */
		}

		/* Animación de fade-in para la entrada de la página */
		@keyframes fadeIn {
		    0% {
		        opacity: 0; /* Inicia con opacidad 0 */
		        transform: translateY(30px); /* Empuja el contenido hacia abajo */
		    }
		    100% {
		        opacity: 1; /* Termina con opacidad 1 */
		        transform: translateY(0); /* El contenido vuelve a su posición original */
		    }
		}

		/* Contenedor principal para la forma de edición */
		.container {
		    max-width: 600px; /* Establece un ancho máximo */
		    margin: 0 auto; /* Centra el contenedor horizontalmente */
		    background-color: #fff; /* Fondo blanco para el contenedor */
		    padding: 30px; /* Espaciado interno */
		    border-radius: 8px; /* Bordes redondeados */
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Sombra sutil */
		    animation: slideIn 1s ease-in-out; /* Animación de deslizamiento para el contenedor */
		}

		/* Animación de deslizamiento para el contenedor */
		@keyframes slideIn {
		    0% {
		        transform: translateY(30px); /* Inicia desde abajo */
		        opacity: 0; /* Inicia con opacidad 0 */
		    }
		    100% {
		        transform: translateY(0); /* Vuelve a su posición original */
		        opacity: 1; /* Termina con opacidad 1 */
		    }
		}

		/* Estilo para el título */
		h2 {
		    font-size: 2rem; /* Tamaño de fuente grande */
		    color: #333; /* Color gris oscuro */
		    text-align: center; /* Centra el título */
		    margin-bottom: 20px; /* Espacio debajo del título */
		    border-bottom: 2px solid #4CAF50; /* Línea verde debajo del título */
		    padding-bottom: 10px; /* Espacio adicional debajo de la línea */
		}

		/* Estilo del formulario */
		form {
		    display: flex; /* Utiliza Flexbox para organizar los elementos */
		    flex-direction: column; /* Organiza los elementos de arriba hacia abajo */
		    gap: 15px; /* Espacio entre los elementos del formulario */
		}

		/* Estilo para las etiquetas de los campos */
		label {
		    font-weight: bold; /* Negrita en las etiquetas */
		    font-size: 1.1rem; /* Tamaño de fuente ligeramente mayor */
		}

		/* Estilo para los campos de entrada y selección */
		input, select {
		    padding: 10px; /* Espaciado interno */
		    font-size: 1rem; /* Tamaño de fuente */
		    border: 1px solid #ccc; /* Borde gris claro */
		    border-radius: 5px; /* Bordes redondeados */
		    transition: all 0.3s ease; /* Transición suave al interactuar con los campos */
		}

		/* Estilo para los campos de entrada y selección con foco */
		input:focus, select:focus {
		    border-color: #4CAF50; /* Color verde en el borde cuando hay foco */
		    box-shadow: 0 0 5px rgba(76, 175, 80, 0.6); /* Sombra verde cuando el campo tiene foco */
		}

		/* Estilo para los botones */
		button {
		    background-color: #4CAF50; /* Fondo verde */
		    color: white; /* Texto blanco */
		    padding: 10px; /* Espaciado interno */
		    font-weight: bold; /* Negrita en el texto del botón */
		    border: none; /* Elimina el borde por defecto */
		    cursor: pointer; /* Muestra el cursor de mano al pasar por encima */
		    border-radius: 5px; /* Bordes redondeados */
		    font-size: 1rem; /* Tamaño de fuente */
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición suave en el cambio de color y tamaño */
		}

		/* Efecto de hover para los botones */
		button:hover {
		    background-color: #45a049; /* Cambia a un verde más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Agranda el botón */
		}

		/* Estilo para el botón "Volver a la lista de productos" */
		button.btn-volver {
		    background-color: #f44336; /* Fondo rojo */
		    color: white; /* Texto blanco */
		    padding: 10px; /* Espaciado interno */
		    font-weight: bold; /* Negrita en el texto */
		    border: none; /* Elimina el borde por defecto */
		    cursor: pointer; /* Muestra el cursor de mano al pasar por encima */
		    border-radius: 5px; /* Bordes redondeados */
		    font-size: 1rem; /* Tamaño de fuente */
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición suave en el cambio de color y tamaño */
		    width: 100%; /* Ocupa el 100% del ancho disponible */
		}

		/* Efecto de hover para el botón "Volver a la lista de productos" */
		button.btn-volver:hover {
		    background-color: #c62828; /* Cambia a un rojo más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Agranda el botón */
		}

		/* Estilo para el botón de retroceso */
		.back-button {
		    text-align: center; /* Centra el botón */
		    margin-top: 20px; /* Espacio superior */
		}

		/* Estilo para los mensajes de alerta */
		.alert {
		    background-color: #f44336; /* Fondo rojo */
		    color: white; /* Texto blanco */
		    padding: 10px; /* Espaciado interno */
		    border-radius: 5px; /* Bordes redondeados */
		    margin-bottom: 20px; /* Espacio debajo de la alerta */
		    text-align: center; /* Centra el texto */
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
        <div class="back-button">
            <form action="/administrador/prueba" method="get">
                <button type="submit" class="btn-volver">Volver a la lista de productos</button>
            </form>
        </div>
    </div>
</body>
</html>
