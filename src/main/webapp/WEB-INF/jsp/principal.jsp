<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Página JSP Sencilla</title>
    <style>
		/* Estilos generales */
		body {
		    font-family: Arial, sans-serif;
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Azul oscuro a azul claro */
		    margin: 0;
		    padding: 0;
		    display: flex;
		    flex-direction: column; /* Para apilar los elementos */
		    align-items: center; /* Centrar horizontalmente */
		    justify-content: center; /* Centrar verticalmente */
		    height: 100vh; /* Asegura que ocupe toda la altura de la pantalla */
		    text-align: center;
		}

		/* Contenedor principal */
		.container {
		    background-color: rgb(85, 85, 85); /* Fondo negro */
		    color: #fff; /* Texto en blanco */
		    padding: 40px; /* Espacio alrededor del contenido */
		    border-radius: 10px; /* Bordes redondeados */
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
		    transition: background-color 0.3s ease; /* Transición suave al cambiar el color */
		    max-width: 800px; /* Controla el ancho del contenedor */
		    margin: auto; /* Centra el contenedor horizontalmente */
		}

		/* Efecto al pasar el ratón por encima */
		.container:hover {
		    background-color: #333; /* Un tono gris oscuro para el hover */
		}

		/* Título principal */
		h1 {
		    font-weight: bold; /* Negrita en el título */
		    color: #fff; /* Color blanco en el título */
		    margin-top: 0; /* Asegura que no haya margen superior */
		    padding-top: 20px; /* Añade un poco de espacio superior si lo deseas */
		    font-size: 35px; /* Tamaño de fuente más grande */
		}

		/* Estilo para los mensajes */
		p {
		    font-weight: normal; /* Los párrafos no son negritas */
		    color: #fff; /* Texto blanco en los párrafos */
		}

		/* Estilo para el botón de volver al login */
		.volver-btn {
		    background-color: #007BFF; /* Fondo azul */
		    color: white; /* Texto blanco */
		    font-weight: bold;
		    padding: 10px 20px; /* Espaciado alrededor del texto */
		    border: none; /* Sin borde */
		    border-radius: 5px; /* Bordes redondeados */
		    cursor: pointer; /* Aparece como puntero */
		    font-size: 16px;
		    transition: background-color 0.3s ease; /* Transición suave */
		    margin-top: 20px; /* Espacio superior para separarlo de los elementos anteriores */
		}

		.volver-btn:hover {
		    background-color: #0056b3; /* Cambia el color a un tono más oscuro al pasar el ratón */
		}

		/* Estilo para el botón de administrador */
		.administrador-btn {
		    background-color: red; /* Fondo rojo */
		    font-weight: bold;
		    color: white; /* Texto blanco */
		    padding: 10px 20px; /* Espaciado alrededor del texto */
		    border: none; /* Sin borde */
		    border-radius: 5px; /* Bordes redondeados */
		    cursor: pointer; /* Aparece como puntero */
		    font-size: 16px;
		    transition: background-color 0.3s ease; /* Transición suave */
		    margin-top: 20px; /* Espacio superior para separarlo de los elementos anteriores */
		}

		.administrador-btn:hover {
		    background-color: rgb(193, 2, 46); /* Tono rojo más oscuro al pasar el ratón */
		}

		/* Estilo para el contenedor con scroll */
		.scroll-container {
		    overflow-y: scroll;
		    height: 400px; /* Establece una altura fija para el scroll */
		    padding: 10px;
		    border: 1px solid #ddd;
		    background-color: rgb(255, 0, 0);
		    margin-top: 20px; /* Espacio superior para separarlo de los elementos anteriores */
		}

		/* Estilo para los párrafos de error */
		.error {
		    color: red;
		    font-size: 14px;
		    text-align: center;
		    margin-top: 20px; /* Espacio superior */
		}

		/* Estilo para los elementos de la página de usuario */
		h2 {
		    font-size: 30px; /* Tamaño más grande para el subtítulo */
		    color: #fff; /* Texto en blanco */
		    font-weight: bold; /* Negrita */
		    margin-top: 20px; /* Espacio superior */
		}

		strong {
		    color: #ffeb3b; /* Color dorado para los elementos destacados */
		}
	</style>	
	</head>
	
<body>
	<div class="container">
	       <h1>Bienvenido a tu primera pagina JSP!</h1>
	       <p>Esta es una pagina JSP simple.</p>
	       <p>El tiempo de ejecucion de la pagina JSP es: <%= new java.util.Date() %></p>

	       <c:choose>
	           <c:when test="${not empty param.name}">
	               <p>Hola, <b>${param.name}</b>!</p>
	           </c:when>
	           <c:otherwise>
	               <p>Hola, visitante!</p>
	           </c:otherwise>
	       </c:choose>

	       <p>Para personalizar el saludo, agrega el parametro <code>?name=TuNombre</code> a la URL.</p>
	       <br>

	       <c:if test="${sessionScope.rol == 'Administrador'}">
	           <form action="/administrador" method="get">
	               <button type="submit" class="administrador-btn">Ir al Administrador</button>
	           </form>
	           <br><br>
	       </c:if>
			
		
	       <form action="/index" method="get">
	           <button type="submit" class="volver-btn">Volver al Login</button>
	       </form>

	       <br><br>
	       
	       <div class="scroll-container">
	           <h2>Informacion del Usuario</h2>
	           <p><strong>Nombre:</strong> Emily Johnson</p>
	           <p><strong>Nombre de Soltera:</strong> Smith</p>
	           <p><strong>Edad:</strong> 28</p>
	           <p><strong>Genero:</strong> Femenino</p>
	           <p><strong>Email:</strong> emily.johnson@x.dummyjson.com</p>
	           <p><strong>Telefono:</strong> +81 965-431-3024</p>
	           <p><strong>Usuario:</strong> emilys</p>
	           <p><strong>Fecha de Nacimiento:</strong> 30 de mayo de 1996</p>
	           <p><strong>Grupo Sanguineo:</strong> O-</p>
	           <p><strong>Altura:</strong> 193.24 cm</p>
	           <p><strong>Peso:</strong> 63.16 kg</p>
	           <p><strong>Color de ojos:</strong> Verde</p>
	           <p><strong>Cabello:</strong> Marron, Rizado</p>
	           <p><strong>Direccion:</strong> 626 Main Street, Phoenix, Mississippi, 29112</p>
	           <p><strong>Universidad:</strong> University of Wisconsin--Madison</p>
	           <p><strong>Trabajo:</strong> Sales Manager en Dooley, Kozey and Cronin</p>
	           <p><strong>Departamento:</strong> Ingenieria</p>
	           <p><strong>Tarjeta Bancaria:</strong> 9289 **** **** 1815 (Elo)</p>
	           <p><strong>Criptomoneda:</strong> Bitcoin (Ethereum ERC20)</p>
	           <p><strong>Rol:</strong> Administrador</p>
	       </div>
	   </div>
</body>
</html>
