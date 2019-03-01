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