/* global $scope */

var cadena = "";
var urlImg;
var srcImg;
function valor(val) {
    var nom = $('#nCancion').val();
    var array = $("#lista").val();
    cadena = "{'id':" + "'" + val + "'" + "}," + array + "";
    var total = parseInt( $("#total").val());
    var suma= parseInt(total+1);
    url = "?nombreCancion=" + nom + "&lista=" + cadena+"&total="+suma;
    location.href = "Buscar.jsp" + url;
}
$(document).ready(function () {
    $("#form").submit(function () {
        redirect(false);
    });
    $(this).keydown(function (event){
        var num= String.fromCodePoint(event.which);
        if(event.which===39){
            siguiente();
            //alert(srcImg);
    }else if(event.which===37){
            atras();
            //alert(srcImg);
    }
    });
    var numImg= document.getElementsByName("img");
    urlImg=numImg;    
});
function siguiente(){
    var hrefimg=srcImg;
    var listUrl=urlImg;
    var position=0;
    var siguiente =0;
    for(var i=0;i<listUrl.length;i++){   
            if(hrefimg===listUrl[i].value){
             position= parseInt(i);
             siguiente=parseInt(position+1);
            }                
    }
    for (var i =position; i <siguiente ; i++) {
        document.getElementById("imgDialog").src=listUrl[siguiente].value;
        srcImg=listUrl[siguiente].value;
    }
}
function atras(){
    var hrefimg=srcImg;
    var listUrl=urlImg;
    var position=0;
    var atrasImg =0;
    for(var i=0;i<listUrl.length;i++){   
            if(hrefimg===listUrl[i].value){
             position= parseInt(i);
             atrasImg=parseInt(position-1);
            }                
    }
    for (var i =position; i >atrasImg ; i--) {
        document.getElementById("imgDialog").src=listUrl[atrasImg].value;
        srcImg=listUrl[atrasImg].value;
    }
}
function dialogo(id,src){
       $("#dialogo").show();
       srcImg=src;
        document.getElementById("imgDialog").src=src;
}
function salir(){
  var dialog= $("#dialogo").fadeOut();
}
function redirect(valTotal) {
    var nom = $('#nCancion').val();
    var historial = $("#lista").val();
    if (valTotal) {
        var total = $("#total").val();
        var resta = total - 1;
        url = "?nombreCancion=" + nom + "&lista=" + historial + "&total=" + resta;
        location.href = "Buscar.jsp" + url;
    } else {
        var total = $("#total").val();
        if(total!==null){
        url = "?nombreCancion=" + nom + "&lista=" + historial + "&total=" + total;
        location.href = "Buscar.jsp" + url;
        }else{
            url = "?nombreCancion=" + nom + "&lista=" + historial + "&total=" + 0;
        location.href = "Buscar.jsp" + url;
        }
    }
}
function quitar(id, idval) {
    getLista = $("#lista").val();
    //array="["+getLista+"]";
    $("#lista").val(getId(getLista, idval));
    if ($(id).fadeOut()) {
        redirect(true);
    }
}
function getId(json, id) {
    var idQuitar = "";
    var newJson = "";
    var contador = 0;
    var encontro = 0;
    var array = new Array();
    for (var item in json) {
        if (json[item] !== ",") {
            if (json[item] > 0) {
                idQuitar = idQuitar + json[item];
                newJson = newJson + json[item];
                if (idQuitar === id) {
                    idQuitar = "";
                    encontro++;
                } else {
                    idQuitar = "";
                    encontro = 0;
                }
            } else {
                newJson = newJson + json[item];
            }
        } else {
            if (encontro > 0) {
                array[contador] = newJson;
                contador++;
                newJson = "";
            } else {
                newJson = "";
            }
        }
    }
    jsonNew = json.replace(array + ",", "");
    return jsonNew;
}
function sedAjax(datos, pag) {
    $.ajax({type: 'POST', data: datos, url: pag});
}

