<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Página JSP Sencilla</title>
    <link rel="stylesheet" type="text/css" href="style3.css">

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
	       
		   <form action="/cliente" method="get">
		       <button type="submit" class="cliente-btn">Ver Clientes</button>
		   </form>
		   
	       <br>
	       
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
