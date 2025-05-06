<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insertar Usuario</title>
    <!-- Meta tag para hacer la página responsiva -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        /* Estilo general de la página */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #004080, #66ccff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
            overflow: hidden; /* Evita que aparezca scroll en la ventana */
        }

        label {
            font-weight: bold;
        }

        /* Contenedor del formulario */
        .form-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 900px; /* Máximo ancho de 900px */
            text-align: center;
            overflow-y: auto; /* Permite el desplazamiento solo cuando sea necesario */
            height: 90vh; /* Toma el 90% de la altura de la pantalla */
        }

        /* Título del formulario */
        .form-container h1 {
            color: #003366;
            font-size: 24px;
            margin-bottom: 20px;
            animation: fadeInTitle 1s ease-in-out;
        }

        /* Campos de entrada y select */
        .form-container input, .form-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Estilo para el botón de Guardar Usuario */
        .form-container button {
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
            width: 100%;
        }

        .form-container button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Estilo para los botones de las pestañas */
        .tab-header {
            display: flex;
            justify-content: space-evenly;
            margin-bottom: 20px;
            border-bottom: 2px solid #ccc;
        }

        .tab-button {
            padding: 12px 24px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            background-color: #f2f2f2;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .tab-button.active {
            background-color: #004080;
            color: white;
            transform: scale(1.05);
        }

        .tab-button:hover {
            background-color: #e6e6e6;
            transform: scale(1.05);
        }

        /* Botón de Volver */
        .back-button {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            text-align: center;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
            transition: 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Animaciones */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInTitle {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            0% {
                transform: translateY(-30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Media query para pantallas pequeñas */
        @media screen and (max-width: 768px) {
            .form-container {
                padding: 20px;
                width: 90%; /* Ancho del formulario en pantallas pequeñas */
            }

            .form-container h1 {
                font-size: 20px;
            }

            .form-container input, .form-container select, .form-container button {
                font-size: 14px; /* Reducir el tamaño de la fuente en pantallas pequeñas */
            }

            .back-button {
                font-size: 14px; /* Reducir el tamaño del botón */
            }
        }
        
        /* Media query para pantallas muy pequeñas (móviles) */
        @media screen and (max-width: 480px) {
            .form-container {
                padding: 10px;
            }

            .tab-header {
                flex-direction: column;
            }

            .tab-button {
                padding: 8px 16px;
                font-size: 14px;
            }

            .tab-button.active {
                transform: none;
            }
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

            // Esta función actualizará el campo de imagen basado en el nombre de usuario
            function updateImageUrl() {
                var username = document.getElementById("username").value;
                var imageField = document.getElementById("image");
                imageField.value = "https://dummyjson.com/icon/" + username.toLowerCase() + "/128"; // Cambia el nombre por el nombre de usuario
            }
		</script>
		
</head>
<body>
    <div class="form-container">
        <h1>Insertar Nuevo Usuario</h1>
        <form action="/guardar" method="post">
			<div class="tab-header">
				<div onclick="openTab(0)" class="tab-button active">Informacion Personal</div>
				<div onclick="openTab(1)" class="tab-button">Datos de Contacto</div>
				<div onclick="openTab(2)" class="tab-button">Informacion de la Empresa</div>
			</div>

			<!-- Sección 1: Información Personal -->
			<div class="tab" style="display:block;">
				<div class="tab-content">
					<br><br>
					<label for="username">Nombre de Usuario:</label>
					<input type="text" id="username" name="username" value="${usuario.username}" oninput="updateImageUrl()">
					<br><br>
					
					<label for="firstName">Primer Nombre:</label>
					<input type="text" id="firstName" name="firstName" value="${usuario.firstName}">
					<br><br>
					
					<label for="lastName">Apellido:</label>
					<input type="text" id="lastName" name="lastName" value="${usuario.lastName}">
					<br><br>
					
					<label for="maidenName">Apellido de Soltera:</label>
					<input type="text" id="maidenName" name="maidenName" value="${usuario.maidenName}">
					<br><br>
					
					<label for="age">Edad:</label>
					<input type="number" id="age" name="age" value="${usuario.age}" min="0">
					<br><br>
					
					<label for="gender">Genero:</label>
					<select id="gender" name="gender">
						<option value="Masculino" ${usuario.gender == 'Masculino' ? 'selected' : ''}>Masculino</option>
						<option value="Femenino" ${usuario.gender == 'Femenino' ? 'selected' : ''}>Femenino</option>
					</select>
					<br><br>
					
					<label for="birthDate">Fecha de Nacimiento:</label>
					<input type="date" id="birthDate" name="birthDate" value="${usuario.birthDate}">
					<br><br>
					
					<label for="bloodGroup">Grupo Sanguineo:</label>
					<select id="bloodGroup" name="bloodGroup">
						<option value="A+" ${usuario.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
						<option value="A-" ${usuario.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
						<option value="B+" ${usuario.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
						<option value="B-" ${usuario.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
						<option value="O+" ${usuario.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
						<option value="O-" ${usuario .bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
						<option value="AB+" ${usuario.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
						<option value="AB-" ${usuario.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
					</select>
					<br><br>
					
					<label for="height">Altura (m):</label>
					<input type="number" step="0.01" id="height" name="height" value="${usuario.height}" min="0">
					<br><br>
					
					<label for="weight">Peso (kg):</label>
					<input type="number" step="0.01" id="weight" name="weight" value="${usuario.weight}" min="0">
					<br><br>
					
					<label for="eyeColor">Color de Ojos:</label>
					<input type="text" id="eyeColor" name="eyeColor" value="${usuario.eyeColor}">
					<br><br>
					
					<label for="hairColor">Color de Cabello:</label>
					<input type="text" id="hairColor" name="hairColor" value="${usuario.hairColor}">
					<br><br>
					
					<label for="userAgent">Agente de Usuario:</label>
					<input type="text" id="userAgent" name="userAgent" value="${usuario.userAgent}">
					<br><br>
					
					<label for="hairType">Tipo de Cabello:</label>
					<select id="hairType" name="hairType">
						<option value="Lacio" ${usuario.hairType == 'Lacio' ? 'selected' : ''}>Lacio</option>
						<option value="Rizado" ${usuario.hairType == 'Rizado' ? 'selected' : ''}>Rizado</option>
						<option value="Ondulado" ${usuario.hairType == 'Ondulado' ? 'selected' : ''}>Ondulado</option>
						<option value="Crespo" ${usuario.hairType == 'Crespo' ? 'selected' : ''}>Crespo</option>
						<option value="Otros" ${usuario.hairType == 'Otros' ? 'selected' : ''}>Otros</option>
					</select>
					<br><br>
					
					<label for="image">Imagen:</label>
					<input type="text" id="image" name="image" value="${usuario.image}" readonly>
					<br><br>
					
					<label for="macAddress">Direccion MAC:</label>
					<input type="text" id="macAddress" name="macAddress" value="${usuario.macAddress}">
					<br><br>
					
					<label for="university">Universidad:</label>
					<input type="text" id="university" name="university" value="${usuario.university}">
					<br><br>
					
					<label for="ssn">Numero de Seguro Social:</label>
					<input type="text" id="ssn" name="ssn" value="${usuario.ssn}">
					<br><br>
					
					<label for="role">Rol:</label>
					<select id="role" name="role">
						<option value="Admin" ${usuario.role == 'Admin' ? 'selected' : ''}>Admin</option>
						<option value="Usuario" ${usuario.role == 'Usuario' ? 'selected' : ''}>Usuario</option>
					</select>
				</div>
			</div>

			<!-- Sección 2: Datos de Contacto -->
			<div class="tab">
				<div class="tab-content">
					<br><br>
					<label for="email">Correo Electronico:</label>
					<input type="email" id="email" name="email" value="${usuario.email}">
					<br><br>
					
					<label for="password">Contrasena:</label>
					<input type="password" id="password" name="password" value="${usuario.password}">
					<br><br>
					
					<label for="phone">Telefono:</label>
					<input type="tel" id="phone" name="phone" value="${usuario.phone}">
					<br><br>
					
					<label for="address">Direccion:</label>
					<input type="text" id="address" name="address" value="${usuario.address}">
					<br><br>
					
					<label for="city">Ciudad:</label>
					<input type="text" id="city" name="city" value="${usuario.city}">
					<br><br>
					
					<label for="state">Estado:</label>
					<input type="text" id="state" name ="state" value="${usuario.state}">
					<br><br>
					
					<label for="stateCode">Codigo del Estado:</label>
					<input type="text" id="stateCode" name="stateCode" value="${usuario.stateCode}">
					<br><br>
					
					<label for="postalCode">Codigo Postal:</label>
					<input type="text" id="postalCode" name="postalCode" value="${usuario.postalCode}">
					<br><br>
					
					<label for="lat">Latitud:</label>
					<input type="number" step="0.000001" id="lat" name="lat" value="${usuario.lat}" min="0">
					<br><br>
					
					<label for="lng">Longitud:</label>
					<input type="number" step="0.000001" id="lng" name="lng" value="${usuario.lng}" min="0">
					<br><br>
					
					<label for="country">Pais:</label>
					<input type="text" id="country" name="country" value="${usuario.country}">
				</div>
			</div>

			<!-- Sección 3: Información de la Empresa -->
			<div class="tab">
				<div class="tab-content">
					<br><br>
					<label for="companyName">Nombre de la Empresa:</label>
					<input type="text" id="companyName" name="companyName" value="${usuario.companyName}">
					<br><br>
					
					<label for="companyAddress">Direccion de la Empresa:</label>
					<input type="text" id="companyAddress" name="companyAddress" value="${usuario.companyAddress}">
					<br><br>
					
					<label for="companyCity">Ciudad de la Empresa:</label>
					<input type="text" id="companyCity" name="companyCity" value="${usuario.companyCity}">
					<br><br>
					
					<label for="companyState">Estado de la Empresa:</label>
					<input type="text" id="companyState" name="companyState" value="${usuario.companyState}">
					<br><br>
					
					<label for="companyStateCode">Codigo del Estado de la Empresa:</label>
					<input type="text" id="companyStateCode" name="companyStateCode" value="${usuario.companyStateCode}">
					<br><br>
					
					<label for="companyPostalCode">Codigo Postal de la Empresa:</label>
					<input type="text" id="companyPostalCode" name="companyPostalCode" value="${usuario.companyPostalCode}">
					<br><br>
					
					<label for="companyLat">Latitud de la Empresa:</label>
					<input type="number" step="0.000001" id="companyLat" name="companyLat" value="${usuario.companyLat}" min="0">
					<br><br>
					
					<label for="companyLng">Longitud de la Empresa:</label>
					<input type="number" step="0.000001" id="companyLng" name="companyLng" value="${usuario.companyLng}" min="0">
					<br><br>
					
					<label for="companyCountry">Pais de la Empresa:</label>
					<input type="text" id="companyCountry" name="companyCountry" value="${usuario.companyCountry}">
					<br><br>
					
					<label for="companyDepartment">Departamento de la Empresa:</label>
					<input type="text" id="companyDepartment" name="companyDepartment" value="${usuario.companyDepartment}">
					<br><br>
					
					<label for="companyTitle">Titulo en la Empresa:</label>
					<input type="text" id="companyTitle" name="companyTitle" value="${usuario.companyTitle}">
					<br><br>
					
					<label for="ein">Numero de Identificacion del Empleador (EIN):</label>
					<input type="text" id="ein" name="ein" value="${usuario.ein}">
					<br><br>
					
					<label for="bankCardNumber">Numero de Tarjeta Bancaria:</label>
					<input type="text" id="bankCardNumber" name="bankCardNumber" value="${usuario.bankCardNumber}">
					<br><br>
					
					<label for="bankCardType">Tipo de Tarjeta Bancaria:</label>
					<input type="text" id="bankCardType" name="bankCardType" value="${usuario.bankCardType}">
					<br><br>
					
					<label for="bankCurrency">Moneda del Banco:</label>
					<input type="text" id="bankCurrency" name="bankCurrency" value="${usuario.bankCurrency}">
					<br><br>
					
					<label for="bankIban">IBAN del Banco:</label>
					<input ```jsp
                    type="text" id="bankIban" name="bankIban" value="${usuario.bankIban}">
                    <br><br>
                    
                    <label for="cryptoCoin">Moneda Cripto:</label>
                    <input type="text" id="cryptoCoin" name="cryptoCoin" value="${usuario.cryptoCoin}">
                    <br><br>
                    
                    <label for="cryptoWallet">Cartera Cripto:</label>
                    <input type="text" id="cryptoWallet" name="cryptoWallet" value="${usuario.cryptoWallet}">
                    <br><br>
                    
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