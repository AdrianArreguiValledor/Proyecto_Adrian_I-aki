<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Clientes</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 30px;
            color: white;
        }

        .insert-button {
            background-color: yellow;
            color: black;
            border: none;
            border-radius: 8px;
            padding: 15px 26px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            transition: all 0.3s ease;
        }

        .btn-volver {
            background-color: green;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 15px 26px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            display: block;
            margin: 20px auto;
            transition: all 0.3s ease;
        }

        .insert-button:hover {
            background-color: #B8860B;
            transform: scale(1.05);
        }

        .btn-volver:hover {
            background-color: darkgreen;
            transform: scale(1.05);
        }

        .user-card {
            background-color: white;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .user-card:hover {
            transform: translateY(-5px);
        }

        .user-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .user-header img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #ccc;
        }

        .user-header h3 {
            margin: 0;
            font-size: 1.5rem;
            color: #34495e;
        }

        .user-info {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 14px;
            margin-top: 20px;
        }

        .user-info div {
            background: #ffffff;
            border: 1px solid #e0e6ed;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            padding: 14px 18px;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            transition: box-shadow 0.3s ease;
            overflow-x: auto;
        }

        .user-info div:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        .user-info div span {
            white-space: nowrap;
            width: max-content;
            max-width: 100%;
            overflow: visible;
            text-overflow: unset;
            display: inline-block;
        }

        .user-info div span:first-child {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 0.87rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .user-info div span:last-child {
            color: #34495e;
            font-size: 1rem;
        }

        .button-container {
            margin-top: 20px;
            display: flex;
            gap: 15px;
            justify-content: flex-end;
        }

        .edit-button, .delete-button {
            padding: 20px 30px;
            font-size: 1.5rem;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-button {
            background-color: #2ecc71;
            color: white;
        }

        .edit-button:hover {
            background-color: #27ae60;
        }

        .delete-button {
            background-color: #e74c3c;
            color: white;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        .red-text h3 {
            color: red !important;
        }

        /* Media Queries para hacerlo responsivo */
        @media (max-width: 1024px) {
            .user-info {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            }

            .user-header h3 {
                font-size: 1.2rem;
            }

            .user-card {
                padding: 15px;
            }

            .insert-button, .btn-volver {
                font-size: 0.9rem;
                padding: 12px 20px;
            }

            .button-container {
                flex-direction: column;
                align-items: flex-end;
            }

            .edit-button, .delete-button {
                font-size: 1.2rem;
                padding: 10px 20px;
                margin-bottom: 10px;
            }
        }

        @media (max-width: 768px) {
            .user-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .user-header img {
                width: 60px;
                height: 60px;
            }

            .user-header h3 {
                font-size: 1.2rem;
            }

            .user-info {
                grid-template-columns: 1fr;
            }

            .insert-button, .btn-volver {
                font-size: 1rem;
                padding: 12px 24px;
            }

            .button-container {
                flex-direction: column;
                align-items: flex-start;
            }

            .edit-button, .delete-button {
                font-size: 1.2rem;
                padding: 10px 20px;
                margin-bottom: 10px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }

            .user-info {
                grid-template-columns: 1fr;
            }

            .insert-button, .btn-volver {
                font-size: 1rem;
                padding: 10px 20px;
            }

            .button-container {
                flex-direction: column;
                align-items: flex-start;
            }

            .edit-button, .delete-button {
                font-size: 1.2rem;
                padding: 10px 20px;
                margin-bottom: 10px;
            }
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

    <form action="/insertar" method="get">
        <button type="submit" class="insert-button">Insertar Cliente</button>
    </form>

    <c:choose>
        <c:when test="${not empty usuarios}">
            <c:forEach var="user" items="${usuarios}">
                <div class="user-card ${user.firstName == 'Emily' ? 'red-text' : ''}">
                    <div class="user-header">
                        <img src="${user.getImageUrl()}" alt="Foto de ${user.firstName}">
                        <h3>${user.firstName} ${user.lastName}</h3>
                    </div>

                    <div class="user-info">
                        <div><span>Email:</span><span>${user.email}</span></div>
                        <div><span>Teléfono:</span><span>${user.phone}</span></div>
                        <div><span>Edad:</span><span>${user.age}</span></div>
                        <div><span>Género:</span><span>${user.gender}</span></div>
                        <div><span>Usuario:</span><span>${user.username}</span></div>
                        <div><span>Contraseña:</span><span>${user.password}</span></div>
                        <div><span>Nacimiento:</span><span>${user.birthDate}</span></div>
                        <div><span>Grupo Sanguíneo:</span><span>${user.bloodGroup}</span></div>
                        <div><span>Altura:</span><span>${user.height} cm</span></div>
                        <div><span>Peso:</span><span>${user.weight} kg</span></div>
                        <div><span>Color de ojos:</span><span>${user.eyeColor}</span></div>
                        <div><span>Cabello:</span><span>${user.hairColor} (${user.hairType})</span></div>
                        <div><span>Dirección:</span><span>${user.address}, ${user.city}</span></div>
                        <div><span>Estado:</span><span>${user.state} (${user.stateCode})</span></div>
                        <div><span>País:</span><span>${user.country}</span></div>
                        <div><span>Postal:</span><span>${user.postalCode}</span></div>
                        <div><span>MAC:</span><span>${user.macAddress}</span></div>
                        <div><span>Universidad:</span><span>${user.university}</span></div>
                        <div><span>Cripto:</span><span>${user.cryptoCoin} (${user.cryptoNetwork})</span></div>
                        <div><span>Wallet:</span><span>${user.cryptoWallet}</span></div>
                        <div><span>Empresa:</span><span>${user.companyName} - ${user.companyTitle}</span></div>
                        <div><span>Departamento:</span><span>${user.companyDepartment}</span></div>
                        <div><span>Dirección empresa:</span><span>${user.companyAddress}, ${user.companyCity}</span></div>
                    </div>

                    <div class="button-container">
                        <a href="editar/${user.id}"><button class="edit-button">Editar</button></a>
                        <button class="delete-button" onclick="confirmarBorrado(${user.id})">Borrar</button>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p style="text-align: center;">No hay clientes registrados.</p>
        </c:otherwise>
    </c:choose>

    <form action="/administrador" method="get">
        <button type="submit" class="btn-volver">Volver Atrás</button>
    </form>
</div>
</body>
</html>