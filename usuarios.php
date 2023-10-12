<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$nombre = $_POST["nombre_usuarios"];
$telefono = $_POST["telefono_usuarios"];
$correo = $_POST["correo_usuarios"];
$a_paterno = $_POST["a_paterno_usuarios"];
$a_materno = $_POST["a_materno_usuarios"];
$fecha_nacimiento = $_POST["fecha_nacimiento_usuarios"];
$genero = $_POST["genero_usuarios"];
$contrasena = $_POST["contrasena_usuarios"];
//echo $fecha_completa." ";
$idroles = 1;

//echo $fecha_actual;
//variable en la que estoy guardando (izquierda) y cómo se llama el dato en html (derecha).
/* echo $titulo;
echo $resena;
echo $sub_titulo;
echo $fecha_evento;
echo $hora;
echo $categoria;
Este bloque de echo es para revisar que los datos están llegando a este archivo.
 */
if ($creado = crear_usuarios($nombre, $telefono, $correo, $a_paterno, $a_materno, $fecha_nacimiento, $genero, $idroles, $contrasena, $conn)) {
    $respuesta = [
        'response' => 'exito',
        'mensaje' => 'El registro del evento fue ingresado',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'el registro del evento no pudo ser ingresado',
    ];
}
echo json_encode($respuesta);

function crear_usuarios($nombre, $telefono, $correo, $a_paterno, $a_materno, $fecha_nacimiento, $genero, $idroles, $contrasena, $conn)
{
    $sql = "INSERT INTO usuarios(nombre, telefono, correo, a_paterno, a_materno, fecha_nacimiento, genero, idroles, password) VALUES ('$nombre', '$telefono', '$correo', '$a_paterno', '$a_materno', '$fecha_nacimiento', '$genero', $idroles, '$contrasena')";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $conn->affected_rows ? true : false); //ternarios

}
