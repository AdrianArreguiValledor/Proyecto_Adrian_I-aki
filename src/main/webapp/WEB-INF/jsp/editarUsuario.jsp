<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #003366, #66ccff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        h1 {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }

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

        input[type="text"], input[type="email"], input[type="number"], input[type="date"], input[type="tel"], select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .back-button {
            background-color: #007BFF;
            color: white;
        }

        .active {
            background-color: #4CAF50;
            color: white;
        }

        .tab-button {
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .tab-button:hover {
            background-color: #ddd;
        }
    </style>

    <script>
        function openTab(tabIndex) {
            var tabs = document.querySelectorAll('.tab');
            var headers = document.querySelectorAll('.tab-header div');

            tabs.forEach(function(tab, index) {
                if(index === tabIndex) {
                    tab.style.display = 'block';
                    headers[index].classList.add('active');
                } else {
                    tab.style.display = 'none';
                    headers[index].classList.remove('active');
                }
            });
        }

        function confirmSubmit() {
            var result = confirm("¿Está seguro de que desea actualizar la información?");
            return result;
        }

        function validateForm() {
            var requiredFields = document.querySelectorAll('.tab input');
            for(var i = 0; i < requiredFields.length; i++) {
                if(requiredFields[i].value == "") {
                    alert("Todos los campos son obligatorios.");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h1>Editar Usuario</h1>

        <form action="/actualizar/${usuario.id}" method="post" onsubmit="return validateForm()">
            
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

            <button type="submit" onclick="return confirmSubmit()">Actualizar Usuario</button>
        </form>

        <form action="/cliente" method="get">
            <button type="submit" class="back-button">Volver Atras</button>
        </form>
    </div>
</body>
</html>
