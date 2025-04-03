<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Administrador</title>
    <style>
		/* Estilos generales */
		body {
		    font-family: Arial, sans-serif; /* Establece la fuente general para la página */
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo degradado de azul oscuro a azul claro */
		    margin: 0; /* Elimina márgenes predeterminados */
		    padding: 0; /* Elimina relleno predeterminado */
		    display: flex; /* Utiliza Flexbox para alinear el contenido */
		    justify-content: center; /* Centra el contenido horizontalmente */
		    align-items: center; /* Centra el contenido verticalmente */
		    height: 100vh; /* Asegura que el body ocupe el 100% de la altura de la pantalla */
		    animation: fadeIn 1s ease-out; /* Aplica una animación fadeIn para la entrada del contenido */
		}

		/* Estilo del contenedor principal */
		.container {
		    background-color: white; /* Fondo blanco para el contenedor */
		    padding: 40px; /* Relleno de 40px alrededor del contenido */
		    border-radius: 8px; /* Bordes redondeados */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra sutil para dar profundidad */
		    width: 550px; /* Ancho fijo del contenedor */
		    height: 400px; /* Altura fija del contenedor */
		    max-width: 700px; /* Ancho máximo para que no crezca demasiado */
		    text-align: center; /* Centra el texto dentro del contenedor */
		    opacity: 0; /* Inicia con opacidad 0 para la animación */
		    animation: slideIn 1s forwards; /* Aplica una animación de deslizamiento hacia abajo */
		}

		/* Estilo del título */
		h2 {
		    color: black; /* Color del texto en negro */
		    font-weight: bold; /* Texto en negrita */
		    font-size: 30px; /* Tamaño grande para el título */
		}

		/* Estilo para el nombre de usuario */
		.usuario {
		    color: red; /* Color rojo para el nombre de usuario */
		    font-size: 18px; /* Tamaño de fuente más pequeño para el nombre de usuario */
		    font-weight: bold; /* Negrita para el nombre de usuario */
		    text-decoration: underline; /* Subraya el nombre de usuario */
		    margin-top: 20px; /* Espacio superior */
		}

		/* Estilo para los párrafos generales */
		p {
		    font-size: 16px; /* Tamaño de fuente más pequeño para los párrafos */
		    color: #333; /* Color gris oscuro para el texto */
		}

		/* Estilos para los botones */
		button {
		    width: 100%; /* Hace que el botón ocupe el 100% del ancho disponible */
		    padding: 10px; /* Añade un relleno de 10px en todas las direcciones */
		    font-size: 16px; /* Tamaño de fuente para los botones */
		    border-radius: 4px; /* Bordes redondeados */
		    border: none; /* Elimina el borde por defecto */
		    cursor: pointer; /* Cambia el cursor a una mano al pasar sobre el botón */
		    margin-top: 10px; /* Espacio superior */
		    font-weight: bold; /* Pone el texto del botón en negrita */
		    transition: transform 0.3s ease-in-out; /* Aplica una transición suave en la propiedad transform */
		}

		/* Efecto al pasar el ratón sobre los botones */
		button:hover {
		    transform: scale(1.05); /* Efecto de escala al pasar el ratón */
		}

		/* Estilo del botón "Ver Clientes" */
		.cliente-btn {
		    background-color: rgb(100, 232, 100); /* Fondo verde para el botón */
		    color: white; /* Texto blanco */
		    font-weight: bold; /* Negrita en el texto */
		}

		/* Efecto de hover para el botón "Ver Clientes" */
		.cliente-btn:hover {
		    background-color: rgb(26, 170, 26); /* Cambia a un verde más oscuro al pasar el ratón */
		}

		/* Estilo del botón "Ver Productos" */
		.btn-ver-productos {
		    background-color: red; /* Fondo rojo para el botón */
		    color: white; /* Texto blanco */
		}

		/* Efecto de hover para el botón "Ver Productos" */
		.btn-ver-productos:hover {
		    background-color: darkred; /* Cambia a un rojo más oscuro al pasar el ratón */
		}

		/* Estilo del botón "Volver atrás" */
		.btn-volver {
		    background-color: #007BFF; /* Fondo azul para el botón */
		    color: white; /* Texto blanco */
		}

		/* Efecto de hover para el botón "Volver atrás" */
		.btn-volver:hover {
		    background-color: darkblue; /* Cambia a un azul más oscuro al pasar el ratón */
		}

		/* Animación de entrada para el contenedor */
		@keyframes slideIn {
		    from {
		        opacity: 0; /* Inicia con opacidad 0 */
		        transform: translateY(-20px); /* Empuja el contenedor desde arriba */
		    }
		    to {
		        opacity: 1; /* Termina con opacidad 1 */
		        transform: translateY(0); /* El contenedor vuelve a su posición original */
		    }
		}

		/* Animación de FadeIn para el fondo */
		@keyframes fadeIn {
		    from {
		        opacity: 0; /* Comienza con opacidad 0 */
		    }
		    to {
		        opacity: 1; /* Termina con opacidad 1 */
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
