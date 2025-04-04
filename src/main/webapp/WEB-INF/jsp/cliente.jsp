<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Clientes</title>
    <style>
		/* Reset global */
		* {
		    margin: 0; /* Elimina el margen predeterminado de todos los elementos */
		    padding: 0; /* Elimina el relleno predeterminado de todos los elementos */
		    box-sizing: border-box; /* Define el modelo de caja para todos los elementos, asegurando que el padding y el borde no afecten al ancho y alto de los elementos */
		}

		/* Fondo general */
		body {
		    font-family: Arial, sans-serif; /* Establece la fuente para todo el cuerpo */
		    background: linear-gradient(to bottom, #003366, #66ccff); /* Fondo degradado de color azul oscuro a azul claro */
		    color: #333; /* Establece un color de texto gris oscuro */
		    line-height: 1.6; /* Aumenta el interlineado para mejorar la legibilidad */
		    padding: 20px; /* Añade un espacio de 20px alrededor del contenido del body */
		    animation: fadeIn 1s ease-out; /* Aplica la animación fadeIn cuando la página se carga */
		}

		/* Contenedor principal */
		.container {
		    max-width: 1000px; /* El contenedor tiene un ancho máximo de 1000px */
		    margin: 0 auto; /* Centra el contenedor en la página */
		    background-color: #fff; /* Establece el fondo blanco para el contenedor */
		    padding: 30px; /* Añade 30px de espacio interno */
		    border-radius: 8px; /* Bordes redondeados con un radio de 8px */
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Sombra suave para dar profundidad */
		    opacity: 0; /* Inicialmente el contenedor es transparente */
		    animation: slideIn 1s ease-out forwards; /* Aplica la animación slideIn para que el contenedor aparezca deslizándose */
		}

		/* Título */
		h2 {
		    font-size: 2rem; /* Tamaño de fuente grande para el título */
		    color: #333; /* Color de texto gris oscuro */
		    text-align: center; /* Centra el título */
		    margin-bottom: 20px; /* Añade un espacio debajo del título */
		    border-bottom: 2px solid #4CAF50; /* Agrega una línea de 2px verde debajo del título */
		    padding-bottom: 10px; /* Añade un pequeño relleno debajo de la línea */
		}

		/* Animación de FadeIn */
		@keyframes fadeIn {
		    from {
		        opacity: 0; /* Al principio, la opacidad es 0 */
		    }
		    to {
		        opacity: 1; /* Al final, la opacidad es 1 */
		    }
		}

		/* Animación de SlideIn */
		@keyframes slideIn {
		    from {
		        opacity: 0; /* Comienza con opacidad 0 */
		        transform: translateY(20px); /* Comienza desplazado 20px hacia abajo */
		    }
		    to {
		        opacity: 1; /* Termina con opacidad 1 */
		        transform: translateY(0); /* Termina en su posición original */
		    }
		}

		/* Animación para la tabla */
		@keyframes tableFadeIn {
		    from {
		        opacity: 0; /* Comienza con opacidad 0 */
		    }
		    to {
		        opacity: 1; /* Termina con opacidad 1 */
		    }
		}

		/* Tabla de clientes */
		table {
		    width: 100%; /* La tabla ocupa todo el ancho del contenedor */
		    border-collapse: collapse; /* Elimina los espacios entre las celdas de la tabla */
		    margin-bottom: 20px; /* Añade un margen de 20px debajo de la tabla */
		    animation: tableFadeIn 1s ease-out; /* Aplica la animación de fade-in a la tabla */
		}

		/* Estilo para las celdas de la tabla */
		table th, table td {
		    padding: 12px; /* Añade un relleno de 12px dentro de las celdas */
		    text-align: left; /* Alinea el texto de las celdas a la izquierda */
		    border-bottom: 1px solid #ddd; /* Agrega una línea gris de 1px debajo de cada celda */
		}

		/* Estilo para los encabezados de la tabla */
		table th {
		    background-color: #4CAF50; /* Fondo verde para los encabezados */
		    color: white; /* Color de texto blanco */
		    font-weight: bold; /* Pone los encabezados en negrita */
		}

		/* Estilo para las celdas de la tabla */
		table td {
		    background-color: #f9f9f9; /* Fondo gris claro para las celdas */
		}

		/* Filas de la tabla de colores alternados */
		table tr:nth-child(even) td {
		    background-color: #f1f1f1; /* Fondo ligeramente más oscuro para las filas pares */
		}

		/* Botones */
		.button-container {
		    display: flex; /* Utiliza flexbox para alinear los botones en fila */
		    gap: 10px; /* Añade un espacio de 10px entre los botones */
		}

		/* Estilo para los botones de editar */
		.edit-button, .delete-button, .insert-button, .btn-volver {
		    border: none; /* Elimina el borde de los botones */
		    cursor: pointer; /* Cambia el cursor a una mano cuando se pasa sobre el botón */
		    border-radius: 5px; /* Bordes redondeados con un radio de 5px */
		    font-size: 1rem; /* Establece un tamaño de fuente de 1 rem */
		    padding: 10px 20px; /* Añade 10px de relleno en la parte superior e inferior, 20px a los lados */
		    font-weight: bold; /* Pone el texto en negrita */
		    text-align: center; /* Centra el texto en el botón */
		    display: inline-block; /* Asegura que los botones se muestren en línea */
		    transition: background-color 0.3s ease, transform 0.3s ease; /* Transición suave para los cambios de fondo y la escala */
		}

		/* Estilo para el botón de editar */
		.edit-button {
		    background-color: #4CAF50; /* Fondo verde para el botón de editar */
		    color: white; /* Color de texto blanco */
		}

		.edit-button:hover {
		    background-color: #45a049; /* Fondo más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Efecto de escala al pasar el ratón */
		}

		/* Estilo para el botón de borrar */
		.delete-button {
		    background-color: #f44336; /* Fondo rojo para el botón de borrar */
		    color: white; /* Color de texto blanco */
		}

		.delete-button:hover {
		    background-color: #c62828; /* Fondo más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Efecto de escala al pasar el ratón */
		}

		/* Estilo para el botón de insertar */
		.insert-button {
		    background-color: #233dff; /* Fondo azul para el botón de insertar */
		    color: white; /* Color de texto blanco */
		    margin-bottom: 20px; /* Añade un margen en la parte inferior */
		    display: block; /* Hace que el botón ocupe todo el ancho disponible */
		    width: fit-content; /* Ajusta el ancho al contenido del botón */
		    margin-left: auto; /* Centra el botón en el contenedor */
		    margin-right: auto; /* Centra el botón en el contenedor */
		}

		.insert-button:hover {
		    background-color: darkblue; /* Fondo más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Efecto de escala al pasar el ratón */
		}

		/* Estilo para el botón de volver */
		.btn-volver {
		    background-color: #007BFF; /* Fondo azul para el botón de volver */
		    color: white; /* Color de texto blanco */
		    display: block; /* Hace que el botón ocupe todo el ancho disponible */
		    width: fit-content; /* Ajusta el ancho al contenido del botón */
		    margin-left: auto; /* Centra el botón en el contenedor */
		    margin-right: auto; /* Centra el botón en el contenedor */
		}

		.btn-volver:hover {
		    background-color: darkblue; /* Fondo más oscuro al pasar el ratón */
		    transform: scale(1.05); /* Efecto de escala al pasar el ratón */
		}

    </style>

    <script>
        function confirmarBorrado(userId) {
            if (confirm("¿Estás seguro de que deseas eliminar este usuario?")) {
                window.location.href = "borrar/" + userId;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Lista de Clientes</h2>

        <!-- Botón Insertar Cliente -->
        <form action="/insertar" method="get">
            <button type="submit" class="insert-button">Insertar Cliente</button>
        </form>

		<c:choose>
		    <c:when test="${not empty usuarios}">
		        <table>
		            <tr>
		                <th>Nombre</th>
		                <th>Apellido</th>
		                <th>Apellido de soltera</th>
		                <th>Edad</th>
		                <th>Género</th>
		                <th>Email</th>
		                <th>Teléfono</th>
		                <th>Nombre de usuario</th>
		                <th>Contraseña</th>
		                <th>Fecha de nacimiento</th>
		                <th>Imagen</th>
		                <th>Grupo sanguíneo</th>
		                <th>Altura</th>
		                <th>Peso</th>
		                <th>Color de ojos</th>
		                <th>Color de cabello</th>
		                <th>Tipo de cabello</th>
		                <th>Dirección</th>
		                <th>Ciudad</th>
		                <th>Estado</th>
		                <th>Código del estado</th>
		                <th>Código postal</th>
		                <th>Latitud</th>
		                <th>Longitud</th>
		                <th>País</th>
		                <th>Dirección MAC</th>
		                <th>Universidad</th>
		                <th>Fecha de caducidad tarjeta bancaria</th>
		                <th>Número de tarjeta bancaria</th>
		                <th>Tipo de tarjeta bancaria</th>
		                <th>Moneda bancaria</th>
		                <th>IBAN bancario</th>
		                <th>Departamento de la empresa</th>
		                <th>Nombre de la empresa</th>
		                <th>Título de la empresa</th>
		                <th>Dirección de la empresa</th>
		                <th>Ciudad de la empresa</th>
		                <th>Estado de la empresa</th>
		                <th>Código del estado de la empresa</th>
		                <th>Código postal de la empresa</th>
		                <th>Latitud de la empresa</th>
		                <th>Longitud de la empresa</th>
		                <th>País de la empresa</th>
		                <th>Ein</th>
		                <th>SSN</th>
		                <th>Usuario agente</th>
		                <th>Moneda criptográfica</th>
		                <th>Billetera criptográfica</th>
		                <th>Red criptográfica</th>
		                <th>Rol</th>
		                <th>Acciones</th>
		            </tr>
		            <c:forEach var="user" items="${usuarios}">
		                <tr>
		                    <td>${user.firstName}</td>
		                    <td>${user.lastName}</td>
		                    <td>${user.maidenName}</td>
		                    <td>${user.age}</td>
		                    <td>${user.gender}</td>
		                    <td>${user.email}</td>
		                    <td>${user.phone}</td>
		                    <td>${user.username}</td>
		                    <td>${user.password}</td>
		                    <td>${user.birthDate}</td>
		                    <td>${user.image}</td>
		                    <td>${user.bloodGroup}</td>
		                    <td>${user.height}</td>
		                    <td>${user.weight}</td>
		                    <td>${user.eyeColor}</td>
		                    <td>${user.hairColor}</td>
		                    <td>${user.hairType}</td>
		                    <td>${user.address}</td>
		                    <td>${user.city}</td>
		                    <td>${user.state}</td>
		                    <td>${user.stateCode}</td>
		                    <td>${user.postalCode}</td>
		                    <td>${user.lat}</td>
		                    <td>${user.lng}</td>
		                    <td>${user.country}</td>
		                    <td>${user.macAddress}</td>
		                    <td>${user.university}</td>
		                    <td>${user.bankCardExpire}</td>
		                    <td>${user.bankCardNumber}</td>
		                    <td>${user.bankCardType}</td>
		                    <td>${user.bankCurrency}</td>
		                    <td>${user.bankIban}</td>
		                    <td>${user.companyDepartment}</td>
		                    <td>${user.companyName}</td>
		                    <td>${user.companyTitle}</td>
		                    <td>${user.companyAddress}</td>
		                    <td>${user.companyCity}</td>
		                    <td>${user.companyState}</td>
		                    <td>${user.companyStateCode}</td>
		                    <td>${user.companyPostalCode}</td>
		                    <td>${user.companyLat}</td>
		                    <td>${user.companyLng}</td>
		                    <td>${user.companyCountry}</td>
		                    <td>${user.ein}</td>
		                    <td>${user.ssn}</td>
		                    <td>${user.userAgent}</td>
		                    <td>${user.cryptoCoin}</td>
		                    <td>${user.cryptoWallet}</td>
		                    <td>${user.cryptoNetwork}</td>
		                    <td>${user.role}</td>
		                    <td>
		                        <div class="button-container">
		                            <a href="editar/${user.id}">
		                                <button class="edit-button">Editar</button>
		                            </a>
		                            <button class="delete-button" onclick="confirmarBorrado(${user.id})">Borrar</button>
		                        </div>
		                    </td>
		                </tr>
		            </c:forEach>
		        </table>
		    </c:when>
		    <c:otherwise>
		        <p>No hay clientes registrados.</p>
		    </c:otherwise>
		</c:choose>

        <!-- Botón de volver -->
        <form action="/administrador" method="get">
            <button type="submit" class="btn-volver">Volver Atras</button>
        </form>
    </div>
</body>
</html>
