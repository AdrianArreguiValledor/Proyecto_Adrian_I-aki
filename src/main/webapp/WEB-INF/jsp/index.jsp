<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gradient-to-b from-blue-900 to-blue-400 min-h-screen flex items-center justify-center px-4">

    <div class="bg-white rounded-2xl shadow-lg flex flex-col md:flex-row overflow-hidden w-full max-w-4xl animate-fade-in">
        <!-- Formulario -->
        <div class="w-full md:w-1/2 p-10 flex flex-col justify-center">
            <h2 class="text-3xl font-bold text-center text-red-600 mb-6">INICIAR SESIÓN</h2>

            <% if (request.getAttribute("error") != null) { %>
                <p class="text-red-500 text-center mb-4"><%= request.getAttribute("error") %></p>
            <% } %>

            <% if (request.getAttribute("mensaje") != null) { %>
                <p class="text-green-600 text-center mb-4"><%= request.getAttribute("mensaje") %></p>
            <% } %>

            <form action="formularioLogin" method="post" class="space-y-6">
                <div>
                    <label for="email" class="block text-gray-700 font-medium mb-1">Correo Electrónico</label>
                    <div class="flex items-center border border-gray-300 rounded-lg px-3 py-2">
                        <i data-lucide="mail" class="w-5 h-5 text-gray-500 mr-2"></i>
                        <input type="email" name="email" id="email" required class="w-full outline-none text-gray-800" placeholder="ejemplo@correo.com" />
                    </div>
                </div>

                <div>
                    <label for="contrasena" class="block text-gray-700 font-medium mb-1">Contraseña</label>
                    <div class="flex items-center border border-gray-300 rounded-lg px-3 py-2 relative">
                        <i data-lucide="lock" class="w-5 h-5 text-gray-500 mr-2"></i>
                        <input type="password" name="contrasena" id="contrasena" required class="w-full outline-none text-gray-800 pr-8" placeholder="Tu contraseña" />
						<i id="togglePasswordShow" data-lucide="eye" class="absolute right-3 text-gray-500 cursor-pointer"></i>
						<i id="togglePasswordHide" data-lucide="eye-off" class="absolute right-3 text-gray-500 cursor-pointer hidden"></i>
                    </div>
                    <p id="password-status" class="text-sm text-center mt-2 text-red-500">Contraseña oculta</p>
                </div>

                <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-lg transition-transform transform hover:scale-105">
                    Iniciar Sesión
                </button>
            </form>

            <p class="text-center text-sm mt-6 text-gray-600">
                ¿No tienes cuenta? <a href="/registro" class="text-blue-600 font-bold hover:underline">Regístrate aquí</a>
            </p>
        </div>

        <!-- Imagen o branding -->
        <div class="hidden md:block w-full md:w-1/2 bg-cover bg-center" style="background-image: url('imagenes/tienda.png');">
        </div>
    </div>

    <!-- Fade-in animation -->
    <style>
        @keyframes fade-in {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-fade-in {
            animation: fade-in 1s ease-out forwards;
        }
    </style>

    <!-- Lucide Init + Password Toggle -->
	<script>
	    window.onload = () => {
	        lucide.createIcons();

	        const passwordInput = document.getElementById("contrasena");
	        const showIcon = document.getElementById("togglePasswordShow");
	        const hideIcon = document.getElementById("togglePasswordHide");
	        const status = document.getElementById("password-status");

	        showIcon.addEventListener("click", () => {
	            passwordInput.type = "text";
	            showIcon.classList.add("hidden");
	            hideIcon.classList.remove("hidden");
	            status.textContent = "Contraseña visible";
	            status.classList.replace("text-red-500", "text-green-500");
	        });

	        hideIcon.addEventListener("click", () => {
	            passwordInput.type = "password";
	            hideIcon.classList.add("hidden");
	            showIcon.classList.remove("hidden");
	            status.textContent = "Contraseña oculta";
	            status.classList.replace("text-green-500", "text-red-500");
	        });
	    };
	</script>

</body>
</html>
