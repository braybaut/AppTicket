
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


<h2> Ticket Type </h2>
<form action="showchange.php" method="post">
<select name="ticket">
       <option value="0">Selección:</option>
       <?php
       include ("conect-mysql.php");
        $query = $mysqli -> query ("select distinct ticket  from exchangedticket");
         while ($valores = mysqli_fetch_array($query)) {
        echo ' <option value="'.$valores[ticket].'">'.$valores[ticket].'</option>';
         }
       ?>
     </select>
     <h2> ID Restaurant  </h2>
     <select name="restaurant">
            <option value="0">Selección:</option>
            <?php
            include ("conect-mysql.php");
             $query2 = $mysqli -> query ("select distinct restaurant  from exchangedticket");
              while ($valores2 = mysqli_fetch_array($query2)) {
             echo '<font color="red"> <option value="'.$valores2[restaurant].'">'.$valores2[restaurant].'</option></font>';
              }
            ?>
          </select>
          <input type=submit value=enviar <a class="btn btn-primary btn-large btn-block" </a> </input>

        </form>
<div class=control-group>
</div>
</div>
		</div>

<br><br>
<a href=logout.php>Cerrar Sesion X </a>
</body>
</html>
