<?php
// Datos de conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$database = "datos";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
} else {
    // Si la conexión es exitosa, mostrar un mensaje de éxito.
    echo "Conexión exitosa";
}

// Cerrar la conexión
$conn->close();
?>
