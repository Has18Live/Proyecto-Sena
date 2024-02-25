<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "phpmyadmin";
$password = "12345678";
$database = "phpmyadmin";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Obtener datos del formulario
$nombre = $_POST['nombre_completo'];
$email = $_POST['correo_electronico'];
$contrasena = $_POST['contrasena'];

// Insertar datos en la base de datos
$sql = "INSERT INTO usuarios (nombre_completo, correo_electronico, contrasena) VALUES ('$nombre', '$email', '$contrasena')";

if ($conn->query($sql) === TRUE) {
    echo "Registro exitoso";
} else {
    echo "Error al registrar usuario: " . $conn->error;
}

// Cerrar conexión
$conn->close();
?>
