<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hacer Pedido</title>
    <script type="text/javascript">
        // Función que establece la fecha mínima del campo de fecha como la fecha actual
        window.onload = function() {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); // Enero es 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd; // Formato YYYY-MM-DD

            // Establecer el atributo 'min' en los campos de fecha
            document.getElementById("fecha_pedido").setAttribute("min", today);
            document.getElementById("fecha_entrega").setAttribute("min", today);
        }

        // Función para validar que la cantidad no sea menor de 0 antes de enviar el formulario
        function validarFormulario() {
            var cantidad = document.getElementById("cantidad").value;

            // Validar si la cantidad es menor a 0
            if (cantidad < 0) {
                alert("La cantidad no puede ser menor que 0.");
                return false; // Evitar que el formulario se envíe
            }
            return true; // Permitir que el formulario se envíe
        }
		
    </script>
</head>
<body>
    <h2>Hacer Pedido</h2>

    <%-- Mostrar mensajes de éxito o error --%>
    <% if (request.getAttribute("mensaje") != null) { %>
        <p style="color: green;"><%= request.getAttribute("mensaje") %></p>
    <% } %>
    
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="crearPedido" method="post" onsubmit="return validarFormulario()">

        <label for="cantidad">Cantidad:</label>
        <input type="number" id="cantidad" name="cantidad" required min="0"><br><br>

        <label for="fecha_pedido">Fecha de Pedido:</label>
        <input type="date" id="fecha_pedido" name="fecha_pedido" required><br><br>

        <label for="fecha_entrega">Fecha de Entrega:</label>
        <input type="date" id="fecha_entrega" name="fecha_entrega" required><br><br>
		
		<label for="id_user">Usuario:</label>
		<input type="number" id="id_user" name="id_user" required min="0"><br><br>
				
				
		<label for="id_producto">Producto:</label>
		    <select id="id_producto" name="id_producto" required>
		        <option value="3">Periféricos</option>
		        <option value="2">Ordenador</option>
		        <option value="1">Portátil</option>
		    </select><br><br>
		
	

        <button type="submit">Realizar Pedido</button>
    </form>
</body>
</html>
