<?php
include("conect-mysql.php");

$usuario = $_POST['username'];
$pass = $_POST['password'];

if(empty($usuario) || empty($pass)){
header("Location: index.html");
exit();
}

#mysql_connect('localhost','root','Locogreenday666') or die("Error al conectar " . mysql_error());
#mysql_select_db('restaurant') or die ("Error al seleccionar la Base de datos: " . mysql_error());

$result = $mysqli ->query("SELECT * from app_user where user_name='" . $usuario . "'");

if($row = mysqli_fetch_array($result)){
if($row['password'] == $pass){
session_start();
$_SESSION['loggedin'] = true;
$_SESSION['usuario'] = $usuario;
$_SESSION['start'] = time();
$_SESSION['expire'] = $_SESSION['start'] + (5 * 60);



header("Location: options.php");
}else{
header("Location: index.html");
exit();
}
}else{
header("Location: index.html");
exit();
}


?>
