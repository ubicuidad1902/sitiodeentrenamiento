$(document).ready(function () {
    traer_toda_arquitectura()
    console.log("Mi archivo arquitectura.js funciona bien")
    let contador=0
    $("#form_arq").submit(function (e) { /* Estamos preparando una función para cuando demos clic en guardar */
        e.preventDefault();
        let nombre=$("#in_nombre_arq").val()//Sacamos la información del campo in_nombre_ar
        let ubicacion=$("#in_ubicacion_arq").val()//Sacamos información del campo in_ubicacion_arq
        let formulario= $(this).serialize()
        crear_nueva_arquitectura(formulario)
        
        
    });
    /**
     * @function void cargar todos los registros de arquitectura desde la base de datos.
     */
    function traer_toda_arquitectura () {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",
            url: "traer_arquitectura.php",
            dataType: "JSON",
            error: function (xhr, status){
                console.log(xhr.responseText)
            },
            success: function (response) {
                if(response.response==="exito"){
                    console.log('Datos cargados')
                    console.log(response.datos);
                    let arquitectura  = response.datos
                    let registros =""
                    for (const arq of arquitectura){
                        registros +=
                        `
                        <tr>
                            <td>
                            <td>${arq.idarquitectura}</td>
                            <td>${arq.nombre}</td>
                            <td>${arq.ubicacion}</td>
                            <td>${arq.likes}</td>
                            <td>
                                <button type="button">Editar </button>
                            </td>
                            <td>
                                <button type="button">Eliminar</button>    
                            </td>
                            </tr>
                        `
                    }
                    $("#tb_arq").html(registros)//punto es que invoco una función.
                } else{
                    console.log("Datos no cargados por: " +response.mensaje)
                }
            }
        });
    }
/**
 * 
 * @param {object} formulario que contiene nombre, ubicación y likes. 
 */
    function crear_nueva_arquitectura(formulario) {
        //ver si los datos entre la función y el evento se están realizando, imprime.
        $.ajax({
            type: "POST",
            url: "arquitectura.php",
            data: formulario,
            dataType: "JSON",
            error: function (xhr, status){
                console.log(xhr.responseText)
            },
            success: function (response) {
                if(response.response==="éxito"){
                    console.log('Datos guardados') 
                } else{
                    console.log("Datos no guardados por: " +response.mensaje)
                }
            }
        });
    }
});//