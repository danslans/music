/* global $scope */
function SelectImagen(val) {
    var nom = $('#nCancion').val();//nombre de la cancion 
    var array = $("#lista").val();//Json
    var arrayId = creacionArrayId(array.toString());
    if (validarIdArray(arrayId, val.toString())) {
        var cadena = "{'id':" + "'" + val + "'" + "}," + array + "";
        var total = parseInt($("#total").val());
        var suma = parseInt(total + 1);
        url = "?nombreCancion=" + nom + "&lista=" + cadena + "&total=" + suma;
        location.href = "Buscar.jsp" + url;
    } else {
        alert("ya se ha seleccionado");
    }

}
$(document).ready(function () {
    $(this).keydown(function (event) {
        if (event.which === 13) {
            redirect(false);
        }
    });
    $().submit(function () {
        
    });
});
function validarIdArray(arrayId, val) {
    cont = 0;
    for (var item in arrayId) {
        if (val === arrayId[item]) {
            cont++;
        }
    }
    if (cont > 0) {
        return false;
    } else {
        return true;
    }
}
function creacionArrayId(json) {
    var c = 0;
    var arrayIds = new Array();
    var constructId = "";
    for (var item in json) {

        if (json[item] !== "'") {
            if (json[item] >= 0) {
                constructId += json[item];
            }
        } else {
            if (constructId > 0) {
                arrayIds[c] = constructId;
                c++;
                constructId = "";
            }
            constructId = "";
        }

    }
    return arrayIds;
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
        if (jQuery.type(total) !== "undefined") {
            url = "?nombreCancion=" + nom + "&lista=" + historial + "&total=" + total;
            location.href = "Buscar.jsp" + url;
        } else {
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
//funcion que quita del json un objeto
function getId(json, id) {
    var idQuitar = "";
    var newJson = "";
    var contador = 0;
    var encontro = 0;
    var array = new Array();
    for (var item in json) {
        if (json[item] !== ",") {
            if (json[item] >= 0) {
                idQuitar += json[item];
                newJson = newJson + json[item];
                if (idQuitar === id) {
                    idQuitar = "";
                    encontro=1;
                } else {
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
                idQuitar="";
            }
        }
    }
    jsonNew = json.replace(array + ",", "");
    return jsonNew;
}
function sedAjax(datos, pag) {
    $.ajax({type: 'POST', data: datos, url: pag});
}

