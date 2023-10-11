<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.


if ($encontrados = traer_todos_arquitectura($conn)) {
    $arquitectura = [];
    while ($encontrado = $encontrados->fetch_assoc()){
        $arquitectura[] =$encontrado;
    }
    
    $respuesta = [
        'response' => 'exito',
        'datos'=>$arquitectura, 
        'mensaje' => 'Los puntos fueron cargados',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'Los puntos no pudieron ser cargados',
    ];
}
echo json_encode($respuesta);

function traer_todos_arquitectura($conn)
{
    $sql = "SELECT * FROM arquitectura";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $resultado->num_rows ? $resultado : false); //ternarios

}
