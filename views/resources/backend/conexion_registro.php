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
        echo "<div style='text-align: center;'><div class='error-message' style='background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 15px; display: inline-block;'>El usuario ya está registrado.</div></div>";
    } else {
        // El usuario no existe, insertar datos en la base de datos
        $sql = "INSERT INTO usuarios (fullname, email, password) VALUES ('$fullname', '$email', '$password')";

        if ($conn->query($sql) === TRUE) {
            // Mostrar mensaje de éxito
            echo "<div style='text-align: center;'><div class='success-message' style='background-color: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin-bottom: 15px; display: inline-block;'>Usuario registrado correctamente.</div></div>";
            
            // Crear una cadena con los datos del usuario
            $userData = "Nombre Completo: $fullname\nCorreo Electrónico: $email\nContraseña: $password\n";

            // Especificar la ruta y el nombre del archivo de texto
            $fileName = "registros_usuario.txt";

            // Abrir el archivo en modo escritura, si no existe se crea
            $file = fopen($fileName, "a") or die("Archivo Temporal Generado.");

            // Escribir los datos del usuario en el archivo
            fwrite($file, $userData);

            // Cerrar el archivo
            fclose($file);
        } else {
            // Mostrar mensaje de error si hay un error en la inserción
            echo "<div style='text-align: center;'><div class='error-message' style='background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 15px; display: inline-block;'>Error al registrar el usuario: " . $conn->error . "</div></div>";
        }
    }

    // Cerrar la conexión
    $conn->close();
} else {
    // Mostrar mensaje de error si no se recibieron datos del formulario
    echo "<div style='text-align: center;'><div class='error-message' style='background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 15px; display: inline-block;'>Error: No se recibieron datos del formulario.</div></div>";
}
?>

<!-- Agregar un botón para enlazar a una página web -->
<a href="http://localhost/Proyecto-Sena/views/resources/dashboard/perfil_config.html" class="btn btn-primary" style="background-color: #007bff; color: #fff; text-decoration: none; padding: 10px 20px; border-radius: 5px; border: none; font-size: 16px; cursor: pointer; transition: background-color 0.3s; display: block; margin: 0 auto; width: 200px;">Ir a mi página web</a>

<style>
    a {
        bottom: auto;
        color:#007bff;
    }
</style>
