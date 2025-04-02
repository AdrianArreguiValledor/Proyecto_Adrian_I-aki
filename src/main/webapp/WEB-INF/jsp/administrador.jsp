<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Administrador</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Panel de Administrador</h2>

        <p class="usuario"><strong>Usuario:</strong> ${usuario}</p>
        <p>${mensaje}</p>
        <br>

        <!-- Botón para ver productos -->
        <form action="/administrador/prueba" method="get">
            <button type="submit" class="btn-ver-productos">Ver Productos</button>
        </form>

        <form action="/principal" method="get">
            <button type="submit" class="btn-volver">Volver atrás</button>
        </form>
    </div>
</body>
</html>
