<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
 
	<style>
	       /* Estilos generales */
	       body {
	           font-family: Arial, sans-serif;
	           background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
	           margin: 0;
	           padding: 0;
	           display: flex;
	           justify-content: center;
	           align-items: center;
	           height: 100vh;
	           text-align: center;
	       }

	       .container {
	           background-color: white;
	           padding: 30px;
	           border-radius: 8px;
	           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	           width: 100%;
	           max-width: 600px; /* Establece un ancho máximo para el formulario */
	       }

	       #password-status {
	           font-size: 18px; /* Letra grande */
	           font-weight: bold; /* Negrita */
	           text-align: center;
	           margin-top: 10px;
	       }

	       /* Cuando la contraseña esté visible */
	       .password-visible {
	           color: green;
	       }

	       /* Cuando la contraseña esté oculta */
	       .password-hidden {
	           color: red;
	       }

	       /* Contenedor del campo de contraseña */
	       .password-container {
	           position: relative;
	           width: 100%;
	           display: flex;
	           align-items: center;  /* Centra el icono y el input verticalmente */
	       }

	       /* Estilo del campo de contraseña */
	       .password-container input {
	           width: 100%;
	           padding: 12px 40px 12px 12px;  /* Aumentamos el padding a la derecha para el icono */
	           border: 1px solid #ccc;
	           border-radius: 4px;
	           box-sizing: border-box;
	           font-size: 16px;
	           height: 50px;  /* Aumenta la altura del input */
	           line-height: 24px;  /* Alinea el texto dentro del input */
	       }

	       /* Estilo del icono del ojo */
	       .toggle-password {
	           position: absolute;
	           right: 12px;  /* Ajustamos un poco el espacio a la derecha */
	           font-size: 20px;  /* Puedes cambiar el tamaño si deseas que el icono sea más grande */
	           color: #555;
	           cursor: pointer;
	           top: 50%;  /* Centra el icono verticalmente */
	           transform: translateY(-50%);  /* Ajuste fino para centrarlo perfectamente */
	           user-select: none;  /* Evita que el texto sea seleccionable */
	       }

	       h2 {
	           color: red;
	           font-weight: bold;
	           text-align: center;
	           margin-bottom: 20px; /* Espacio entre el título y el formulario */
	       }

	       /* Estilos para el formulario */
	       form {
	           width: 100%;
	           margin-top: 20px;
	       }

	       /* Etiquetas */
	       label {
	           display: flex;
	           align-items: center; /* Alinea la imagen y el texto */
	           font-size: 18px; /* Aumentado el tamaño de letra */
	           margin-bottom: 8px;
	           color: #555;
	           font-weight: bold;
	       }

	       /* Ajuste de las imágenes dentro de las etiquetas */
	       label img {
	           width: 34px; /* Ajusta el tamaño de las imágenes */
	           height: 28px;
	           margin-right: 10px; /* Espacio entre la imagen y el texto */
	       }

	       input[type="text"],
	       input[type="email"],
	       input[type="password"] {
	           width: 100%;
	           padding: 10px;
	           margin-bottom: 20px;
	           border: 1px solid #ccc;
	           border-radius: 4px;
	           box-sizing: border-box;
	           font-size: 16px;
	       }

	       /* Estilo para el botón "Registrarse" */
	       button.registro-btn {
	           width: 100%; /* El botón ocupará todo el ancho del formulario */
	           padding: 12px;
	           background-color: #4CAF50; /* Color verde */
	           color: white;
	           font-weight: bold;
	           border: none;
	           border-radius: 4px;
	           font-size: 16px;
	           cursor: pointer;
	           margin-top: 10px;
	       }

	       button.registro-btn:hover {
	           background-color: #45a049; /* Verde más oscuro cuando se pasa el ratón */
	       }

	       /* Estilo para el botón "Volver al Login" */
	       button.volver-btn {
	           background-color: #007BFF; /* Color azul */
	           width: 100%;
	           padding: 12px;
	           border: none;
	           font-weight: bold;
	           border-radius: 4px;
	           font-size: 16px;
	           color: white;
	           cursor: pointer;
	           margin-top: 10px;
	       }

	       button.volver-btn:hover {
	           background-color: #0056b3; /* Azul más oscuro al pasar el ratón */
	       }

	       /* Estilo para los mensajes de error y éxito */
	       p.error {
	           color: red;
	           font-size: 14px;
	           text-align: center;
	           margin-bottom: 20px;
	       }

	       p.success {
	           color: green;
	           font-size: 14px;
	           text-align: center;
	           margin-bottom: 20px;
	       }

	       /* Asegura que el formulario esté centrado en la página */
	       form {
	           width: 100%;
	           max-width: 450px;
	           margin: 0 auto;
	       }

	       /* Estilo para el campo de selección de rol */
	       select#rol {
	           width: 100%;
	           padding: 10px;
	           margin-bottom: 20px;
	           border: 1px solid #ccc;
	           border-radius: 4px;
	           font-size: 16px;
	           background-color: #fff; /* Fondo blanco para el select */
	           box-sizing: border-box;
	           cursor: pointer; /* Muestra el cursor de "manito" para indicar que es un campo seleccionable */
	       }

	       /* Cambiar color cuando el select es seleccionado */
	       select#rol:focus {
	           border-color: #4CAF50; /* Color verde cuando el select está en foco */
	           outline: none; /* Elimina el borde de enfoque predeterminado */
	       }

	       /* Estilo para las opciones dentro del select */
	       select#rol option {
	           padding: 10px;
	           background-color: #fff;
	           font-size: 16px;
	           color: #333;
	       }

	       /* Resaltar las opciones al pasar el ratón por encima */
	       select#rol option:hover {
	           background-color: #f2f2f2; /* Color gris claro al pasar el ratón */
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
			<input type="email" id="email" name="email" required=""><br><br>
					   
			<label for="contrasena"><img src="imagenes/contrasena.png" alt="contrasena" class="contrasena">Contraseña:</label>
		
			 <div class="password-container">
			                <input type="password" id="contrasena" name="contrasena" required>
			                <span class="toggle-password" onclick="togglePassword()">
			                    👁️
			                </span>
			            </div>
			<!-- Mensaje que indica si la contraseña está visible o oculta -->
			<p id="password-status"class="password-status">Contraseña oculta</p>
			<br>			
											 
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
		
	</script>
</body>
</html>
