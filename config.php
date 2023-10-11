<?php

use JetBrains\PhpStorm\NoReturn;

$nombre_servidor = "localhost";
$base_datos = "nemesis3punto1416";
$usuario = "root";
$pass = "";

$conn = mysqli_connect($nombre_servidor, $usuario, $pass, $base_datos);/*abrir una función que va a recibir 
4 parámetros para crear una conexión a la base de <datos></datos>*/
if(!$conn){
    die("Conexión fallida: ". mysqli_connect_error());

}else{
    //echo "Conexión exitosa :) ";
}
   