<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$titulo_efemeride = $_POST["titulo_efemerides"];
$resena = $_POST["resena_efemerides"];

if ($creado = crear_efemerides($titulo_efemeride, $resena, $conn)) {
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

function crear_efemerides($titulo_efemeride, $resena, $conn)
{
    $sql = "INSERT INTO efemerides(titulo_efemeride, resena, likes, fecha, estado) VALUES ('$titulo_efemeride', '$resena', 100, '1981-02-19 19:00:00', 'a')";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $conn->affected_rows ? true : false); //ternarios

}
