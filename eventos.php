<?php

require_once "config.php"; //con require_once importo todo el código de otro archivo.
date_default_timezone_set('America/Mazatlan');

$titulo = $_POST["titulo_eventos"];
$resena = $_POST["resena_eventos"];
$sub_titulo = $_POST["sub_titulo_eventos"];
$fecha_evento = $_POST["fecha_evento"];
$hora = $_POST["hora_evento"];
$categoria = $_POST["categoria"];
$fecha_completa=$fecha_evento." ".$hora.":42";
//echo $fecha_completa." ";
$fecha_actual = date("Y-m-d h:i:s");
$id_usuario = 9;

//echo $fecha_actual;
//variable en la que estoy guardando (izquierda) y cómo se llama el dato en html (derecha).
/* echo $titulo;
echo $resena;
echo $sub_titulo;
echo $fecha_evento;
echo $hora;
echo $categoria;
Este bloque de echo es para revisar que los datos están llegando a este archivo.
 */
if ($creado = crear_eventos($titulo, $resena, $sub_titulo, $fecha_actual, $fecha_completa, $categoria, $id_usuario, $conn)) {
    $respuesta = [
        'response' => 'exito',
        'mensaje' => 'El registro del evento fue ingresado',
    ];
} else {
    $respuesta = [
        'response' => 'no exito',
        'mensaje' => 'el registro del evento no pudo ser ingresado',
    ];
}
echo json_encode($respuesta);

function crear_eventos($titulo, $resena, $sub_titulo, $fecha_actual, $fecha_completa, $categoria, $id_usuario, $conn)
{
    $sql = "INSERT INTO eventos(titulo, sub_titulo, fecha_publicacion, fecha_evento, resena, categoria, id_usuario) VALUES ('$titulo', '$sub_titulo', '$fecha_actual', '$fecha_completa', '$resena', '$categoria', $id_usuario)";
    $resultado = $conn->query($sql); //me traje todo de configuración pues todas las veces que yo necesite revisar una base de datos voy a utilizar la conexión.
    return ($resultado && $conn->affected_rows ? true : false); //ternarios

}
