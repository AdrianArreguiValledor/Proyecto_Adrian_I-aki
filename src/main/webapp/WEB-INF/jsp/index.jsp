<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container">
	    <h2>INICIAR SESIÓN</h2>
	    
	    <form id="login-form" action="login" method="post">
	        <label for="email">Email:</label>
	        <input type="email" id="email" name="email" required=""><br><br>

	        <label for="password">Contraseña:</label>
	        <input type="password" id="password" name="password" required=""><br><br>

	        <button type="submit">Ingresar</button>
	    </form>

	    <!-- Botón para ir a hacer pedido -->
	    <form action="pedido" method="get">
	        <button type="submit" class="pedido-btn">Ir a Hacer Pedido</button>
	    </form>
	</div>

	</body>
	</html>
 