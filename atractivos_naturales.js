$(document).ready(function () {
    console.log("Mi archivo atractivos_naturales.js funciona bien")
    traer_todos_an()
    let contador = 0
    $("#form_atractivos_naturales").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let nombre = $("#in_nombre_atractivos_naturales").val()//Sacamos la información del campo in_nombre_personajes
        let ubicacion = $("#in_ubicacion_atractivos_naturales").val()//Sacamos información del campo in_resena_personajes
        let formulario = $(this).serialize()
        crear_atractivos_naturales(formulario)//todo lo que ya saqué, se está enviando mediante esa variable.


    });
    /**
     * @function void cargar todos los registros de atractivos naturales desde la base de datos.
     */
    function traer_todos_an() {
        $.ajax({
            type: "POST",
            url: "traer_an.php",
            data: "",
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos cargados')
                    console.log(response.datos);//tiene los 4 registros que aparecen en la consola.
                    let an =response.datos
                    let registros = ""
                    for (const atractivo of an) {//an es el objeto.
                        //así los datos se van acumulando
                        registros += //¿para qué es la comilla simple? 
                        ` 
                        <tr>
                            <td>${atractivo.idatractivos_naturales}</td>
                            <td>${atractivo.nombre}</td>
                            <td>${atractivo.ubicacion}</td>
                            <td>${atractivo.likes}</td>
                            <td>
                                <button type="button">Editar</button>
                            </td>
                            <td>
                                <button type="button">Eliminar</button>
                            </td>
                        </tr>
                        
                        `
                    }
                    $("#tb_an").html(registros)//estoy arrastrando el cuerpo de la tabla.
                } else {
                    console.log("Datos no cargados por: " + response.mensaje)
                }
            }
        });
    }
    /**
     * 
     * @param {object} formulario que contiene el nombre y ubicación del atractivo natural que describen la funcionalidad. 
     * 
     */
    function crear_atractivos_naturales(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",//recoger datos tras bambalinas.
            url: "atractivos_naturales.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos guardados')
                    traer_todos_an()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                } else {
                    console.log("Datos no guardados por: " + response.mensaje)
                }
            }
        });
    }
});//