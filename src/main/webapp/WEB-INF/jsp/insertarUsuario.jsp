<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Usuario</title>
    <style>
        /* Estilo general de la página */
        body {
            font-family: Arial, sans-serif;
              background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
            margin: 0;
            padding: 0;
        }

        /* Estilo para el contenedor del formulario */
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin: 50px auto;
        }

        /* Estilo para el título dentro del formulario */
        .form-container h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 30px;
        }

        /* Estilo de los campos de entrada */
        .form-container input, .form-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Estilo para los botones */
        .form-container button {
            padding: 12px 25px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        /* Efecto hover para el botón */
        .form-container button:hover {
            background-color: #0056b3;
        }

		/* Estilo para el botón de volver atrás */
		       .back-button {
		           display: block;
		           width: 150px;
		           padding: 10px;
		           margin: 20px auto;
		           text-align: center;
		           background-color: #6c757d;
		           color: white;
		           border: none;
		           border-radius: 5px;
		           font-size: 16px;
		           cursor: pointer;
		           text-decoration: none;
		           transition: background-color 0.3s ease;
		       }

		       /* Efecto hover para el botón de volver atrás */
		       .back-button:hover {
		           background-color: #5a6268;
		       }
			   
        /* Estilo para las etiquetas */
        .form-container label {
            font-size: 16px;
            font-weight: 500;
			font-weight:bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        /* Espaciado para los campos */
        .form-container input, .form-container select {
            margin-bottom: 15px;
        }
		
	
		
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Insertar Nuevo Usuario</h1>
		<br>
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
            <input type="number" id="age" name="age" required>

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
			<br>
			<br>
			<br>
            <button type="submit">Guardar Usuario</button>
			<br>
			<br>
			<!-- Botón de Volver atrás -->
			<a href="/cliente" class="back-button">Volver Atras</a>
        </form>
    </div>

</body>
</html>
