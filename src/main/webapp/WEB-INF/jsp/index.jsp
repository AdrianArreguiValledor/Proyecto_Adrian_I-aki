<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
</head>
<body>
    <h2>Iniciar Sesión</h2>
    
    <%-- Muestra un mensaje de error si existe --%>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
 
    <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
 
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required><br><br>
 
        <button type="submit">Ingresar</button>
    </form>
	
	<br>
	    
	    <%-- Botón para ir a pedido.jsp --%>
	    <form action="pedido" method="get">
	        <button type="submit">Ir a Hacer Pedido</button>
	    </form>
</body>
</html>
 