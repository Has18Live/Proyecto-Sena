<?php
session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['username'])) {
    // Si el usuario no está autenticado, redirigirlo al inicio de sesión
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control</title>
    <!-- Agrega aquí tus enlaces a archivos CSS y otras dependencias -->
</head>
<body>
    <h1>Panel de Control</h1>
    <p>Bienvenido, <?php echo $_SESSION['username']; ?>.</p>
    <!-- Agrega aquí el contenido específico del panel de control -->
</body>
</html>
