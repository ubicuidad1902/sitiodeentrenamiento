<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$id_personajes = $_POST["id_personajes"];

if ($eliminado = eliminar_per($id_personajes, $conn)) {
    
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

function eliminar_per($id_personajes, $conn)
{
    $sql = "DELETE FROM personajes WHERE idpersonajes = '$id_personajes'";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado ? true : false); //ternarios

}