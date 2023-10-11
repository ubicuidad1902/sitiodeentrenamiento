$(document).ready(function () {
    console.log("Mi archivo efemerides.js funciona bien")
    
    traer_todos_ef()
    let contador = 0
    $("#form_efemerides").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let titulo = $("#in_titulo_efemerides").val()//Sacamos la información del campo in_nombre_personajes
        let resena = $("#in_resena_efemerides").val()//Sacamos información del campo in_resena_personajes
        let formulario = $(this).serialize()
        crear_efemerides(formulario)//todo lo que ya saqué, se está enviando mediante esa variable.


    });
    /**
     * @function void cargar todos los registros de efémerides desde la base de datos.
     * 
     */
    function traer_todos_ef() {
        $.ajax({
            type: "POST",
            url: "traer_ef.php",
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos cargados')
                    console.log(response.datos);//tiene los 4 registros que aparecen en la consola.
                    let ef =response.datos
                    let registros = ""
                    for (const efemerides of ef) {//an es el objeto.
                        //así los datos se van acumulando
                        registros += //¿para qué es la comilla simple? 
                        ` 
                        <tr>
                            <td>${efemerides.idefemerides}</td>
                            <td>${efemerides.titulo_efemeride}</td>
                            <td>${efemerides.fecha}</td>
                            <td>${efemerides.resena}</td>
                            <td>${efemerides.estado}</td>
                            <td>${efemerides.likes}</td>
                            <td>
                                <button type="button">Editar</button>
                            </td>
                            <td>
                                <button type="button">Eliminar</button>
                            </td>
                        </tr>
                        
                        `
                    }
                    $("#tb_ef").html(registros)//estoy arrastrando el cuerpo de la tabla.
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
    function crear_efemerides(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",//recoger datos tras bambalinas.
            url: "efemerides.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos guardados')
                    traer_todos_ef()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                
                } else {
                    console.log("Datos no guardados por: " + response.mensaje)
                }
            }
        });
    }
});//