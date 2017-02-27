<%-- 
    Document   : login
    Created on : 11-feb-2017, 18:32:09
    Author     : danslans
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    if (session.getAttribute("user") == null) {

%>
<!DOCTYPE html>
<html>
    <head>
        <title>TheMusicSheet</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/StyleCelularLogin.css"/>
        <link rel="stylesheet" href="assets/css/StyleTabletLogin.css"/>
        <link rel="stylesheet" href="assets/css/StyleLogin.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="panelLogin">
            <h3>Login</h3>
            <ul class="ulFormLogin">
                <li>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Nickname">
                    </div>
                </li>
                <li>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>  
                        <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
                    </div> 
                </li>
                <li>
                    <div class="input-group">
                        <button  class="btn btn-default" name="enter" id="enter" >Entrar</button>
                    </div>
                </li>
            </ul>
        </div>
<script type="text/javascript" src="assets/js/LoginController.js"></script>
</body>
</html>
<%} else {
        response.sendRedirect("index.jsp?p=idx");
    }%>
