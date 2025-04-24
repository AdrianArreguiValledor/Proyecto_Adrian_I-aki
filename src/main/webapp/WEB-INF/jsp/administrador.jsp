<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Panel de Administrador</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(145deg, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            min-height: 100vh;
			overflow-y: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-in;
        }

        .container {
            background: #fff;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            max-width: 500px;
            width: 90%;
            text-align: center;
            animation: slideIn 1s ease forwards;
        }

        h2 {
            font-size: 32px;
            color: #333;
            margin-bottom: 20px;
        }

        .usuario {
            color: #d63031;
            font-size: 18px;
            margin-top: 10px;
            text-decoration: underline;
            font-weight: bold;
        }

        p {
            color: #444;
            font-size: 18px;
            margin-bottom: 20px;
        }

        form {
            margin-top: 10px;
        }

        button {
            width: 100%;
            padding: 12px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.3s;
        }

        button:hover {
            transform: scale(1.03);
        }

        .cliente-btn {
            background-color: #00b894;
        }

        .cliente-btn:hover {
            background-color: #019875;
        }

        .btn-ver-productos {
            background-color: #e74c3c;
        }

        .btn-ver-productos:hover {
            background-color: #c0392b;
        }

        .btn-volver {
            background-color: #3498db;
        }

        .btn-volver:hover {
            background-color: #2980b9;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        i {
            margin-right: 8px;
        }

        /* Media Queries para hacer la página más responsiva */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
            }

            h2 {
                font-size: 26px;
            }

            .usuario {
                font-size: 16px;
            }

            p {
                font-size: 16px;
            }

            button {
                font-size: 16px;
                padding: 10px 15px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 22px;
            }

            .usuario {
                font-size: 14px;
            }

            p {
                font-size: 14px;
            }

            button {
                font-size: 14px;
                padding: 8px 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-user-shield"></i> Panel de Administrador</h2>

        <p class="usuario"><i class="fas fa-user"></i> <strong>Usuario:</strong> ${usuario}</p>
        <p>${mensaje}</p>

        <form action="/cliente" method="get">
            <button type="submit" class="cliente-btn" onclick="return confirmAction('clientes')">
                <i class="fas fa-users"></i> Ver Clientes
            </button>
        </form>

        <form action="/administrador/prueba" method="get">
            <button type="submit" class="btn-ver-productos" onclick="return confirmAction('productos')">
                <i class="fas fa-box-open"></i> Ver Productos
            </button>
        </form>

        <form action="/principal" method="get">
            <button type="submit" class="btn-volver" onclick="return confirmAction('volver')">
                <i class="fas fa-arrow-left"></i> Volver atrás
            </button>
        </form>
    </div>

    <script>
        function confirmAction(action) {
            let message = '';
            switch(action) {
                case 'clientes':
                    message = '¿Estás seguro de que deseas ver los clientes?';
                    break;
                case 'productos':
                    message = '¿Estás seguro de que deseas ver los productos?';
                    break;
                case 'volver':
                    message = '¿Estás seguro de que deseas volver atrás?';
                    break;
            }
            return confirm(message);
        }
    </script>
</body>
</html>
