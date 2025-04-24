<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Producto</title>
    <style>
		/* Estilos generales para el body */
		    body {
		        font-family: Arial, sans-serif; /* Establece la fuente para todo el contenido */
		        background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo de gradiente, de azul oscuro a azul claro */
		        background-size: cover; /* Asegura que el fondo ocupe toda la pantalla */
		        background-attachment: fixed; /* Hace que el fondo no se desplace al hacer scroll */
		        color: #333; /* Color del texto en gris oscuro */
		        line-height: 1.6; /* Espaciado entre líneas */
		        padding: 20px; /* Espaciado alrededor del contenido */
		        margin: 0; /* Elimina márgenes */
		        animation: fadeIn 1s ease-in-out; /* Animación para hacer que el contenido aparezca suavemente */
		        min-height: 100vh; /* Asegura que el body ocupe toda la altura de la pantalla */
				overflow-y: auto;
				display: flex; /* Usamos Flexbox para centrar el contenido */
		        justify-content: center; /* Centra el contenido horizontalmente */
		        align-items: center; /* Centra el contenido verticalmente */
		    }

		    /* Animación para hacer que la página aparezca con efecto de desvanecimiento y desplazamiento */
		    @keyframes fadeIn {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		            transform: translateY(30px); /* Empuja el contenido hacia abajo */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		            transform: translateY(0); /* Vuelve a la posición original */
		        }
		    }

		    /* Estilo del contenedor principal */
		    .container {
		        width: 100%; /* Hace que el contenedor ocupe el 100% del ancho disponible */
		        max-width: 600px; /* Ancho máximo de 600px */
		        margin: 0 auto; /* Centra el contenedor horizontalmente */
		        background-color: #fff; /* Fondo blanco para el contenedor */
		        padding: 30px; /* Espaciado interno */
		        border-radius: 8px; /* Bordes redondeados */
		        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Sombra ligera alrededor */
		        animation: slideIn 1s ease-in-out; /* Animación de deslizamiento para el contenedor */
		    }

		    /* Animación para hacer que el contenedor se deslice hacia arriba */
		    @keyframes slideIn {
		        0% {
		            transform: translateY(30px); /* Empuja el contenedor hacia abajo */
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            transform: translateY(0); /* Vuelve a la posición original */
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    /* Estilo del título */
		    h2 {
		        font-size: 2rem; /* Tamaño grande para el título */
		        color: #333; /* Color gris oscuro */
		        text-align: center; /* Centrado del texto */
		        margin-bottom: 20px; /* Espacio debajo del título */
		        border-bottom: 2px solid #4CAF50; /* Línea verde debajo del título */
		        padding-bottom: 10px; /* Espaciado debajo de la línea */
		    }

		    /* Estilo del formulario */
		    form {
		        display: flex; /* Usamos Flexbox para organizar los elementos */
		        flex-direction: column; /* Los elementos se apilan verticalmente */
		        gap: 15px; /* Espacio entre los elementos */
		    }

		    /* Estilo de las etiquetas */
		    label {
				font-weight:bold;
		        font-size: 1.1rem; /* Tamaño de fuente ligeramente mayor para las etiquetas */
		    }

		    /* Estilo de los campos de texto y select */
		    input, select {
		        padding: 10px; /* Relleno interno para los campos */
		        font-size: 1rem; /* Tamaño de fuente */
		        border: 1px solid #ccc; /* Borde gris claro */
		        border-radius: 5px; /* Bordes redondeados */
		        transition: all 0.3s ease; /* Efecto de transición para todos los cambios */
		    }

		    /* Estilo cuando un campo o select recibe el foco */
		    input:focus, select:focus {
		        border-color: #4CAF50; /* Borde verde cuando está enfocado */
		        box-shadow: 0 0 5px rgba(76, 175, 80, 0.6); /* Sombra verde alrededor del campo enfocado */
		    }

		    /* Estilo del botón de enviar */
		    button {
		        background-color: #4CAF50; /* Fondo verde */
		        color: white; /* Texto blanco */
		        font-weight: bold; /* Texto en negrita */
		        padding: 10px; /* Espaciado interno */
		        border: none; /* Sin borde */
		        cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		        border-radius: 5px; /* Bordes redondeados */
		        font-size: 1rem; /* Tamaño de fuente */
		        transition: background-color 0.3s ease, transform 0.3s ease; /* Efectos de transición para el fondo y tamaño */
		    }

		    /* Estilo al pasar el ratón sobre el botón */
		    button:hover {
		        background-color: #45a049; /* Cambia el fondo a un verde más oscuro */
		        transform: scale(1.05); /* Agranda ligeramente el botón */
		    }

		    /* Estilo para el botón "Volver a la lista de productos" */
		    .back-button button {
		        background-color: #007BFF; /* Fondo azul */
		        color: white; /* Texto blanco */
		        font-weight: bold; /* Texto en negrita */
		        transition: background-color 0.3s ease, transform 0.3s ease; /* Transición para el fondo y tamaño */
		    }

		    /* Estilo al pasar el ratón sobre el botón "Volver" */
		    .back-button button:hover {
		        background-color: #0056b3; /* Cambia el fondo a un azul más oscuro */
		        transform: scale(1.05); /* Agranda ligeramente el botón */
		    }

		    /* Estilo del contenedor del botón "Volver" */
		    .back-button {
		        text-align: center; /* Centra el botón */
		        margin-top: 20px; /* Espacio arriba del botón */
		    }

		    /* Estilo del mensaje de alerta */
		    .alert {
		        background-color: #f44336; /* Fondo rojo */
		        color: white; /* Texto blanco */
		        padding: 10px; /* Relleno interno */
		        border-radius: 5px; /* Bordes redondeados */
		        margin-bottom: 20px; /* Espacio debajo del mensaje */
		        text-align: center; /* Centra el texto de la alerta */
		    }

		    /* Media Queries para hacer el diseño responsivo */
		    @media screen and (max-width: 768px) {
		        body {
		            padding: 10px; /* Reduce el espaciado en pantallas más pequeñas */
		        }

		        .container {
		            width: 90%; /* El contenedor ocupa el 90% del ancho en pantallas más pequeñas */
		            padding: 20px; /* Reduce el espaciado interno */
		        }

		        h2 {
		            font-size: 1.5rem; /* Reduce el tamaño del título en pantallas pequeñas */
		        }

		        label {
		            font-size: 1rem; /* Reduce el tamaño de la fuente de las etiquetas */
		        }

		        input, select {
		            font-size: 0.9rem; /* Reduce el tamaño de la fuente de los campos */
		        }

		        button {
		            font-size: 0.9rem; /* Reduce el tamaño de la fuente del botón */
		        }
		    }

		    /* Media Queries para pantallas muy pequeñas (móviles) */
		    @media screen and (max-width: 480px) {
		        h2 {
		            font-size: 1.2rem; /* Reduce aún más el tamaño del título */
		        }

		        label {
		            font-size: 0.9rem; /* Reduce aún más el tamaño de la fuente de las etiquetas */
		        }

		        input, select {
		            font-size: 0.85rem; /* Reduce aún más el tamaño de la fuente de los campos */
		        }

		        button {
		            font-size: 0.85rem; /* Reduce aún más el tamaño de la fuente del botón */
		        }
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
