<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$id_efemerides = $_POST["id_efemerides"];
//echo $id_efemerides;

if ($eliminado = eliminar_ef($id_efemerides, $conn)) {
    
    $respuesta = [
        'response' => 'exito',
        'mensaje' => 'La eliminación del usuario fue exitosa',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'No se pudo eliminar el usuario',
    ];
}
echo json_encode($respuesta);

function eliminar_ef($id_efemerides, $conn)
{
    $sql = "DELETE FROM efemerides WHERE idefemerides = '$id_efemerides'";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado ? true : false); //ternarios

}