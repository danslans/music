<%-- 
    Document   : Buscar
    Created on : 13-nov-2016, 21:17:49
    Author     : danslans
--%>

<%@page import="model.Imagen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
<%@page import="cad.ImagenCad"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.xml.ws.transport.tcp.server.glassfish.ServletFakeArtifactSet.FakeServletHttpRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession hs = request.getSession();
    if (hs.getAttribute("user") != null) {
        String nombreUser = hs.getAttribute("user").toString();
        int rolUser = Integer.parseInt(hs.getAttribute("rol").toString());
        int idUser = Integer.parseInt(hs.getAttribute("idUser").toString());
%>
<!DOCTYPE html>
<%! ResultSet resultSet;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <title>TheMusicSheet</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/StyleAppWeb.css">
        <link rel="stylesheet" href="assets/css/StyleAppTablet.css">
        <link rel="stylesheet" href="assets/css/StyleAppCelular.css">
        <link rel="stylesheet" href="assets/css/StyleIcons.css">
        <link rel="stylesheet" href="assets/css/StyleInputs.css">
    </head>
    <body>
        <!-- Header -->
        <header id="header">
            <div class="content">
                <div id="title">
                    <h1 class="h1"><a class="a" href="index.jsp">TheMusicSheet</a></h1>
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
                                        <% switch (rolUser) {
                                                case 1:
                                        %>
                                        <li><input type="submit" id="Agregar" class="botonMenu" value="Agregar" /></li>
                                        <%
                                                    break;
                                            }%>
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
        <%
            String nombre = "";
            if (request.getParameter("nombreCancion") != null) {
                nombre = request.getParameter("nombreCancion");
            }

            String cadena = "";
            if (request.getParameter("lista") != null) {
                cadena = request.getParameter("lista");
                ImagenCad cad = new ImagenCad();
                resultSet = cad.traerLista(cadena);
            }

        %>
        <div id="contenedor" class="menuBuscar">
            <div id="formBusqueda">
                <input type="text" id="nCancion" class="input" value="<%=nombre%>" name="nombreCancion" placeholder="Nombre de la canción" required="required">
                <input type="hidden" name="lista" id="lista" value="<%= cadena%>">
                <input type="button" class="botonMenu" id="buscar"  value="Buscar" onclick="redirect(false)" >
            </div>
            <div id="recibir">
                <div id="formAgregar">
                    <ul id="ulSelectedImg">
                    <%
                        if (resultSet != null) {
                            int cant;
                            int c = 0;
                            if (request.getParameter("total") == null) {
                                cant = 0;
                            } else {
                                cant = Integer.parseInt(request.getParameter("total"));
                            }
                            while (resultSet.next()) {
                                c++;
                    %>
                    <li class="itemsSelectedImg" id="<%= resultSet.getString("id")%>" onclick="quitar(this, '<%=resultSet.getString("id")%>')">
                        <p class="listaSelect"><%= resultSet.getString("nombre")%></p>
                        <input type="hidden"  name="idImagen<%=c%>" value="<%= resultSet.getString("id")%>" />
                    </li>
                    <%
                        }
                    %>
                    </ul>
                    <input type="hidden" id="total" name="total" value="<%=cant%>" />
                    <%
                        }
                    %>
                    <input type="hidden" name="lista" id="lista" value="<%= cadena%>"/>
                    <input type="hidden" name="idUser" id="idUser" value="<%=idUser%>" />

                </div>
            </div>
        </div>
        <div id="contentBusqueda">
            <section id="section1">
                <ul id="ulAllImagesBuscar">
                    <%
                        if (request.getParameter("nombreCancion") != null) {
                            if (!request.getParameter("nombreCancion").equals("")) {
                                ImagenCad cad = new ImagenCad();
                                ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                                try {
                                    while (rs.next()) {
                    %>
                    <li class="itemsAllImagenBuscar"><span id="<%= rs.getString("id")%>ch" class="iconVer IcAdd"onclick="SelectImagen(<%= rs.getString("id")%>,this.id)" ></span>
                        <img id="<%= rs.getString("id")%>" class="imgAllItemBuscar" src="<%=rs.getString("direccion")%>"  title="<%= rs.getString("nombre")%>" onclick="mostrarImg('<%=rs.getString("direccion")%>')" />
                        <p onclick="SelectImagen(<%= rs.getString("id")%>)"><%=rs.getString("nombre")%></p>
                    </li>
                    <%
                                    }
                                } catch (SQLException ex) {
                                    Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                        }
                    %>
                </ul>
            </section>
            <aside id="listSongs">
                    <%
                        if (request.getParameter("nombreCancion") != null) {
                            if (!request.getParameter("nombreCancion").equals("")) {
                                ImagenCad cad = new ImagenCad();
                                ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                                try {
                                    while (rs.next()) {
                    %>
                    <li class="listNameSongs">
                        <p class="txtNombre" onclick="SelectImagen(<%= rs.getString("id")%>)"><%=rs.getString("nombre")%></p>
                    </li>
                    <%
                                    }
                                } catch (SQLException ex) {
                                    Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                        }
                    %>
                
            </aside>
        </div>
        <div id="bsDialog" onclick="salirImg()">
            <span id="x" class="IcCerrar" onclick="salirImg()"></span>
            <center>
                <img id="imgDialog"  src=""  />
            </center>
        </div>
        <!-- My Library -->
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.poptrox.min.js"></script>
        <script type="text/javascript" src="assets/js/skel.min.js"></script>
        <script type="text/javascript" src="assets/js/ie/JS_Ic_Point.js"></script>
        <script type="text/javascript" src="assets/js/MoreController.js"></script>
        <script type="text/javascript" src="assets/js/LogoutController.js"></script>
        <script type="text/javascript" src="assets/js/BuscarController.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>