$(document).ready(function () {
    console.log("Mi archivo eventos.js funciona bien")
    
    traer_todos_ev()
    let contador = 0
    $("#form_eventos").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let titulo = $("#in_titulo_eventos").val()//Sacamos la información del campo in_nombre_personajes
        let resena = $("#in_resena_eventos").val()//Sacamos información del campo in_resena_personajes
        let sub_titulo = $("#in_sub_titulo_eventos").val()
        let fecha_evento = $("#in_fecha_evento").val()
        let hora_evento = $("#in_hora_evento").val()
        let categoria = $("#in_categoria").val()
        let formulario = $(this).serialize()
        crear_eventos(formulario)//todo lo que ya saqué, se está enviando mediante esa variable.
        console.log(titulo, resena, sub_titulo, fecha_evento, categoria, hora_evento);

    });
    /**
     * @function void cargar todos los registros de efémerides desde la base de datos.
     * 
     */
    function traer_todos_ev() {
        $.ajax({
            type: "POST",
            url: "traer_ev.php",
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos cargados')
                    console.log(response.datos);//tiene los 4 registros que aparecen en la consola.
                    let ev =response.datos
                    let registros = ""
                    for (const eventos of ev) {//an es el objeto.
                        //así los datos se van acumulando
                        registros += //¿para qué es la comilla simple? 
                        ` 
                        <tr>
                            <td>${eventos.ideventos}</td>
                            <td>${eventos.titulo}</td>
                            <td>${eventos.fecha_publicacion}</td>
                            <td>${eventos.resena}</td>
                            <td>${eventos.fecha_evento}</td>
                            <td>${eventos.sub_titulo}</td>
                            <td>
                                <button type="button">Editar</button>
                            </td>
                            <td>
                                <button type="button">Eliminar</button>
                            </td>
                        </tr>
                        
                        `
                    }
                    $("#tb_ev").html(registros)//estoy arrastrando el cuerpo de la tabla.
                } else {
                    console.log("Datos no cargados por: " + response.mensaje)
                }
            }
        });
    }

    /**
     * 
     * @param {object} formulario que contiene título, fecha, reseña, estado y likes. 
     */
    function crear_eventos(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",//recoger datos tras bambalinas.
            url: "eventos.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos guardados')
                    traer_todos_ev()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                
                } else {
                    console.log("Datos no guardados por: " + response.mensaje)
                }
            }
        });
    }
});//