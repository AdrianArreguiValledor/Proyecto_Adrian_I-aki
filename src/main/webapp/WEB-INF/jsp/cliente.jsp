<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Clientes</title>
    <style>
        /* Reset global */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Fondo general */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            color: #333;
            line-height: 1.6;
            padding: 20px;
            animation: fadeIn 1s ease-out;
        }

        /* Contenedor principal */
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            opacity: 0;
            animation: slideIn 1s ease-out forwards;
        }

        /* Título */
        h2 {
            font-size: 2rem;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }

        /* Animación de FadeIn */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Animación de SlideIn */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Animación para la tabla */
        @keyframes tableFadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Tabla de clientes */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            animation: tableFadeIn 1s ease-out;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }

        table td {
            background-color: #f9f9f9;
        }

        table tr:nth-child(even) td {
            background-color: #f1f1f1;
        }

        /* Botones */
        .button-container {
            display: flex;
            gap: 10px;
        }

        .edit-button, .delete-button, .insert-button, .btn-volver {
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1rem;
            padding: 10px 20px;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .edit-button {
            background-color: #4CAF50;
            color: white;
        }

        .edit-button:hover {
            background-color: #45a049;
            transform: scale(1.05); /* Efecto de escala al pasar el ratón */
        }

        .delete-button {
            background-color: #f44336;
            color: white;
        }

        .delete-button:hover {
            background-color: #c62828;
            transform: scale(1.05); /* Efecto de escala al pasar el ratón */
        }

        .insert-button {
            background-color: #233dff;
            color: white;
            margin-bottom: 20px;
            display: block;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        .insert-button:hover {
            background-color: darkblue;
            transform: scale(1.05); /* Efecto de escala al pasar el ratón */
        }

        .btn-volver {
            background-color: #007BFF;
            color: white;
            display: block;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-volver:hover {
            background-color: darkblue;
            transform: scale(1.05); /* Efecto de escala al pasar el ratón */
        }

    </style>

    <script>
        function confirmarBorrado(userId) {
            if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
                window.location.href = "borrar/" + userId;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Lista de Clientes</h2>

        <!-- Botón Insertar Cliente -->
        <form action="/insertar" method="get">
            <button type="submit" class="insert-button">Insertar Cliente</button>
        </form>

        <c:choose>
            <c:when test="${not empty usuarios}">
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Edad</th>
                        <th>Género</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                    <c:forEach var="user" items="${usuarios}">
                        <tr>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.age}</td>
                            <td>${user.gender}</td>
                            <td>${user.role}</td>
                            <td>
                                <div class="button-container">
                                    <a href="editar/${user.id}">
                                        <button class="edit-button">Editar</button>
                                    </a>
                                    <button class="delete-button" onclick="confirmarBorrado(${user.id})">Borrar</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p>No hay clientes registrados.</p>
            </c:otherwise>
        </c:choose>

        <!-- Botón de volver -->
        <form action="/administrador" method="get">
            <button type="submit" class="btn-volver">Volver Atras</button>
        </form>
    </div>
</body>
</html>
