
<?php
session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {

} else {
   echo "Esta pagina es solo para usuarios registrados.<br>";
   echo "<br><a href='index.html'>Login</a>";
   echo "<br><br><a href='index.html'>Registrarme</a>";

exit;
}

$now = time();

if($now > $_SESSION['expire']) {
session_destroy();

echo "Su sesion a terminado,
<a href='index.html'>Necesita Hacer Login</a>";
exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Options </title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

		<div class="login-screen-option">

    <div class="app-title">
      <img src="images/ucc.png" alt="Universidad Cooperativa de Colombia" style="width:260px;height:218px;" >


      <h1> Seleccione opcion </h1>
    </div>

  <div class="login-form">


<div class=control-group>
<a class="btnleft btn-primary btn-large btn-block " href="#"><center>Ver Ticket </center></a>
<a class="btnright btn-primary btn-large btn-block " href="#"><center>Relacion de Tickets</center></a>
</div>
</div>
		</div>

<br><br>
<a href=logout.php>Cerrar Sesion X </a>
</body>
</html>
