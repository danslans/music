function logoutSession() {
    $("#logoutAdmin").click(function (){
        window.location.href="LogoutServlet?salir=true";
    });
    $("#logoutUser").click(function (){
        window.location.href="LogoutServlet?salir=true";
    });
}