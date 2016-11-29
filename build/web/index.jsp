<%-- 
    Document   : index
    Created on : 09-nov-2016, 21:08:37
    Author     : danslans
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Imagen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cad.ImagenCad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
ImagenCad imagenCad =new ImagenCad();

%>
<!DOCTYPE html>
<html>
	<head>
		<title>MM-Music</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" href="assets/css/styles.css">
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
           
		<!-- Wrapper -->
			<div id="wrapper">

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
				<!-- Main -->
					<div id="">						
                                                <%
                                                   ResultSet resultSet=imagenCad.buscar();
                                                   while(resultSet.next()){
                                                   
                                                %>
                                                	<article class="">
                                                            <a href="<%= resultSet.getString("id_img") %>" class=""><img src='<%= resultSet.getString("id_img") %>' alt="" height="300%" width="100%" /></a>
                                                            <h2><%= resultSet.getString("fecha") %></h2>
							<p></p>
						</article>
                                                <%
                                                }
                                                %>
					</div>

			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
                        <script type="text/javascript" src="assets/js/Validacion.js"></script>
                <!-- jQuery library -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                <!-- Latest compiled JavaScript -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			

	</body>
</html>