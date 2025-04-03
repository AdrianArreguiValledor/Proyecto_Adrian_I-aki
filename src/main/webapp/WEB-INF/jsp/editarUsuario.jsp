<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
    <style>
	        /* Estilo general del cuerpo */
	        body {
	            font-family: Arial, sans-serif; /* Usamos la fuente Arial para el texto */
	            background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo de gradiente que va de azul oscuro a azul claro */
	            margin: 0; /* Eliminamos márgenes */
	            padding: 0; /* Eliminamos relleno */
	            display: flex; /* Utilizamos flexbox para centrar los elementos */
	            justify-content: center; /* Centrado horizontal */
	            align-items: center; /* Centrado vertical */
	            height: 100vh; /* La altura es del 100% de la ventana */
	            text-align: center; /* El texto se alinea en el centro */
	        }

	        /* Contenedor del formulario */
	        .form-container {
	            background-color: white; /* Fondo blanco para el formulario */
	            padding: 30px; /* Espaciado interno */
	            border-radius: 8px; /* Bordes redondeados */
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra ligera para dar profundidad */
	            width: 100%; /* Ancho al 100% */
	            max-width: 600px; /* Ancho máximo de 600px */
	            opacity: 0; /* Inicialmente invisible */
	            animation: fadeIn 1s forwards; /* Animación de desvanecimiento en 1 segundo */
	        }

	        /* Animación para hacer aparecer el formulario */
	        @keyframes fadeIn {
	            0% {
	                opacity: 0;
	            }
	            100% {
	                opacity: 1;
	            }
	        }

	        /* Estilo del título */
	        h1 {
	            color: red; /* El título es de color rojo */
	            font-weight: bold; /* En negrita */
	            text-align: center; /* Centrado */
	            margin-bottom: 20px; /* Espacio debajo del título */
	        }

	        /* Estilo de las etiquetas (labels) */
	        label {
	            display: flex; /* Usamos flexbox para alinearlas con los campos */
	            align-items: center; /* Alineamos los elementos de manera vertical */
	            font-size: 18px; /* Tamaño de fuente de las etiquetas */
	            margin-bottom: 8px; /* Espacio debajo de las etiquetas */
	            color: #555; /* Color gris oscuro */
	            font-weight: bold; /* Las etiquetas tienen negrita */
	        }

	        /* Estilo para los campos de texto, email, número y select */
	        input[type="text"],
	        input[type="email"],
	        input[type="number"],
	        select {
	            width: 100%; /* Los campos ocupan el 100% del ancho disponible */
	            padding: 12px; /* Espaciado interno de los campos */
	            border: 1px solid #ccc; /* Borde gris claro */
	            border-radius: 4px; /* Bordes redondeados */
	            box-sizing: border-box; /* Para incluir el padding en el tamaño total del campo */
	            font-size: 16px; /* Tamaño de texto */
	            margin-bottom: 20px; /* Espacio debajo de los campos */
	            transition: transform 0.2s ease-in-out; /* Efecto de transición al hacer zoom */
	        }

	        /* Efecto de enfoque en los campos */
	        input[type="text"]:focus,
	        input[type="email"]:focus,
	        input[type="number"]:focus,
	        select:focus {
	            transform: scale(1.02); /* Hace que el campo se agrande un poco al hacer foco */
	        }

	        /* Estilo del botón de envío */
	        button {
	            width: 100%; /* El botón ocupa el 100% del ancho */
	            padding: 12px; /* Espaciado interno */
	            background-color: #4CAF50; /* Fondo verde */
	            color: white; /* Texto blanco */
	            font-weight: bold; /* Texto en negrita */
	            border: none; /* Sin borde */
	            border-radius: 4px; /* Bordes redondeados */
	            font-size: 16px; /* Tamaño de texto */
	            cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
	            margin-top: 10px; /* Espacio superior */
	            transition: background-color 0.3s ease-in-out, transform 0.2s ease; /* Efecto de transición al pasar el ratón */
	        }

	        /* Efecto de hover para el botón */
	        button:hover {
	            background-color: #45a049; /* Cambia el fondo a un verde más oscuro */
	            transform: scale(1.05); /* Aumenta ligeramente el tamaño del botón */
	        }

	        /* Estilo para el botón "Volver" */
	        .back-button {
	            background-color: #007BFF; /* Fondo azul */
	            width: 100%; /* El botón ocupa el 100% del ancho */
	            padding: 12px; /* Espaciado interno */
	            border: none; /* Sin borde */
	            font-weight: bold; /* Texto en negrita */
	            border-radius: 4px; /* Bordes redondeados */
	            font-size: 16px; /* Tamaño de texto */
	            color: white; /* Texto blanco */
	            cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
	            margin-top: 10px; /* Espacio superior */
	            transition: background-color 0.3s ease-in-out, transform 0.2s ease; /* Efecto de transición */
	        }

	        /* Efecto de hover para el botón "Volver" */
	        .back-button:hover {
	            background-color: #0056b3; /* Cambia el fondo a un azul más oscuro */
	            transform: scale(1.05); /* Aumenta ligeramente el tamaño del botón */
	        }

    </style>

    <script>
        // Función para confirmar el envío del formulario
        function confirmSubmit() {
            var result = confirm("¿Está seguro de que desea actualizar la información?");
            if (result) {
                return true;
            } else {
                return false;
            }
        }

        // Validación de formulario
        function validateForm() {
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var age = document.getElementById("age").value;
            var gender = document.getElementById("gender").value;
            var role = document.getElementById("role").value;

            if (firstName == "" || lastName == "" || email == "" || phone == "" || age == "" || gender == "" || role == "") {
                alert("Todos los campos son obligatorios.");
                return false; // Evita el envío si hay campos vacíos
            }

            // Validación del formato de correo electrónico
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                alert("Por favor ingrese un correo electrónico válido.");
                return false;
            }

            // Validación de teléfono (solo números)
            var phonePattern = /^[0-9]+$/;
            if (!phonePattern.test(phone)) {
                alert("El teléfono solo debe contener números.");
                return false;
            }

            return true; // El formulario puede enviarse si pasa todas las validaciones
        }
    </script>
</head>

<body>
    <div class="form-container">
        <h1>Editar Usuario</h1>

        <form action="/actualizar/${usuario.id}" method="post" onsubmit="return validateForm()">
            <label for="firstName">Nombre:</label>
            <input type="text" id="firstName" name="firstName" value="${usuario.firstName}" required>

            <label for="lastName">Apellido:</label>
            <input type="text" id="lastName" name="lastName" value="${usuario.lastName}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${usuario.email}" required>

            <label for="phone">Telefono:</label>
            <input type="text" id="phone" name="phone" value="${usuario.phone}" required>

            <label for="age">Edad:</label>
            <input type="number" id="age" name="age" value="${usuario.age}" required min="0">

            <label for="gender">Genero:</label>
            <select id="gender" name="gender" required>
                <option value="Masculino" <c:if test="${usuario.gender == 'Masculino'}">selected</c:if>>Masculino</option>
                <option value="Femenino" <c:if test="${usuario.gender == 'Femenino'}">selected</c:if>>Femenino</option>
                <option value="Otro" <c:if test="${usuario.gender == 'Otro'}">selected</c:if>>Otro</option>
            </select>

            <label for="role">Rol:</label>
            <select id="role" name="role" required>
                <option value="Admin" <c:if test="${usuario.role == 'Admin'}">selected</c:if>>Admin</option>
                <option value="Usuario" <c:if test="${usuario.role == 'Usuario'}">selected</c:if>>Usuario</option>
            </select>
            <br><br>
            
            <button type="submit" onclick="return confirmSubmit()">Actualizar Usuario</button>
        </form>
        <br><br>
        
        <form action="/cliente" method="get">
            <button type="submit" class="back-button">Volver Atras</button>
        </form>
        
    </div>
</body>
</html>
