<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$id_atractivos_naturales = $_POST["id_atractivos_naturales"];
//echo $id_atractivos_naturales;

if ($eliminado = eliminar_an($id_atractivos_naturales, $conn)) {
    
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

function eliminar_an($id_atractivos_naturales, $conn)
{
    $sql = "DELETE FROM atractivos_naturales WHERE idatractivos_naturales = '$id_atractivos_naturales'";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado ? true : false); //ternarios

}