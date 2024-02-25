<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "phpmyadmin";
$password = "12345";
$database = "phpmyadmin";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Obtener datos del formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre_registro'];
    $email = $_POST['email_registro'];
    $contrasena = $_POST['password_registro'];

    // Sentencia SQL para insertar los datos en la tabla de usuarios
    $sql = "INSERT INTO usuarios (nombre_completo, correo_electronico, contrasena) VALUES ('$nombre', '$email', '$contrasena')";

    // Ejecutar la sentencia SQL
    if ($conn->query($sql) === TRUE) {
        echo "Registro exitoso";
    } else {
        echo "Error al registrar usuario: " . $conn->error;
    }
}

// Cerrar conexión
$conn->close();
?>