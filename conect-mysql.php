<?php
$mysqli = new mysqli("localhost", "root", "Locogreenday666", "restaurant");
if ($mysqli->connect_errno) {
    echo "Fallo la conexion a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>
