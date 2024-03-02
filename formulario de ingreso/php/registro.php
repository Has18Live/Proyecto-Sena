<?php
// Datos de conexión a la base de datos
$host = 'localhost'; // Cambia esto por el nombre del host de tu servidor de base de datos
$usuario = 'root'; // Cambia esto por el nombre de usuario de tu base de datos
$contraseña = ''; // Cambia esto por la contraseña de tu base de datos
$base_datos = 'datos'; // Cambia esto por el nombre de tu base de datos

// Crear una conexión a la base de datos
$conexion = new mysqli($host, $usuario, $contraseña, $base_datos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Verificar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $nombre = $_POST["nombre"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    
    // Preparar la consulta SQL para insertar los datos en la tabla usuarios
    $sql = "INSERT INTO usuarios (nombre, email, password) VALUES ('$nombre', '$email', '$password')";
    
    // Ejecutar la consulta
    if ($conexion->query($sql) === TRUE) {
        echo "Registro exitoso";
    } else {
        echo "Error: " . $sql . "<br>" . $conexion->error;
    }
}

// Cerrar la conexión
$conexion->close();
?>
