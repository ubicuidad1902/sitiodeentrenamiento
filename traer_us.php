<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.


if ($encontrados = traer_todos_us($conn)) {
    $us = [];
    while ($encontrado = $encontrados->fetch_assoc()){
        $us[] =$encontrado;
    }
    
    $respuesta = [
        'response' => 'exito',
        'datos'=>$us, 
        'mensaje' => 'El registro del evento fue ingresado',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'el registro del espacio no pudo ser ingresado',
    ];
}
echo json_encode($respuesta);

function traer_todos_us($conn)
{
    $sql = "SELECT * FROM usuarios";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $resultado->num_rows ? $resultado : false); //ternarios

}
