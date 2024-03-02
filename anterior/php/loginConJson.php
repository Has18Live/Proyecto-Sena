<?php
	
	session_start();

	if (isset($_POST['cedula']) && isset($_POST['contrasena']) ) {
		

		$_SESSION['cedula'] = $_POST['cedula'];
		$_SESSION['contrasena'] = $_POST['contrasena'];

		if ($_SESSION['cedula'] != '' && $_SESSION['contrasena'] != ''){
			echo "Cedula : ".$_SESSION['cedula']."<br>";
			echo "Contraseña : ".$_SESSION['contrasena']."<br>";

			$json = file_get_contents("../json/usuarios.json");
			$usuarios = json_decode($json, true);
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

	function mostarJson($usuarios){
		echo "<br>Estos son los usuarios registrados";
		foreach ($usuarios as $usuario) {
		    echo "<ul>";
		    echo "<li>cedula : ".$usuario['cedula'].'</li>';
		    echo "<li>contrasena : ".$usuario['contrasena'].'</li>';
		    echo "<li>tipo : ".$usuario['tipo']."</li></ul>";
		}
		echo "<br>";
	}
	
?>
