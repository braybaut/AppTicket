
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


      <h1> Ticket Inserted </h1>
    </div>

  <div class="login-form">
<b>Restaurant: </b>
<?php
include ("conect-mysql.php");
$ticket = $_REQUEST['ticket'];
$restaurant = $_REQUEST['restaurant'];
$query = $mysqli -> query ("select distinct waiter.NIF,restaurant.name  from ticket,exchangedticket,restaurant,waiter,person  where denomination = '$ticket' and restaurant='$restaurant' and restaurant.id='$restaurant' and maitre='$restaurant'");
$row = $query->fetch_assoc();
echo $row[name] ;
echo "</br>";
$NIF=$row[NIF];
$query = $mysqli -> query("select name,surname from person where NIF='$NIF'");
$row = $query->fetch_assoc();
echo "<b> maitre </b>" ;
echo $row[name];
echo $row[surname];
echo "</br>";
 ?>


<div class=control-group>
 <a class="btn btn-primary btn-large btn-block " href="<?=$_SERVER["HTTP_REFERER"]?>"><center> volver </center></a>
</div>
</div>
		</div>

<br><br>
<a href=logout.php>Cerrar Sesion X </a>
</body>
</html>
