<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.

$id_usuario = $_POST["id_usuario"];
//echo $id_usuario;

if ($eliminado = eliminar_us($id_usuario, $conn)) {
    
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

function eliminar_us($id_usuario, $conn)
{
    $sql = "DELETE FROM usuarios WHERE idusuarios = '$id_usuario'";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado ? true : false); //ternarios

}