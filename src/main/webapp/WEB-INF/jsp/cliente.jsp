<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Clientes</title>
    <link rel="stylesheet" type="text/css" href="style3.css">
    <style>
        /* Estilo para el contenedor de la tabla */
        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        
        /* Estilo para el título */
        h1 {
            background-color: white;
            padding: 10px;
            color: black;
            text-align: center;
         
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
        }

        /* Estilo para el botón */
        .back-button, .insert-button, .edit-button, .delete-button {
            display: inline-block;
            padding: 10px 15px;
            margin: 10px;
            text-align: center;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .back-button:hover, .insert-button:hover, .edit-button:hover, .delete-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #e74c3c;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div class="table-container">
		<!-- Botón Insertar -->
		<h1>Clientes</h1>
		<br><br>
		<a href="insertar" class="insert-button">Insertar Cliente</a>
		<br><br>
        <table border="1">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Edad</th>
                    <th>Genero</th>
                    <th>Rol</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterar sobre los usuarios y mostrar sus datos -->
                <c:forEach var="user" items="${usuarios}">
                    <tr>
                        <td>${user.firstName} ${user.lastName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.age}</td>
                        <td>${user.gender}</td>
                        <td>${user.role}</td>
                        <td>
                            <!-- Botón Editar -->
                            <a href="editar/${user.id}" class="edit-button">Editar</a>

                            <!-- Botón Borrar con confirmación -->
                            <a href="borrar/${user.id}" class="delete-button" onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?')">Borrar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
      
        <br><br>
        <!-- Botón de volver atrás -->
        <a href="principal" class="back-button">Volver atras</a>
    </div>

</body>
</html>
