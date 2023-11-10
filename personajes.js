$(document).ready(function () {
    console.log("Mi archivo personajes.js funciona bien")
    traer_todos_personajes()
    let contador = 0
    $("#form_personajes").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let nombre = $("#in_nombre_personajes").val()//Sacamos la información del campo in_nombre_personajes
        let resena = $("#in_resena_personajes").val()//Sacamos información del campo in_resena_personajes
        let likes = $("#in_likes_personajes").val()
        let fecha = $("#in_fecha-personajes").val()
        let formulario = $(this).serialize()
        crear_personajes(formulario)


    });
    /**
     * Cargar todos los registros desde la base de datos personajes.
     */

    function traer_todos_personajes() {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",
            url: "traer_personajes.php",
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos cargados')
                    console.log(response.datos);
                    let personajes = response.datos
                    let registros = ""
                    for (const personaje of personajes) {
                        registros +=
                            `
                        <tr>
                            <td>
                            <td>${personaje.idpersonajes}</td>
                            <td>${personaje.Nombre_personaje}</td>
                            <td>${personaje.resena}</td>
                            <td>${personaje.fecha}</td>
                            <td>${personaje.likes}</td>
                            <td>
                                <button type="button">Editar </button>
                            </td>
                            <td>
                                <button class="eliminar" id_usuario="${personaje.idpersonajes}" type="button">Eliminar</button>    
                            </td>
                            </tr>
                        `
                    }
                    $("#tb_per").html(registros)//punto es que invoco una función.
                    $(".eliminar").click(function (e) {
                        e.preventDefault();
                        let id_personajes = $(this)[0].attributes[1].value
                        eliminar_personajes(id_personajes)
                    });
                } else {
                    console.log("Datos no cargados por: " + response.mensaje)
                }
            }
        });
    }

    function eliminar_personajes(id_personajes) {
        let datos = {
            'id_personajes': id_personajes
        }

        $.ajax({
            type: "POST",
            url: "eliminar_per.php",
            data: datos,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos eliminados')
                    //alert("Datos eliminados")
                    traer_todos_personajes()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                } else {
                    console.log("Datos no eliminados por: " + response.mensaje)
                }
            }
        });
    }

    /**
     * 
     * @param {object} formulario que contiene nombre, reseña, fecha y likes. 
     */
    function crear_personajes(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",//recoger datos tras bambalinas.
            url: "personajes.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos guardados')
                    traer_todos_personajes()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                } else {
                    console.log("Datos no guardados por: " + response.mensaje)
                }
            }
        });
    }









});