/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showModal() {
    document.getElementById('openModal').style.display = 'block';
}

function CloseModal() {
    document.getElementById('openModal').style.display = 'none';
}

function errorEliminarCategoria() {
    document.getElementById('titulo-error').innerHTML = 'No se ha podido eliminar la Categoria';
    document.getElementById('msg-error').innerHTML = 'No puedes eliminar la <strong>categoria</strong> porque esta siendo usada como FK por una o varias series.';
    showModal();
}

function errorEliminarSerie() {
    document.getElementById('titulo-error').innerHTML = 'No se ha podido eliminar la Serie';
    document.getElementById('msg-error').innerHTML = 'No puedes eliminar la <strong>serie</strong> porque esta siendo usada como FK por uno o varios productos.';
    showModal();
}

function errorEliminarProducto() {
    document.getElementById('titulo-error').innerHTML = 'No se ha podido eliminar el Producto';
    document.getElementById('msg-error').innerHTML = 'No puedes eliminar el <strong>producto</strong> porque esta siendo usado como FK por uno o varios estoc.';
    showModal();
}

function escucharURL() {
    var url_string = window.location;
    var url = new URL(url_string);
    var eliminarCat = url.searchParams.get("eliminarCat");
    var eliminarSer = url.searchParams.get("eliminarSer");
    var eliminarProd = url.searchParams.get("eliminarProd");
    if (eliminarCat == "false") {
        errorEliminarCategoria();
    }
    if (eliminarSer == "false") {
        errorEliminarSerie();
    }
    if (eliminarProd == "false") {
        errorEliminarProducto();
    }
}
window.addEventListener("load", escucharURL);

//$(document).ready(function () {
//    $("#boton").click(function () {
//        //alert("hola");
//        var pasar = true
//        if ($("#nombre").val() === "") {
//            $("#error_nombre").html("Ingrese username desde cliente");
//            pasar = false;
//        } else {
//            $("#error_nombre").html("");
//        }
//
//        if ($("#password").val() === "") {
//            $("#error_password").html("Ingrese password desde cliente");
//            pasar = false;
//        } else {
//            $("#error_password").html("");
//        }
//
//        if ($("#email").val() === "") {
//            $("#error_email").html("Ingrese email desde cliente");
//            pasar = false;
//        } else {
//            $("#error_email").html("");
//        }
//        return pasar;
//    });
//});










// validar formularios--------------------------------------------------------------------------------------
// validar formularios--------------------------------------------------------------------------------------
// validar formularios--------------------------------------------------------------------------------------

var namePattern = "^[a-z A-Z]{4,30}$";
var emailPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$";
var passPattern = "^[a-z A-Z 0-9]{4,30}$";

function checkInput(idInput, pattern) {
    return $(idInput).val().match(pattern) ? true : false;
}

function checkTextarea(idText) {
    return $(idText).val().length > 12 ? true : false;
}

function checkRadioBox(nameRadioBox) {
    return $(nameRadioBox).is(":checked") ? true : false;
}

function checkSelect(idSelect) {
    return $(idSelect).val() != "0" ? true : false;
}

function ocultarError(idDiv) {
    $(idDiv).html("");
}

function mostrarError(idDiv, error) {
    //$(idDiv).append(error);
    $(idDiv).html(error);
}

// ejemplo -------------------------------------------------------
//function checkForm(idForm) {
//    $(idForm + " *").on("change keydown", function () {
//        if (checkInput("#nombre", namePattern) &&
//                checkInput("#apellidos", namePattern) &&
//                checkInput("#email", emailPattern) &&
//                checkSelect("#edad") &&
//                checkTextarea("#comentario") &&
//                checkRadioBox("#legal") &&
//                checkRadioBox("[name=boletin]"))
//        {
//            enableSubmit(idForm);
//        } else {
//            disableSubmit(idForm);
//        }
//    });
//}

// categoria -------------------------------------------------------
function checkFormCategoria(idForm) {
    $(idForm).on("submit", function () {
        //alert('a');
        if (checkInput("#categoria_nom", namePattern)) {
            ocultarError("#err_categoria_nom");
        } else {
            mostrarError("#err_categoria_nom", "Requiere minimo 4 caracteres");
            return false;
        }
    });
}

$(function () {
    checkFormCategoria("#categoria");
});

// serie -------------------------------------------------------
function checkFormSerie(idForm) {
    $(idForm).on("submit", function () {
        //alert('a');
        var res = true;
        if (checkInput("#serie_nom", namePattern)) {
            ocultarError("#err_serie_nom");
        } else {
            mostrarError("#err_serie_nom", "Requiere minimo 4 caracteres");
            res = false;
        }
        
        if (checkSelect("#categoria_id")) {
            ocultarError("#err_categoria_id");
        } else {
            mostrarError("#err_categoria_id", "Requiere seleccionar 1");
            res = false;
        }
        
        return res;
    });
}

$(function () {
    checkFormSerie("#serie");
});

// login -------------------------------------------------------
function checkFormLogin(idForm) {
    $(idForm).on("submit", function () {
        //alert('a');
        var res = true;
        if (checkInput("#email_usuario", emailPattern)) {
            ocultarError("#err_email_usuario");
        } else {
            mostrarError("#err_email_usuario", "Introduce un correo valido");
            res = false;
        }
        
        if (checkInput("#password_usuario", passPattern)) {
            ocultarError("#err_password_usuario");
        } else {
            mostrarError("#err_password_usuario", "Minimo 4 caracteres");
            res =  false;
        }
        
        return res;
    });
}

$(function () {
    checkFormLogin("#usu");
});


 //usuario (lo deshabilitamos para ver la validacion de servidor)-------------------------------------------------------
function checkFormUsu(idForm) {
    $(idForm).on("submit", function () {
        //alert('a');
        var res = true;
        if (checkInput("#nombre_usuario", namePattern)) {
            ocultarError("#err_nombre_usuario");
        } else {
            mostrarError("#err_nombre_usuario", "Minimo 4 letras");
            res = false;
        }
        
        if (checkInput("#apellido_usuario", namePattern)) {
            ocultarError("#err_apellido_usuario");
        } else {
            mostrarError("#err_apellido_usuario", "Minimo 4 letras");
            res = false;
        }
        
        if (checkInput("#email_usuario", emailPattern)) {
            ocultarError("#err_email_usuario");
        } else {
            mostrarError("#err_email_usuario", "Introduce un correo valido");
            res = false;
        }
        
        if (checkInput("#password_usuario", passPattern)) {
            ocultarError("#err_password_usuario");
        } else {
            mostrarError("#err_password_usuario", "Minimo 4 caracteres");
            res =  false;
        }
        
        return res;
    });
}

$(function () {
    checkFormUsu("#usuario");
});























//$('#btn_registrarse').on('click', function() {
//  $('input').each(function(index, item){
//    var $input = $(item);
//    $input.closest('div').removeClass('has-error');
//    if ($input.val().trim() == '') {
//      $input.closest('div').addClass('has-error');
//    }
//  });
//});