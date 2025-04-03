<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h1 {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: flex;
            align-items: center;
            font-size: 18px;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            margin-bottom: 20px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        .back-button {
            background-color: #007BFF;
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

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Editar Usuario</h1>

        <form action="/actualizar/${usuario.id}" method="post">
            <label for="firstName">Nombre:</label>
            <input type="text" id="firstName" name="firstName" value="${usuario.firstName}" required>

            <label for="lastName">Apellido:</label>
            <input type="text" id="lastName" name="lastName" value="${usuario.lastName}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${usuario.email}" required>

            <label for="phone">Telefono:</label>
            <input type="text" id="phone" name="phone" value="${usuario.phone}" required>

            <label for="age">Edad:</label>
            <input type="number" id="age" name="age" value="${usuario.age}" required>

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
			
            <button type="submit">Actualizar Usuario</button>
        </form>
		<br><br>
		
		<form action="/cliente" method="get">
			<button type="submit" class="back-button">Volver Atras</button>
		</form>
		
    </div>
</body>
</html>
