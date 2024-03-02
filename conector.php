<?php
// Datos de conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu servidor de MySQL está en otro lugar
$username = "root"; // Cambia por tu nombre de usuario de MySQL
$password = ""; // Cambia por tu contraseña de MySQL
$database = "datos"; // Nombre de la base de datos

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
