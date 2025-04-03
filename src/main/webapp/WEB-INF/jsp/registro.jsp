<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
 
    <style>
		/* Estilos generales para el cuerpo de la página */
		body {
		    font-family: Arial, sans-serif; /* Usamos una fuente sans-serif para el texto */
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo con un gradiente de azul oscuro a azul claro */
		    margin: 0; /* Elimina márgenes por defecto */
		    padding: 0; /* Elimina padding por defecto */
		    display: flex; /* Utilizamos flexbox para centrar el contenido */
		    justify-content: center; /* Centra el contenido horizontalmente */
		    align-items: center; /* Centra el contenido verticalmente */
		    height: 100vh; /* Asegura que el contenido ocupe toda la altura de la ventana */
		    text-align: center; /* Centra el texto dentro de la página */
		}

		/* Contenedor del formulario */
		.container {
		    background-color: white; /* Fondo blanco para el contenedor */
		    padding: 30px; /* Espaciado interno */
		    border-radius: 8px; /* Bordes redondeados */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra sutil */
		    width: 100%; /* Ancho del contenedor */
		    max-width: 600px; /* Ancho máximo para el formulario */
		    opacity: 0; /* Inicia el contenedor con opacidad 0 para la animación */
		    transform: translateY(50px); /* Empuja el contenedor hacia abajo al inicio */
		    animation: fadeInUp 1s forwards; /* Aplica animación de entrada */
		}

		/* Animación de desvanecimiento y movimiento hacia arriba */
		@keyframes fadeInUp {
		    0% {
		        opacity: 0; /* Empieza invisible */
		        transform: translateY(50px); /* Empieza desplazado hacia abajo */
		    }
		    100% {
		        opacity: 1; /* Termina visible */
		        transform: translateY(0); /* Termina en su lugar original */
		    }
		}

		/* Estilo para el estado de la contraseña (visible u oculta) */
		#password-status {
		    font-size: 18px; /* Tamaño grande para el mensaje */
		    font-weight: bold; /* Negrita para hacer más notorio el mensaje */
		    text-align: center; /* Centra el texto */
		    margin-top: 10px; /* Espaciado superior */
		}

		/* Estilos cuando la contraseña es visible (verde) */
		.password-visible {
		    color: green; /* Texto en verde */
		}

		/* Estilos cuando la contraseña es oculta (rojo) */
		.password-hidden {
		    color: red; /* Texto en rojo */
		}

		/* Contenedor para el campo de contraseña */
		.password-container {
		    position: relative; /* Necesario para colocar el icono sobre el campo */
		    width: 100%; /* Ancho completo */
		    display: flex; /* Utilizamos flexbox para alinear el icono y el campo de texto */
		    align-items: center;  /* Alineación vertical para el icono y el input */
		}

		/* Estilos del campo de entrada de la contraseña */
		.password-container input {
		    width: 100%; /* Ancho completo */
		    padding: 12px 40px 12px 12px; /* Espaciado extra en la derecha para el icono */
		    border: 1px solid #ccc; /* Borde gris */
		    border-radius: 4px; /* Bordes redondeados */
		    box-sizing: border-box; /* Asegura que el padding no se salga del contenedor */
		    font-size: 16px; /* Tamaño de la fuente */
		    height: 50px;  /* Mayor altura para el campo de contraseña */
		    line-height: 24px;  /* Alineación del texto dentro del input */
		}

		/* Estilos del icono del ojo (para mostrar/ocultar contraseña) */
		.toggle-password {
		    position: absolute; /* Coloca el icono en una posición relativa al campo */
		    right: 12px;  /* Coloca el icono a la derecha del campo */
		    font-size: 20px;  /* Tamaño del icono */
		    color: #555; /* Color gris para el icono */
		    cursor: pointer; /* Cambia el cursor cuando pasa sobre el icono */
		    top: 50%;  /* Coloca el icono en el centro vertical */
		    transform: translateY(-50%);  /* Ajuste fino para centrar el icono perfectamente */
		    user-select: none;  /* Evita que el texto del icono sea seleccionable */
		}

		/* Estilo para el título */
		h2 {
		    color: red; /* Color rojo para el título */
		    font-weight: bold; /* Título en negrita */
		    text-align: center; /* Centrado del título */
		    margin-bottom: 20px; /* Espaciado inferior entre el título y el formulario */
		}

		/* Estilos del formulario */
		form {
		    width: 100%; /* Asegura que el formulario ocupe todo el ancho disponible */
		    margin-top: 20px; /* Espaciado superior */
		}

		/* Estilos para las etiquetas de los campos */
		label {
		    display: flex; /* Usamos flexbox para alinear el icono y el texto de la etiqueta */
		    align-items: center; /* Alinea el texto y la imagen verticalmente */
		    font-size: 18px; /* Aumentamos el tamaño de la fuente de las etiquetas */
		    margin-bottom: 8px; /* Espaciado inferior entre la etiqueta y el campo */
		    color: #555; /* Color gris para las etiquetas */
		    font-weight: bold; /* Negrita para las etiquetas */
		}

		/* Estilo de las imágenes dentro de las etiquetas */
		label img {
		    width: 34px; /* Ajustamos el tamaño de las imágenes */
		    height: 28px; /* Altura proporcional */
		    margin-right: 10px; /* Espaciado entre la imagen y el texto */
		}

		/* Estilos para los campos de texto */
		input[type="text"],
		input[type="email"],
		input[type="password"] {
		    width: 100%; /* Los campos ocupan todo el ancho disponible */
		    padding: 10px; /* Espaciado interno */
		    margin-bottom: 20px; /* Espaciado inferior */
		    border: 1px solid #ccc; /* Borde gris para los campos */
		    border-radius: 4px; /* Bordes redondeados */
		    box-sizing: border-box; /* Asegura que el padding no se salga del contenedor */
		    font-size: 16px; /* Tamaño de la fuente */
		}

		/* Estilo para el botón de registro */
		button.registro-btn {
		    width: 100%; /* El botón ocupa todo el ancho del formulario */
		    padding: 12px; /* Espaciado interno */
		    background-color: #4CAF50; /* Fondo verde para el botón */
		    color: white; /* Texto blanco */
		    font-weight: bold; /* Negrita para el texto */
		    border: none; /* Sin borde */
		    border-radius: 4px; /* Bordes redondeados */
		    font-size: 16px; /* Tamaño de la fuente */
		    cursor: pointer; /* Cambia el cursor a manito */
		    margin-top: 10px; /* Espaciado superior */
		    transition: transform 0.3s ease; /* Transición suave al pasar el ratón */
		}

		/* Efecto de zoom cuando se pasa el ratón sobre el botón de registro */
		button.registro-btn:hover {
		    background-color: #45a049; /* Fondo verde más oscuro al pasar el ratón */
		    transform: scale(1.1); /* Aumenta el tamaño del botón */
		}

		/* Estilo para el botón de volver al login */
		button.volver-btn {
		    background-color: #007BFF; /* Fondo azul */
		    width: 100%; /* El botón ocupa todo el ancho del formulario */
		    padding: 12px; /* Espaciado interno */
		    border: none; /* Sin borde */
		    font-weight: bold; /* Texto en negrita */
		    border-radius: 4px; /* Bordes redondeados */
		    font-size: 16px; /* Tamaño de la fuente */
		    color: white; /* Texto blanco */
		    cursor: pointer; /* Cambia el cursor a manito */
		    margin-top: 10px; /* Espaciado superior */
		    transition: transform 0.3s ease; /* Transición suave al pasar el ratón */
		}

		/* Efecto de zoom cuando se pasa el ratón sobre el botón de volver al login */
		button.volver-btn:hover {
		    background-color: #0056b3; /* Fondo azul más oscuro */
		    transform: scale(1.1); /* Aumenta el tamaño del botón */
		}

		/* Estilo para los mensajes de error */
		p.error {
		    color: red; /* Color rojo para los mensajes de error */
		    font-size: 14px; /* Tamaño de fuente pequeño */
		    text-align: center; /* Centra el mensaje */
		    margin-bottom: 20px; /* Espaciado inferior */
		}

		/* Estilo para los mensajes de éxito */
		p.success {
		    color: green; /* Color verde para los mensajes de éxito */
		    font-size: 14px; /* Tamaño de fuente pequeño */
		    text-align: center; /* Centra el mensaje */
		    margin-bottom: 20px; /* Espaciado inferior */
		}

		/* Ajusta el formulario para que esté centrado y con un ancho limitado */
		form {
		    width: 100%; /* Asegura que el formulario ocupe todo el ancho disponible */
		    max-width: 450px; /* Ancho máximo para el formulario */
		    margin: 0 auto; /* Centra el formulario horizontalmente */
		}

		/* Estilo para el campo de selección de rol */
		select#rol {
		    width: 100%; /* Ancho completo */
		    padding: 10px; /* Espaciado interno */
		    margin-bottom: 20px; /* Espaciado inferior */
		    border: 1px solid #ccc; /* Borde gris */
		    border-radius: 4px; /* Bordes redondeados */
		    font-size: 16px; /* Tamaño de la fuente */
		    background-color: #fff; /* Fondo blanco */
		    box-sizing: border-box; /* Asegura que el padding no se salga del contenedor */
		    cursor: pointer; /* Muestra el cursor de "manito" */
		}

		/* Cambiar el borde cuando el select está en foco */
		select#rol:focus {
		    border-color: #4CAF50; /* Borde verde cuando está enfocado */
		    outline: none; /* Elimina el borde de enfoque predeterminado */
		}

		/* Estilo para las opciones dentro del select */
		select#rol option {
		    padding: 10px; /* Espaciado interno para las opciones */
		    background-color: #fff; /* Fondo blanco */
		    font-size: 16px; /* Tamaño de la fuente */
		    color: #333; /* Color del texto */
		}

		/* Estilo al pasar el ratón por encima de las opciones */
		select#rol option:hover {
		    background-color: #f2f2f2; /* Fondo gris claro al pasar el ratón */
		}
    </style>
</head>
<body>
    <div class="container">
        
        <!-- Imagen de registro -->
        <img src="imagenes/registro.png" alt="registro" class="registro">
                
        <h2>REGISTRO</h2>
        <br>
        
        <!-- Mostrar error si existe -->
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <!-- Mostrar mensaje de éxito si existe -->
        <% if (request.getAttribute("mensaje") != null) { %>
            <p class="success"><%= request.getAttribute("mensaje") %></p>
        <% } %>

        <!-- Formulario de registro -->
        <form id="registro-form" action="/formularioRegistro" method="post">
            <label for="nombre"><img src="imagenes/usuario.png" alt="usuario" class="usuario">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required=""><br><br>

            <label for="apellido"><img src="imagenes/usuario.png" alt="usuario" class="usuario">Apellidos:</label>
            <input type="text" id="apellido" name="apellido" required=""><br><br>
                        
            <label for="email"><img src="imagenes/correo.png" alt="correo" class="correo">Email:</label>
            <input type="email" id="email" name="email" required="" oninput="validateEmail()"><br><br>
            <p id="email-message"></p>
                       
            <label for="contrasena"><img src="imagenes/contrasena.png" alt="contrasena" class="contrasena">Contraseña:</label>
        
            <div class="password-container">
                <input type="password" id="contrasena" name="contrasena" required oninput="checkPasswordStrength()">
                <span class="toggle-password" onclick="togglePassword()">
                    👁️
                </span>
            </div>
            <!-- Mensaje que indica si la contraseña está visible o oculta -->
            <p id="password-status" class="password-status">Contraseña oculta</p>
            <p id="password-strength"></p><br>            
                                 
            <label for="rol"><img src="imagenes/rol.png" alt="rol" class="rol">Rol:</label>
            <select id="rol" name="rol" required>
                <option value="usuario">Usuario</option>
                <option value="Administrador">Administrador</option>
            </select>
            <br>
            <br>

            <!-- Botón para registrar el usuario -->
            <button type="submit" class="registro-btn">Registrarse</button>
        </form>

        <br>

        <!-- Enlace para redirigir a la página de login -->
        <form action="/index" method="get">
            <button type="submit" class="volver-btn">Volver al Login</button>
        </form>
    </div>

    <script>
        function togglePassword() {
            var passwordField = document.getElementById("contrasena");
            var passwordStatus = document.getElementById("password-status");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                passwordStatus.textContent = "Contraseña visible";
                passwordStatus.className = "password-visible"; // Aplicar estilo verde
            } else {
                passwordField.type = "password";
                passwordStatus.textContent = "Contraseña oculta";
                passwordStatus.className = "password-hidden"; // Aplicar estilo rojo
            }
        }

        function validateEmail() {
            var email = document.getElementById("email").value;
            var emailMessage = document.getElementById("email-message");
            var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (regex.test(email)) {
                emailMessage.textContent = "Email válido";
                emailMessage.style.color = "green";
            } else {
                emailMessage.textContent = "Email no válido";
                emailMessage.style.color = "red";
            }
        }

        function checkPasswordStrength() {
            var password = document.getElementById("contrasena").value;
            var strengthMessage = document.getElementById("password-strength");
            var score = 0;

            if (password.length >= 8) score++;
            if (/[A-Z]/.test(password)) score++;
            if (/[a-z]/.test(password)) score++;
            if (/\d/.test(password)) score++;
            if (/[^A-Za-z0-9]/.test(password)) score++;

            if (score < 2) {
                strengthMessage.textContent = "Contraseña débil";
                strengthMessage.style.color = "red";
            } else if (score < 4) {
                strengthMessage.textContent = "Contraseña moderada";
                strengthMessage.style.color = "orange";
            } else {
                strengthMessage.textContent = "Contraseña fuerte";
                strengthMessage.style.color = "green";
            }
        }
    </script>
</body>
</html>
