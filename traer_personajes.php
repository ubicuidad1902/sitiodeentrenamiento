<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.


if ($encontrados = traer_todos_personajes($conn)) {
    $personajes = [];
    while ($encontrado = $encontrados->fetch_assoc()){
        $personajes[] =$encontrado;
    }
    
    $respuesta = [
        'response' => 'exito',
        'datos'=>$personajes, 
        'mensaje' => 'Los personajes fueron cargados',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'Los personajes no pudieron ser cargados',
    ];
}
echo json_encode($respuesta);

function traer_todos_personajes($conn)
{
    $sql = "SELECT * FROM personajes";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $resultado->num_rows ? $resultado : false); //ternarios

}
