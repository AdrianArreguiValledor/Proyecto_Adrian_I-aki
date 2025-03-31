<!DOCTYPE html>
<html>
<head>
    <title>Administrador</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
		
		<!-- Imagen de administrador -->
		<img src="imagenes/administrador.png" alt="administrador" class="administrador">
				
				
				
        <h2>Panel de Administrador</h2>

        <!-- Mostrar el nombre del usuario -->
        <p class="usuario"><strong>Usuario:</strong> ${usuario}</p>

        <!-- Mostrar el mensaje -->
        <p>${mensaje}</p>

        <!-- Enlace para redirigir a la página principal -->
        <form action="/principal" method="get">
            <button type="submit" class="principal-btn">Volver atras</button>
        </form>
    </div>
</body>
</html>
