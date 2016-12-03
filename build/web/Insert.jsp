<%-- 
    Document   : index
    Created on : 09-nov-2016, 21:08:37
    Author     : danslans
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">
                <!-- jQuery library -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                <!-- Latest compiled JavaScript -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body> 
        <!-- Header -->
					<header id="header">
						<h1><a href="index.jsp"><strong>MMM -</strong>Music</a></h1>
						<nav>
							<ul>
                                                            <li><a href="Insert.jsp" >Insertar</a></li>
                                                            <li><a href="Buscar.jsp" >Buscar</a></li>
                                                                
							</ul>
						</nav>
					</header>
        <form action="Servlet" method="POST">
            <input type="number" class="input" name="cantidad" placeholder="Cantidad">
            <input type="hidden" name="number"  value="true">
            <input type="submit" class="boton" id="number">
        </form>
    </body>
</html>
