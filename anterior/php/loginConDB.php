<?php
	

	// $usuarios = obtenerUsuarios();
	// foreach ($usuarios as $u) {
	// 	echo $u['cedula'].'<br>';
	// }

	function obtenerUsuarios(){

		require_once 'infodb.php';

		$db_conexion = mysqli_connect($db_hostname, $db_username, $db_password);

		if (!$db_conexion){
			die("No puede conectar a MySQL <br>Error: " . mysqli_error ($db_conexion));
		}else{
			mysqli_select_db($db_conexion, $db_database) or die("No se puede seleccionar la base de datos <br>Error: " . mysqli_error ($db_conexion));

			$query = "SELECT * FROM usuario";
			$resultado = mysqli_query($db_conexion, $query) or die("No se obtuvo ningun resgistro de la base de datos <br>Error: " . mysqli_error ($db_conexion));
			$nRegistros = mysqli_num_rows($resultado);
			$usuarios = new ArrayObject();

			for ($i=0; $i < $nRegistros; $i++){
				mysqli_data_seek ($resultado, $i);
				$usuario = mysqli_fetch_array($resultado);
				$usuarios->append($usuario);
			}

			return $usuarios;
		}
	}

	session_start();

	if (isset($_POST['cedula']) && isset($_POST['contrasena']) ) {
		

		$_SESSION['cedula'] = $_POST['cedula'];
		$_SESSION['contrasena'] = $_POST['contrasena'];

		if ($_SESSION['cedula'] != '' && $_SESSION['contrasena'] != ''){
			// echo "Cedula : ".$_SESSION['cedula']."<br>";
			// echo "Contraseña : ".$_SESSION['contrasena']."<br>";

			$usuarios = obtenerUsuarios();
			$existe = false;

			foreach ($usuarios as $usuario) {
				if ($usuario['cedula'] == $_SESSION['cedula']) {
					$existe = true;
					if ($usuario['contrasena'] == $_SESSION['contrasena']) {
						session_destroy();
						if ($usuario['tipo'] == 'jurado'){
							 header('Location: ../paginas/vista-jurado.html');
						}
						if ($usuario['tipo'] == 'votante'){
							header('Location: ../paginas/vista-votante.html');
						}
					}else{
						// contrasena incorrecta
						$_SESSION['msjError'] = 'La contraseña es incorrecta';
					}
				}
			}
			if (!$existe) $_SESSION['msjError'] = 'No existe ningun usuario con este numero de cedula';
		}else{
			$_SESSION['msjError'] = 'Se requiere que llene todos los campos';
		}


	}else{
		$_SESSION['msjError'] = 'Los datos ingresados son incorrectos';
	}
	
	if (isset($_SESSION['msjError'])) header('Location: ../index.php');

?> 