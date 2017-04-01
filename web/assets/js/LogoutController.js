function logoutSession() {
    $("#logout").click(function (){
        window.location.href="LogoutServlet?salir=true";
    });
}
function closeSession() {
    window.location.href="LogoutServlet?salir=true";
} 