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
<%
    HttpSession hs = request.getSession();
    if (hs.getAttribute("user") != null) {
        String nombreUser = hs.getAttribute("user").toString();
        int rolUser = Integer.parseInt(hs.getAttribute("rol").toString());
        int idUser = Integer.parseInt(hs.getAttribute("idUser").toString());
%>
<%!
    ImagenCad imagenCad = new ImagenCad();

%>
<!DOCTYPE html>
<html>
    <head>
        <title>TheMusicSheet</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/StyleAppWeb.css">
        <link rel="stylesheet" href="assets/css/StyleIcons.css">
        <link rel="stylesheet" href="assets/css/StyleInputs.css">
        <link rel="stylesheet" href="assets/css/StyleAppTablet.css">
        <link rel="stylesheet" href="assets/css/StyleAppCelular.css">
       <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body id="index">
        <!-- Header -->
        <header id="header">
            <span id="menuMobile" class="iconsMenuMobile IcMunuMobile"></span>
            <div class="content">
                <div id="title">
                    <h1 ><a class="a" href="index.jsp">TheMusicSheet</a></h1>
                </div>
                <nav>
                    <ul id="ul">
                        <% switch (rolUser) {
                                case 1:
                        %>
                        <li class="itemsMenu"><span class="icons IcHome"></span><a href="index.jsp" class="urlTextNav">Inicio</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcPlus"></span><a href="Insert.jsp" class="urlTextNav" >Insertar</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcSearch"></span><a href="Buscar.jsp" class="urlTextNav">Buscar</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcExit"></span><a id="logoutAdmin" class="urlTextNav">Salir</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcMore" id="more">
                                <div id="subMenu" class="subMenu">
                                    <ul id="ulSub">
                                        <li class="iconsSub"><input type="button" id="borrar" value="Borrar"  class="IcBtnList botonEmpty" /></li> 
                                    </ul>
                                </div>
                            </span></li>
                            <%
                                    break;
                                case 2:
                            %>
                        <li class="itemsMenu"><span class="icons IcHome"></span><a href="index.jsp" class="urlTextNav">Inicio</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcSearch"></span><a href="Buscar.jsp" class="urlTextNav">Buscar</a><span class="icons IcPoint"></span></li>
                        <li class="itemsMenu"><span class="icons IcExit"></span><a id="logoutUser" class="urlTextNav">Salir</a><span class="icons IcPoint"></span></li>    
                                <%
                                            break;
                                    } %>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- Main -->
        <div id="contenedor">
            <section id="section">	
                <ul id="ulAllImages">
                    <%
                        ResultSet resultSet = imagenCad.buscar();
                        while (resultSet.next()) {

                    %>
                    <li class="itemsAllImagen"><img src='<%= resultSet.getString("direccion")%>' class="imgAllItem" id="<%= resultSet.getString("id_img")%>" title="<%= resultSet.getString("nombre")%>" onclick="dialogo(this, '<%= resultSet.getString("direccion")%>')" alt=""/>
                        <p><%= resultSet.getString("nombre")%></p>
                        <input type="hidden" name="img" value="<%= resultSet.getString("direccion")%>"/>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </section>
        </div>

        <div  id="dialogo">
            <span id="x" class="IcCerrar" onclick="salir()"></span>
            <center>
                <div id="atras" class="IcBack" onclick="atras()"></div>
                <img id="imgDialog"  src=""  />
                <div id="siguiente" class="IcNext" onclick="siguiente()"></div>
            </center>
        </div>
        <!-- Menu Mobile!-->
        <div id="ContentMenuMobile" class="ContentMenuMobile">
            <div class="titleMenu">
                <h1 class="h1"><a class="a" href="index.jsp">TheMusicSheet</a></h1>
            </div>
            <nav class="menuMobile">
                <ul id="ulMobile">
                    <% switch (rolUser) {
                            case 1:
                    %>
                    <li class="itemsMenuMobile"><span class="icons IcHomeMobile"></span><a href="index.jsp" class="urlTextNavMobile">Inicio</a><span class="icons IcPoint"></span></li>
                    <li class="itemsMenuMobile"><span class="icons IcPlusMobile"></span><a href="Insert.jsp" class="urlTextNavMobile" >Insertar</a><span class="icons IcPoint"></span></li>
                    <li class="itemsMenuMobile"><span class="icons IcSearchMobile"></span><a href="Buscar.jsp" class="urlTextNavMobile">Buscar</a><span class="icons IcPoint"></span></li>
                    <li class="itemsMenuMobile"><span class="icons IcExitMobile"></span><a id="logoutAdmin" class="urlTextNavMobile">Salir</a><span class="icons IcPoint"></span></li>
                        <%
                                break;
                            case 2:
                        %>
                    <li class="itemsMenuMobile"><span class="icons IcHomeMobile"></span><a href="index.jsp" class="urlTextNavMobile">Inicio</a><span class="icons IcPoint"></span></li>
                    <li class="itemsMenuMobile"><span class="icons IcSearchMobile"></span><a href="Buscar.jsp" class="urlTextNavMobile">Buscar</a><span class="icons IcPoint"></span></li>
                    <li class="itemsMenuMobile"><span class="icons IcExitMobile"></span><a id="logoutUser" class="urlTextNavMobile">Salir</a><span class="icons IcPoint"></span></li>    
                            <%
                                        break;
                                } %>
                </ul>
            </nav>
        </div>
        <!-- My Library -->
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.poptrox.min.js"></script>
        <script type="text/javascript" src="assets/js/skel.min.js"></script>
        <script type="text/javascript" src="assets/js/ie/JS_Ic_Point.js"></script>
        <script type="text/javascript" src="assets/js/MoreController.js"></script>
        <script type="text/javascript" src="assets/js/IndexController.js"></script>
        <script type="text/javascript" src="assets/js/LogoutController.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    </body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>