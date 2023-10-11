<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.


if ($encontrados = traer_todos_ef($conn)) {
    $ef = [];
    while ($encontrado = $encontrados->fetch_assoc()){
        $ef[] =$encontrado;
    }
    
    $respuesta = [
        'response' => 'exito',
        'datos'=>$ef, 
        'mensaje' => 'El registro del espacio arquitectónico fue ingresado',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'el registro del espacio no pudo ser ingresado',
    ];
}
echo json_encode($respuesta);

function traer_todos_ef($conn)
{
    $sql = "SELECT * FROM efemerides";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $resultado->num_rows ? $resultado : false); //ternarios

}
