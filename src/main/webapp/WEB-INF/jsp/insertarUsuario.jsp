<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Usuario</title>
    <style>
		/* Estilo general de la página */
		    body {
		        font-family: 'Poppins', sans-serif; /* Fuente de texto */
		        background: linear-gradient(to right, #004080, #66ccff); /* Fondo de gradiente, de azul oscuro a azul claro */
		        margin: 0; /* Elimina márgenes */
		        padding: 0; /* Elimina relleno */
		        display: flex; /* Usa Flexbox para organizar los elementos */
		        justify-content: center; /* Centra el contenido horizontalmente */
		        align-items: center; /* Centra el contenido verticalmente */
		        height: 100vh; /* Hace que el body ocupe toda la altura de la ventana */
		        animation: fadeIn 1s ease-in-out; /* Animación de desvanecimiento al cargar la página */
		    }

		    /* Contenedor del formulario */
		    .form-container {
		        background: white; /* Fondo blanco */
		        padding: 40px; /* Relleno interno */
		        border-radius: 12px; /* Bordes redondeados */
		        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Sombra ligera */
		        width: 50%; /* Ancho al 50% */
		        max-width: 500px; /* Máximo ancho de 500px */
		        text-align: center; /* Centra el texto */
		        opacity: 0; /* Inicialmente invisible */
		        animation: slideIn 0.8s forwards 0.5s; /* Animación de deslizamiento para el formulario */
		    }

		    /* Título del formulario */
		    .form-container h1 {
		        color: #003366; /* Color azul oscuro */
		        font-size: 24px; /* Tamaño de fuente */
		        margin-bottom: 20px; /* Espacio debajo del título */
		        animation: fadeInTitle 1s ease-in-out; /* Animación de desvanecimiento para el título */
		    }

		    /* Campos de entrada y select */
		    .form-container input, .form-container select {
		        width: 100%; /* Ancho completo */
		        padding: 12px; /* Relleno interno */
		        margin: 10px 0; /* Espacio vertical entre los campos */
		        border-radius: 8px; /* Bordes redondeados */
		        border: 1px solid #ccc; /* Borde gris */
		        font-size: 16px; /* Tamaño de fuente */
		        box-sizing: border-box; /* Asegura que el relleno se incluye en el ancho total */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInInput 1s ease-in-out forwards; /* Animación de desvanecimiento para los campos */
		    }

		    /* Estilo para el botón de Guardar Usuario */
		    .form-container button {
		        padding: 12px; /* Relleno interno */
		        background-color: #28a745; /* Fondo verde */
		        color: white; /* Texto blanco */
		        font-size: 16px; /* Tamaño de fuente */
		        border: none; /* Sin borde */
		        border-radius: 8px; /* Bordes redondeados */
		        cursor: pointer; /* Cambia el cursor cuando pasa sobre el botón */
		        transition: 0.3s ease; /* Efecto de transición */
		        width: 100%; /* Ancho completo */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInButton 1s ease-in-out forwards 1s; /* Animación de desvanecimiento para el botón */
		    }

		    /* Efecto de zoom en el botón de Guardar Usuario */
		    .form-container button:hover {
		        background-color: #218838; /* Fondo verde más oscuro al pasar el ratón */
		        transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
		    }

		    /* Botón de Volver */
		    .back-button {
		        display: block; /* Hace que el botón ocupe toda la línea */
		        width: 100%; /* Ancho completo */
		        padding: 12px; /* Relleno interno */
		        margin-top: 10px; /* Espacio superior */
		        text-align: center; /* Centra el texto dentro del botón */
		        background-color: #007bff; /* Fondo azul */
		        color: white; /* Texto blanco */
		        border-radius: 8px; /* Bordes redondeados */
		        text-decoration: none; /* Elimina subrayado */
		        font-size: 16px; /* Tamaño de fuente */
		        transition: 0.3s ease; /* Efecto de transición */
		        border: none; /* Sin borde */
		        cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInBackButton 1s ease-in-out forwards 1.2s; /* Animación de desvanecimiento para el botón de volver */
		    }

		    /* Efecto de zoom en el botón de Volver */
		    .back-button:hover {
		        background-color: #0056b3; /* Fondo azul más oscuro al pasar el ratón */
		        transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
		    }

		    /* Etiquetas */
		    .form-container label {
		        font-size: 16px; /* Tamaño de fuente */
		        font-weight: bold; /* Texto en negrita */
		        color: #333; /* Color gris oscuro */
		        display: block; /* Hace que la etiqueta ocupe toda la línea */
		        margin-top: 15px; /* Espacio superior */
		        text-align: left; /* Alineación a la izquierda */
		    }

		    /* Animaciones */
		    @keyframes fadeIn {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInTitle {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes slideIn {
		        0% {
		            transform: translateY(-30px); /* Inicialmente desplazado hacia arriba */
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            transform: translateY(0); /* Vuelve a la posición original */
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInInput {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInButton {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInBackButton {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

    </style>
</head>
<body>
    <div class="form-container">
        <h1>Insertar Nuevo Usuario</h1>
        <form action="/guardar" method="post">
            <label for="firstName">Nombre:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Apellido:</label>
            <input type="text" id="lastName" name="lastName" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Telefono:</label>
            <input type="text" id="phone" name="phone" required>

            <label for="age">Edad:</label>
            <input type="number" id="age" name="age" required min="0">

            <label for="gender">Genero:</label>
            <select id="gender" name="gender" required>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                <option value="Otro">Otro</option>
            </select>

            <label for="role">Rol:</label>
            <select id="role" name="role" required>
                <option value="Admin">Admin</option>
                <option value="Usuario">Usuario</option>
            </select>
            <br><br>
            <button type="submit">Guardar Usuario</button>
            <br><br>
            <a href="/cliente" class="back-button">Volver Atras</a>
        </form>
    </div>
</body>
</html>
