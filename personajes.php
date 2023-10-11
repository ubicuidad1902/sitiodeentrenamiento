<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$nombre = $_POST["nombre_personajes"];
$resena = $_POST["resena_personajes"];

if ($creado = crear_personajes($nombre, $resena, $conn)) {
    $respuesta = [
        'response' => 'exito',
        'mensaje' => 'El registro del espacio arquitectónico fue ingresado',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'el registro del espacio no pudo ser ingresado',
    ];
}
echo json_encode($respuesta);

function crear_personajes($nombre, $resena, $conn)
{
    $sql = "INSERT INTO personajes (Nombre_personaje, resena, likes) VALUES ('$nombre', '$resena', 0)";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $conn->affected_rows ? true : false); //ternarios

}
