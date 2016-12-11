/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var urlImg;
var srcImg;
$(document).ready(function () {
    $("#dialogo").fadeOut();
    $(this).keydown(function (event) {
        var num = String.fromCodePoint(event.which);
        if (event.which === 39) {
            siguiente();
            //alert(srcImg);
        } else if (event.which === 37) {
            atras();
            //alert(srcImg);
        }
    });
    $(this).bind("swipeleft",function (){
        atras();
    });
    $(this).bind("swiperight",function (){
        siguiente();
    });
    var numImg = document.getElementsByName("img");
    urlImg = numImg;
});
function siguiente() {
    var hrefimg = srcImg;
    var listUrl = urlImg;
    var position = 0;
    var siguiente = 0;
    for (var i = 0; i < listUrl.length; i++) {
        if (hrefimg === listUrl[i].value) {
            position = parseInt(i);
            siguiente = parseInt(position + 1);
        }
    }
    for (var i = position; i < siguiente; i++) {
        document.getElementById("imgDialog").src = listUrl[siguiente].value;
        srcImg = listUrl[siguiente].value;
    }
}
function atras() {
    var hrefimg = srcImg;
    var listUrl = urlImg;
    var position = 0;
    var atrasImg = 0;
    for (var i = 0; i < listUrl.length; i++) {
        if (hrefimg === listUrl[i].value) {
            position = parseInt(i);
            atrasImg = parseInt(position - 1);
        }
    }
    for (var i = position; i > atrasImg; i--) {
        document.getElementById("imgDialog").src = listUrl[atrasImg].value;
        srcImg = listUrl[atrasImg].value;
    }
}

function dialogo(id, src) {
    $("#dialogo").show();
    srcImg = src;
    document.getElementById("imgDialog").src = src;
}
function salir() {
    var dialog = $("#dialogo").fadeOut();
}