<?php
include "conexion.php";

function consultarEmail($email)
{
	include "conexion.php";
	$consulta="SELECT * FROM clientes where email='".$email."'";
	$resultado=mysqli_query($conn,$consulta);
	if (mysqli_num_rows($resultado)>0)
	{
	return true;
	}	 
	else 
	{
	return false;
	}
	
		
}
function registrarcliente($nombre,$app,$apm,$email,$password)
{
	include "conexion.php";
	if(!consultarEmail($email))
	{

		$consulta="call registrarcliente('".$nombre."','".$app."','".$apm."','".$email."','".$password."')";
	if(mysqli_query($conn,$consulta))

	{
		$response["Status"]="Registrado";
	}
	else
	$response["Status"]=mysqli_error($conn);

	}
	else
	{
		$response["Status"]="Correo ya registrado";

	}
	echo json_encode($response);
}
$nombre=trim($_POST["nombre"]);
$nombre = str_replace(' ', '', $nombre);
$app=trim($_POST["app"]);
$app= str_replace(' ', '', $app);
$apm=trim($_POST["apm"]);
$apm = str_replace(' ', '', $apm);
$email=trim($_POST["email"]);
$email = str_replace(' ', '', $email);
$password=$_POST["password"];
	registrarcliente($nombre,$app,$apm,$email,$password);




?>