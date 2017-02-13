$(document).ready(function () {
    $("#enter").click(function () {
        var user = $("#username").val();
        var pass = $("#pwd").val();
        var url = "datos=0" + "&pass=" + pass + "&user=" + user;
        sedAjax(url, "LoginServlet");
        setInterval(function () {
            window.location.reload();
        }, 1000);
    });
});

function sedAjax(datos, pag) {
    $.ajax({type: 'POST', data: datos, url: pag, success: function (data, textStatus, jqXHR) {
            if(data!==""){
             alert(data);   
            }
        }});
}