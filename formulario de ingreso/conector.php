<?php
// Datos de conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu servidor de MySQL está en otro lugar
$username = "phpmyadmin"; // Cambia por tu nombre de usuario de MySQL
$password = "12345678"; // Cambia por tu contraseña de MySQL
$database = "phpmyadmin"; // Nombre de la base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
} else {
    echo "Conexión exitosa";
}

// Cerrar conexión
$conn->close();
?>
