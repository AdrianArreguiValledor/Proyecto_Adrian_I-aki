<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Usuario</title>
    <style>
		    /* Estilo general de la página */
		    body {
		        font-family: 'Poppins', sans-serif; /* Fuente de texto */
		        background: linear-gradient(to right, #004080, #66ccff); /* Fondo de gradiente, de azul oscuro a azul claro */
		        margin: 0; /* Elimina márgenes */
		        padding: 0; /* Elimina relleno */
		        display: flex; /* Usa Flexbox para organizar los elementos */
		        justify-content: center; /* Centra el contenido horizontalmente */
		        align-items: center; /* Centra el contenido verticalmente */
		        height: 100vh; /* Hace que el body ocupe toda la altura de la ventana */
		        animation: fadeIn 1s ease-in-out; /* Animación de desvanecimiento al cargar la página */
		    }

		    /* Contenedor del formulario */
		    .form-container {
		        background: white; /* Fondo blanco */
		        padding: 40px; /* Relleno interno */
		        border-radius: 12px; /* Bordes redondeados */
		        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Sombra ligera */
		        width: 50%; /* Ancho al 50% */
		        max-width: 800px; /* Máximo ancho de 800px */
		        text-align: center; /* Centra el texto */
		        opacity: 0; /* Inicialmente invisible */
		        animation: slideIn 0.8s forwards 0.5s; /* Animación de deslizamiento para el formulario */
		    }

		    /* Título del formulario */
		    .form-container h1 {
		        color: #003366; /* Color azul oscuro */
		        font-size: 24px; /* Tamaño de fuente */
		        margin-bottom: 20px; /* Espacio debajo del título */
		        animation: fadeInTitle 1s ease-in-out; /* Animación de desvanecimiento para el título */
		    }

		    /* Campos de entrada y select */
		    .form-container input, .form-container select {
		        width: 100%; /* Ancho completo */
		        padding: 12px; /* Relleno interno */
		        margin: 10px 0; /* Espacio vertical entre los campos */
		        border-radius: 8px; /* Bordes redondeados */
		        border: 1px solid #ccc; /* Borde gris */
		        font-size: 16px; /* Tamaño de fuente */
		        box-sizing: border-box; /* Asegura que el relleno se incluye en el ancho total */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInInput 1s ease-in-out forwards; /* Animación de desvanecimiento para los campos */
		    }

		    /* Estilo para el botón de Guardar Usuario */
		    .form-container button {
		        padding: 12px; /* Relleno interno */
		        background-color: #28a745; /* Fondo verde */
		        color: white; /* Texto blanco */
		        font-size: 16px; /* Tamaño de fuente */
		        border: none; /* Sin borde */
		        border-radius: 8px; /* Bordes redondeados */
		        cursor: pointer; /* Cambia el cursor cuando pasa sobre el botón */
		        transition: 0.3s ease; /* Efecto de transición */
		        width: 100%; /* Ancho completo */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInButton 1s ease-in-out forwards 1s; /* Animación de desvanecimiento para el botón */
		    }

		    /* Efecto de zoom en el botón de Guardar Usuario */
		    .form-container button:hover {
		        background-color: #218838; /* Fondo verde más oscuro al pasar el ratón */
		        transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
		    }

		    /* Botón de Volver */
		    .back-button {
		        display: block; /* Hace que el botón ocupe toda la línea */
		        width: 100%; /* Ancho completo */
		        padding: 12px; /* Relleno interno */
		        margin-top: 10px; /* Espacio superior */
		        text-align: center; /* Centra el texto dentro del botón */
		        background-color: #007bff; /* Fondo azul */
		        color: white; /* Texto blanco */
		        border-radius: 8px; /* Bordes redondeados */
		        text-decoration: none; /* Elimina subrayado */
		        font-size: 16px; /* Tamaño de fuente */
		        transition: 0.3s ease; /* Efecto de transición */
		        border: none; /* Sin borde */
		        cursor: pointer; /* Cambia el cursor al pasar sobre el botón */
		        opacity: 0; /* Inicialmente invisible */
		        animation: fadeInBackButton 1s ease-in-out forwards 1.2s; /* Animación de desvanecimiento para el botón de volver */
		    }

		    /* Efecto de zoom en el botón de Volver */
		    .back-button:hover {
		        background-color: #0056b3; /* Fondo azul más oscuro al pasar el ratón */
		        transform: scale(1.05); /* Aumenta un 5% el tamaño del botón */
		    }

		    /* Etiquetas */
		    .form-container label {
		        font-size: 16px; /* Tamaño de fuente */
		        font-weight: bold; /* Texto en negrita */
		        color: #333; /* Color gris oscuro */
		        display: block; /* Hace que la etiqueta ocupe toda la línea */
		        margin-top: 15px; /* Espacio superior */
		        text-align: left; /* Alineación a la izquierda */
		    }

		    /* Animaciones */
		    @keyframes fadeIn {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInTitle {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes slideIn {
		        0% {
		            transform: translateY(-30px); /* Inicialmente desplazado hacia arriba */
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            transform: translateY(0); /* Vuelve a la posición original */
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInInput {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInButton {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    @keyframes fadeInBackButton {
		        0% {
		            opacity: 0; /* Inicialmente invisible */
		        }
		        100% {
		            opacity: 1; /* Totalmente visible */
		        }
		    }

		    /* Estilo para la sección de Tabs (pestañas) */
		    .tab {
		        display: none;
		    }

		    .tab-header {
		        display: flex;
		        justify-content: space-around;
		        margin-bottom: 20px;
		        cursor: pointer;
		        padding: 10px;
		        background-color: #f1f1f1;
		        border-radius: 5px 5px 0 0;
		    }

		    .tab-header div {
		        padding: 10px;
		        background-color: #ddd;
		        border-radius: 5px;
		        margin: 0 5px;
		        transition: background-color 0.3s;
		    }

		    .tab-header div:hover {
		        background-color: #ccc;
		    }

		    .tab-content {
		        display: flex;
		        flex-direction: column;
		    }

		    .tab-button {
		        padding: 10px;
		        cursor: pointer;
		        transition: background-color 0.3s ease;
		    }

		    .tab-button:hover {
		        background-color: #ddd;
		    }

		    .active {
		        background-color: #4CAF50;
		        color: white;
		    }

		</style>
		
		<script>
		    // Esta función cambiará entre las pestañas
		    function openTab(tabIndex) {
		        // Obtener todas las pestañas
		        var tabs = document.querySelectorAll('.tab');
		        var tabButtons = document.querySelectorAll('.tab-button');

		        // Ocultar todas las pestañas
		        tabs.forEach(function(tab, index) {
		            tab.style.display = 'none';
		            tabButtons[index].classList.remove('active');
		        });

		        // Mostrar la pestaña seleccionada
		        tabs[tabIndex].style.display = 'block';
		        tabButtons[tabIndex].classList.add('active');
		    }
		</script>
		
</head>
<body>
    <div class="form-container">
        <h1>Insertar Nuevo Usuario</h1>
        <form action="/guardar" method="post">
			<div class="tab-header">
			               <div onclick="openTab(0)" class="tab-button active">Información Personal</div>
			               <div onclick="openTab(1)" class="tab-button">Datos de Contacto</div>
			               <div onclick="openTab(2)" class="tab-button">Información de la Empresa</div>
			           </div>

			           <!-- Sección 1: Información Personal -->
			           <div class="tab" style="display:block;">
			               <div class="tab-content">
							<label for="username">Nombre de Usuario:</label>
							<input type="text" id="username" name="username" value="${usuario.username}">
			                  
							 <label for="firstName">Primer Nombre:</label>
			                   <input type="text" id="firstName" name="firstName" value="${usuario.firstName}">

			                   <label for="lastName">Apellido:</label>
			                   <input type="text" id="lastName" name="lastName" value="${usuario.lastName}">

			                   <label for="maidenName">Apellido de Soltera:</label>
			                   <input type="text" id="maidenName" name="maidenName" value="${usuario.maidenName}">

			                   <label for="age">Edad:</label>
			                   <input type="number" id="age" name="age" value="${usuario.age}">

			                   <label for="gender">Género:</label>
			                   <input type="text" id="gender" name="gender" value="${usuario.gender}">

			                   <label for="birthDate">Fecha de Nacimiento:</label>
			                   <input type="date" id="birthDate" name="birthDate" value="${usuario.birthDate}">

			                   <label for="bloodGroup">Grupo Sanguíneo:</label>
			                   <input type="text" id="bloodGroup" name="bloodGroup" value="${usuario.bloodGroup}">

			                   <label for="height">Altura (m):</label>
			                   <input type="number" step="0.01" id="height" name="height" value="${usuario.height}">

			                   <label for="weight">Peso (kg):</label>
			                   <input type="number" step="0.01" id="weight" name="weight" value="${usuario.weight}">

			                   <label for="eyeColor">Color de Ojos:</label>
			                   <input type="text" id="eyeColor" name="eyeColor" value="${usuario.eyeColor}">

			                   <label for="hairColor">Color de Cabello:</label>
			                   <input type="text" id="hairColor" name="hairColor" value="${usuario.hairColor}">

							<label for="userAgent">Agente de Usuario:</label>
							<input type="text" id="userAgent" name="userAgent" value="${usuario.userAgent}">
									
			                   <label for="hairType">Tipo de Cabello:</label>
			                   <input type="text" id="hairType" name="hairType" value="${usuario.hairType}">

			                   <label for="image">Imagen:</label>
			                   <input type="text" id="image" name="image" value="${usuario.image}">

			                   <label for="macAddress">Dirección MAC:</label>
			                   <input type="text" id="macAddress" name="macAddress" value="${usuario.macAddress}">

			                   <label for="university">Universidad:</label>
			                   <input type="text" id="university" name="university" value="${usuario.university}">

							<!-- Campo para 'ssn' (Número de Seguro Social) -->
							<label for="ssn">Número de Seguro Social:</label>
							<input type="text" id="ssn" name="ssn" value="${usuario.ssn}">
								   
			                   <label for="role">Rol:</label>
			                   <input type="text" id="role" name="role" value="${usuario.role}">
			               </div>
			           </div>

			           <!-- Sección 2: Datos de Contacto -->
			           <div class="tab">
			               <div class="tab-content">
			                   <label for="email">Correo Electrónico:</label>
			                   <input type="email" id="email" name="email" value="${usuario.email}">

							<label for="password">Contraseña:</label>
							<input type="password" id="password" name="password" value="${usuario.password}">
			                 
							  <label for="phone">Teléfono:</label>
			                   <input type="tel" id="phone" name="phone" value="${usuario.phone}">

			                   <label for="address">Dirección:</label>
			                   <input type="text" id="address" name="address" value="${usuario.address}">

			                   <label for="city">Ciudad:</label>
			                   <input type="text" id="city" name="city" value="${usuario.city}">

			                   <label for="state">Estado:</label>
			                   <input type="text" id="state" name="state" value="${usuario.state}">

			                   <label for="stateCode">Código del Estado:</label>
			                   <input type="text" id="stateCode" name="stateCode" value="${usuario.stateCode}">

			                   <label for="postalCode">Código Postal:</label>
			                   <input type="text" id="postalCode" name="postalCode" value="${usuario.postalCode}">

			                   <label for="lat">Latitud:</label>
			                   <input type="number" step="0.000001" id="lat" name="lat" value="${usuario.lat}">

			                   <label for="lng">Longitud:</label>
			                   <input type="number" step="0.000001" id="lng" name="lng" value="${usuario.lng}">

			                   <label for="country">País:</label>
			                   <input type="text" id="country" name="country" value="${usuario.country}">
			               </div>
			           </div>

			           <!-- Sección 3: Información de la Empresa -->
			           <div class="tab">
			               <div class="tab-content">
			                   <label for="companyName">Nombre de la Empresa:</label>
			                   <input type="text" id="companyName" name="companyName" value="${usuario.companyName}">

			                   <label for="companyAddress">Dirección de la Empresa:</label>
			                   <input type="text" id="companyAddress" name="companyAddress" value="${usuario.companyAddress}">

			                   <label for="companyCity">Ciudad de la Empresa:</label>
			                   <input type="text" id="companyCity" name="companyCity" value="${usuario.companyCity}">

			                   <label for="companyState">Estado de la Empresa:</label>
			                   <input type="text" id="companyState" name="companyState" value="${usuario.companyState}">

			                   <label for="companyStateCode">Código del Estado de la Empresa:</label>
			                   <input type="text" id="companyStateCode" name="companyStateCode" value="${usuario.companyStateCode}">

			                   <label for="companyPostalCode">Código Postal de la Empresa:</label>
			                   <input type="text" id="companyPostalCode" name="companyPostalCode" value="${usuario.companyPostalCode}">

			                   <label for="companyLat">Latitud de la Empresa:</label>
			                   <input type="number" step="0.000001" id="companyLat" name="companyLat" value="${usuario.companyLat}">

			                   <label for="companyLng">Longitud de la Empresa:</label>
			                   <input type="number" step="0.000001" id="companyLng" name="companyLng" value="${usuario.companyLng}">

			                   <label for="companyCountry">País de la Empresa:</label>
			                   <input type="text" id="companyCountry" name="companyCountry" value="${usuario.companyCountry}">

			                   <label for="companyDepartment">Departamento de la Empresa:</label>
			                   <input type="text" id="companyDepartment" name="companyDepartment" value="${usuario.companyDepartment}">

			                   <label for="companyTitle">Título en la Empresa:</label>
			                   <input type="text" id="companyTitle" name="companyTitle" value="${usuario.companyTitle}">

			                   <label for="ein">Número de Identificación del Empleador (EIN):</label>
			                   <input type="text" id="ein" name="ein" value="${usuario.ein}">

			                   <label for="bankCardNumber">Número de Tarjeta Bancaria:</label>
			                   <input type="text" id="bankCardNumber" name="bankCardNumber" value="${usuario.bankCardNumber}">

			                   <label for="bankCardType">Tipo de Tarjeta Bancaria:</label>
			                   <input type="text" id="bankCardType" name="bankCardType" value="${usuario.bankCardType}">

			                   <label for="bankCurrency">Moneda del Banco:</label>
			                   <input type="text" id="bankCurrency" name="bankCurrency" value="${usuario.bankCurrency}">

			                   <label for="bankIban">IBAN del Banco:</label>
			                   <input type="text" id="bankIban" name="bankIban" value="${usuario.bankIban}">

			                   <label for="cryptoCoin">Moneda Cripto:</label>
			                   <input type="text" id="cryptoCoin" name="cryptoCoin" value="${usuario.cryptoCoin}">

			                   <label for="cryptoWallet">Cartera Cripto:</label>
			                   <input type="text" id="cryptoWallet" name="cryptoWallet" value="${usuario.cryptoWallet}">

			                   <label for="cryptoNetwork">Red Cripto:</label>
			                   <input type="text" id="cryptoNetwork" name="cryptoNetwork" value="${usuario.cryptoNetwork}">
			               </div>
			           </div>
            <br><br>
            <button type="submit">Guardar Usuario</button>
            <br><br>
            <a href="/cliente" class="back-button">Volver Atras</a>
        </form>
    </div>
</body>
</html>
