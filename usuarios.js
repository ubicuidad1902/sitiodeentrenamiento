$(document).ready(function () {
    console.log("Mi archivo usuarios.js funciona bien")
    
    traer_todos_us()
    let contador = 0
    $("#form_usuarios").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let nombre = $("#in_nombre_usuarios").val()//Sacamos la información del campo in_nombre_personajes
        let telefono = $("#in_telefono_usuarios").val()//Sacamos información del campo in_resena_personajes
        let correo = $("#in_correo_usuarios").val()
        let a_paterno = $("#in_a_paterno_usuarios").val()
        let a_materno = $("#in_a_materno_usuarios").val()
        let fecha_nacimiento = $("#in_fecha_nacimiento_usuarios").val()
        let genero = $("in_genero_usuarios").val()
        let formulario = $(this).serialize()
        crear_usuarios(formulario)//todo lo que ya saqué, se está enviando mediante esa variable.
        console.log(nombre, telefono, correo, a_paterno, a_materno, fecha_nacimiento, genero);

    });
    /**
     * @function void cargar todos los registros de efémerides desde la base de datos.
     * 
     */
    function traer_todos_us() {
        $.ajax({
            type: "POST",
            url: "traer_us.php",
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos cargados')
                    console.log(response.datos);//tiene los 4 registros que aparecen en la consola.
                    let us =response.datos
                    let registros = ""
                    for (const usuarios of us) {//an es el objeto.
                        //así los datos se van acumulando
                        registros += //¿para qué es la comilla simple? 
                        ` 
                        <tr>
                            <td>${usuarios.idusuarios}</td>
                            <td>${usuarios.nombre}</td>
                            <td>${usuarios.telefono}</td>
                            <td>${usuarios.correo}</td>
                            <td>${usuarios.a_paterno}</td>
                            <td>${usuarios.a_materno}</td>
                            <td>${usuarios.fecha_nacimiento}</td>
                            <td>${usuarios.genero}</td>
                            <td>
                                <button type="button">Editar</button>
                            </td>
                            <td>
                                <button class="eliminar" id_usuario="${usuarios.idusuarios}" type="button">Eliminar</button>
                            </td>
                        </tr>
                        
                        `
                    }
                    $("#tb_us").html(registros)//estoy arrastrando el cuerpo de la tabla.

                     $(".eliminar").click(function (e) { 
                        e.preventDefault();
                        let id_usuario = $(this)[0].attributes[1].value
                        eliminar_usuario(id_usuario)
                     });
                } else {
                    console.log("Datos no cargados por: " + response.mensaje)
                }
            }
        });
    }

    function eliminar_usuario(id_usuario){
        let datos = {
            'id_usuario': id_usuario
        }    

        $.ajax({
            type: "POST",
            url: "eliminar_us.php",
            data: datos,
            dataType: "JSON",
            error: function(xhr, status){
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos eliminados')
                    traer_todos_us()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                
                } else {
                    console.log("Datos no eliminados por: " + response.mensaje)
                }
            }
        });
    }

    /**
     * 
     * @param {object} formulario que contiene título, fecha, reseña, estado y likes. 
     */
    function crear_usuarios(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",//recoger datos tras bambalinas.
            url: "usuarios.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status) {
                console.log(xhr.responseText)
            },
            success: function (response) {
                if (response.response === "exito") {
                    console.log('Datos guardados')
                    traer_todos_us()//función que carga los datos de la base de datos en una tabla que se carga en el archivo html.
                
                } else {
                    console.log("Datos no guardados por: " + response.mensaje)
                }
            }
        });
    }
});//