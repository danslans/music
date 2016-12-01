/* global $scope */

var cadena = "";
function valor(val) {
    var nom = $('#nCancion').val();
    var array = $("#lista").val();
    cadena="{'id':"+ "'"+val+"'"+"},"+array+"";
    url = "?nombreCancion=" + nom + "&lista="+cadena;
    location.href = "Buscar.jsp" + url;
}
$(document).ready(function () {
    $("form").submit(function () {
        var nom = $('#nCancion').val();
        historial = $("#lista").val();
        url = "?nombreCancion=" + nom + "&lista=" + historial;
        location.href = "Buscar.jsp" + url;
    });
});
function quitar(id,idval){
    getLista=$("#lista").val();
    //array="["+getLista+"]";
    alert(getId(getLista,idval));
    $(id).fadeOut();
}   
function getId(json,id){
    var idQuitar="";  
    var newJson="";
    for (var item in json) {
        if(json[item]!==","){
        if(json[item]>0){
            idQuitar=idQuitar+json[item];
            if(idQuitar===id){
                //return idQuitar;   
             newJson=newJson+idQuitar;   
            }
        }else{
            newJson=newJson+json[item];
            idQuitar="";
        }
    }else{
        break;
    }
}
    jsonNew=json.replace(newJson,"");
    return jsonNew;
    //return s;
}
function sedAjax(datos, pag) {
    $.ajax({type: 'POST', data: datos, url: pag});
}

