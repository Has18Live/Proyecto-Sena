<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100..900&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        /* Estilos adicionales */
        body {
            font-family: 'Montserrat', sans-serif;
        }
        .container-form {
            margin-top: 50px;
        }
        .info-childs {
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-submit {
            width: 100%;
        }
        .error-message {
            color: #ff0000;
            background-color: #ffebee;
            border: 1px solid #ffcdd2;
            padding: 10px;
            margin-bottom: 10px;
        }
        .success-message {
            color: #008000;
            background-color: #e8f5e9;
            border: 1px solid #c8e6c9;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="container-form register">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                        <p></p>
                    <a href="./login.html" class="btn btn-primary">Mi Perfil</a>
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Cuenta Creada</h2>
                    <div class="icons">
                        <i class='bx bxl-google'></i>
                        <i class='bx bxl-facebook'></i>
                        <i class='bx bxl-github'></i>
                    </div>
                    <p>Regístrado</p>
                    
                    <?php
                    // Verificar si se recibieron datos del formulario
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                        // Conectar a la base de datos
                        $servername = "localhost";
                        $username = "root";
                        $password = "";
                        $dbname = "speed_store";
                        $conn = new mysqli($servername, $username, $password, $dbname);

                        // Verificar la conexión
                        if ($conn->connect_error) {
                            die("Conexión fallida: " . $conn->connect_error);
                        }

                        // Obtener los datos del formulario
                        $fullname = $_POST["fullname"];
                        $email = $_POST["email"];
                        $password = $_POST["password"];

                        // Verificar si el usuario ya existe en la base de datos
                        $sql = "SELECT * FROM usuarios WHERE email='$email'";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // El usuario ya existe, mostrar mensaje de error
                            echo "<div class='error-message'>El usuario ya está registrado.</div>";
                        } else {
                            // El usuario no existe, insertar datos en la base de datos
                            $sql = "INSERT INTO usuarios (fullname, email, password) VALUES ('$fullname', '$email', '$password')";

                            if ($conn->query($sql) === TRUE) {
                                echo "<div class='success-message'>Usuario registrado correctamente.</div>";
                            } else {
                                echo "<div class='error-message'>Error al registrar el usuario: " . $conn->error . "</div>";
                            }
                        }

                        // Cerrar la conexión
                        $conn->close();
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
