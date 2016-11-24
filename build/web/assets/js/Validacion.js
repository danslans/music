var cadena = "";
function valor(val) {
    var nom = $('#nCancion').val();
    var array = $("#lista").val();
    //cadena = "id" + cadena + val + " " + array;
    cadena=cadena+"{'id':"+ "'"+val+"'"+"},"+array+"";
    //jsonArray="["+cadena+"]";'"'+val+'"'+"},"+array+"";
    url = "?nombreCancion=" + nom + "&lista="+cadena;
    location.href = "Buscar.jsp" + url;
}
$(document).ready(function () {
    $("form").submit(function () {
        var nom = $('#nCancion').val();
        historial = $("#lista").val();
        url = "?nombreCancion=" + nom + "&lista=" + historial;
        alert(url);
        location.href = "Buscar.jsp" + url;
    });
});
function sedAjax(datos, pag) {
    $.ajax({type: 'POST', data: datos, url: pag});
}

