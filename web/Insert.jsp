<%-- 
    Document   : index
    Created on : 09-nov-2016, 21:08:37
    Author     : danslans
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession hs = request.getSession();
    if (hs.getAttribute("user") != null) {
        String nombreUser = hs.getAttribute("user").toString();
        int rolUser = Integer.parseInt(hs.getAttribute("rol").toString());
        int idUser= Integer.parseInt(hs.getAttribute("idUser").toString());
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TheMusicSheet</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/StyleAppWeb.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body> 
        <!-- Header -->
        <header id="header">
            <h1><a href="index.jsp"><strong>TheMusicSheet</strong></a></h1>
            <nav>
                <ul id="ul">
                    <% switch (rolUser) {
                            case 1:
                    %>
                    <li><a href="Insert.jsp" >Insertar</a></li>
                    <li><a href="Buscar.jsp" >Buscar</a></li>
                    <li><a id="logoutAdmin" >Salir</a></li>    
                        <%
                                break;
                            case 2:
                        %>
                    <li><a href="Buscar.jsp" >Buscar</a></li>
                    <li><a id="logoutUser" >Salir</a></li>    
                        <%
                                    break;
                            } %>
                </ul>
            </nav>
        </header>
        <form action="Servlet" method="POST">
            <input type="number" class="input" name="cantidad" placeholder="Cantidad">
            <input type="hidden" name="number"  value="true">
            <input type="submit" class="boton" id="number">
        </form>
        <!-- My library-->
        <script type="text/javascript" src="assets/js/InsertarController.js"></script>
        <script type="text/javascript" src="assets/js/LogoutController.js"></script>
        <!-- jQuery library -->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.poptrox.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>       
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>                
    </body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>