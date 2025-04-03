<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pagina JSP Sencilla</title>
    <style>
		/* Estilos generales */
		      body {
		          font-family: Arial, sans-serif; /* Fuente de texto */
		          background: linear-gradient(to bottom, #003366, #66ccff); /* De azul oscuro a azul claro */
		          margin: 0; /* Elimina márgenes */
		          padding: 0; /* Elimina relleno */
		          display: flex; /* Usa Flexbox para organizar los elementos */
		          flex-direction: column; /* Coloca los elementos en columna */
		          align-items: center; /* Centra el contenido horizontalmente */
		          justify-content: center; /* Centra el contenido verticalmente */
		          height: 100vh; /* Hace que el body ocupe toda la altura de la ventana */
		          text-align: center; /* Centra el texto */
		          animation: fadeIn 1s ease-out; /* Animación de desvanecimiento */
		      }

		      /* Contenedor principal */
		      .container {
		          background-color: rgb(85, 85, 85); /* Fondo gris oscuro */
		          color: #fff; /* Texto blanco */
		          padding: 40px; /* Relleno interno */
		          border-radius: 10px; /* Bordes redondeados */
		          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra ligera */
		          transition: background-color 0.3s ease; /* Transición suave del color de fondo */
		          max-width: 800px; /* Máximo ancho de 800px */
		          margin: auto; /* Centra el contenedor */
		          opacity: 0; /* Inicialmente invisible */
		          animation: slideIn 1s forwards; /* Animación de deslizamiento */
		      }

		      /* Efecto al pasar el ratón por encima */
		      .container:hover {
		          background-color: #333; /* Fondo más oscuro al pasar el ratón */
		      }

		      /* Titulo principal */
		      h1 {
		          font-weight: bold; /* Negrita */
		          color: #fff; /* Texto blanco */
		          margin-top: 0; /* Elimina el margen superior */
		          padding-top: 20px; /* Relleno superior */
		          font-size: 35px; /* Tamaño de fuente */
		      }

		      /* Estilo para los mensajes */
		      p {
		          font-weight: normal; /* Texto normal */
		          color: #fff; /* Texto blanco */
		      }

		      /* Estilo para los botones */
		      button {
		          padding: 10px 20px; /* Relleno interno */
		          font-size: 16px; /* Tamaño de fuente */
		          font-weight: bold; /* Negrita */
		          border-radius: 5px; /* Bordes redondeados */
		          cursor: pointer; /* Cambia el cursor cuando pasa sobre el botón */
		          border: none; /* Sin borde */
		          margin-top: 20px; /* Espacio superior */
		          transition: transform 0.3s ease, background-color 0.3s ease; /* Efecto de transición */
		      }

		      button:hover {
		          transform: scale(1.1); /* Aumenta un 10% el tamaño al pasar el ratón */
		      }

		      .volver-btn {
		          background-color: #007BFF; /* Fondo azul */
		          color: white; /* Texto blanco */
		      }

		      .volver-btn:hover {
		          background-color: #0056b3; /* Fondo más oscuro al pasar el ratón */
		      }

		      .administrador-btn {
		          background-color: red; /* Fondo rojo */
		          color: white; /* Texto blanco */
		      }

		      .administrador-btn:hover {
		          background-color: rgb(193, 2, 46); /* Fondo más oscuro al pasar el ratón */
		      }

		      /* Estilo para el contenedor con scroll */
		      .scroll-container {
		          overflow-y: scroll; /* Activa el desplazamiento vertical */
		          height: 400px; /* Altura máxima de 400px */
		          padding: 10px; /* Relleno interno */
		          border: 1px solid #ddd; /* Borde gris claro */
		          background-color: red; /* Fondo rojo */
		          margin-top: 20px; /* Espacio superior */
		          color: #333; /* Color de texto gris oscuro */
		          max-width: 95%; /* Máximo ancho del 95% */
		          animation: scrollIn 1s ease-out; /* Animación de deslizamiento */
		          transition: background-color 0.3s ease, transform 0.3s ease; /* Transición suave */
		      }

		      .scroll-container:hover {
		          transform: scale(1.05); /* Aumenta el tamaño al pasar el ratón */
		          background-color: darkred; /* Fondo más oscuro al pasar el ratón */
		      }

		      /* Estilo para los párrafos de error */
		      .error {
		          color: red; /* Color rojo */
		          font-size: 14px; /* Tamaño de fuente */
		          text-align: center; /* Centra el texto */
		          margin-top: 20px; /* Espacio superior */
		      }

		      /* Estilo para los elementos de la pagina de usuario */
		      h2 {
		          font-size: 30px; /* Tamaño de fuente */
		          color: #fff; /* Texto blanco */
		          font-weight: bold; /* Negrita */
		          margin-top: 20px; /* Espacio superior */
		      }

		      strong {
		          color: #ffeb3b; /* Color amarillo */
		      }

		      /* Animaciones */
		      @keyframes slideIn {
		          from {
		              opacity: 0; /* Comienza invisible */
		              transform: translateY(-20px); /* Desplazado hacia arriba */
		          }
		          to {
		              opacity: 1; /* Totalmente visible */
		              transform: translateY(0); /* Regresa a su posición original */
		          }
		      }

		      @keyframes fadeIn {
		          from {
		              opacity: 0; /* Comienza invisible */
		          }
		          to {
		              opacity: 1; /* Totalmente visible */
		          }
		      }

		      @keyframes scrollIn {
		          from {
		              opacity: 0; /* Comienza invisible */
		              transform: translateY(20px); /* Desplazado hacia abajo */
		          }
		          to {
		              opacity: 1; /* Totalmente visible */
		              transform: translateY(0); /* Regresa a su posición original */
		          }
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

    <script>
        // Añadir interactividad al cargar la pagina
        window.onload = function() {
            // Efecto de animacion al cargar la pagina
            const container = document.querySelector('.container');
            container.style.animation = 'slideIn 1s forwards';

            // Mostrar mensaje de bienvenida con nombre si esta presente
            const nameParam = new URLSearchParams(window.location.search).get('name');
            if (nameParam) {
                document.querySelector('h1').textContent = `Bienvenido, ${nameParam}!`;
            }
        };
    </script>
</body>
</html>
