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
<!DOCTYPE html>
<%! ResultSet resultSet;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <title>MM-Music</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script type="text/javascript" src="assets/js/Validacion.js"></script>
    </head>
    <body>

        <!-- Header -->
        <header id="header">
            <h1><a href="index.jsp"><strong>MMM -</strong>Music</a></h1>
            <nav>
                <ul>
                    <li><a  href="Insert.jsp" >Insertar</a></li>
                    <li><a href="Buscar.jsp" >Buscar</a></li>

                </ul>
            </nav>
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
            <input type="text" id="nCancion" class="input" value="<%=nombre%>" name="nombreCancion" placeholder="Nombre de la canción" required="required">
            <input type="hidden" name="lista" id="lista" value="<%= cadena%>">
            <input type="button" class="boton" id="buscar"  value="Buscar" onclick="redirect(false)" >
        <div id="recibir">
            <form id="formAgregar" method="POST" action="GetPost">
                <%
                    if (resultSet != null) {
                        int cant;
                        int c=0;
                        if (request.getParameter("total") == null ) {
                            cant = 0;
                        } else {
                            cant = Integer.parseInt(request.getParameter("total"));
                        }
                        while (resultSet.next()) {
                            c++;
                %>
                <li id="<%= resultSet.getString("id")%>" onclick="quitar(this, '<%=resultSet.getString("id")%>')">
                    <p class="listaSelect"><%= resultSet.getString("nombre")%></p>
                    <input type="hidden"  name="idImagen<%=c%>" value="<%= resultSet.getString("id")%>" />
                </li>
                <%
                    }
                %>
                <input type="hidden" id="total" name="total" value="<%=cant%>" />
                <%
                    }
                %>
                <input type="hidden" name="lista" id="lista" value="<%= cadena%>">
                <input type="submit" id="Agregar" class="boton" value="Agregar" />
            </form>
        </div>
                <div>
                <section id="section1">
            <ul id="imgBuscar">
                <%
                    if (request.getParameter("nombreCancion") != null) {
                        if (!request.getParameter("nombreCancion").equals("")) {
                            ImagenCad cad = new ImagenCad();
                            ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                            try {
                                while (rs.next()) {
                %>
                <li class="liNombreImg"><img src="images/icons/view1.png" id="icon" onclick="mostrarImg('<%=rs.getString("direccion")%>')"/>
                    <img id="<%= rs.getString("id")%>" class="imgSong" src="<%=rs.getString("direccion")%>"  title="<%= rs.getString("nombre")%>"  onclick="SelectImagen(<%= rs.getString("id")%>)"  />
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
            <aside id="aside1">
                <nav>
                   <%
                    if (request.getParameter("nombreCancion") != null) {
                        if (!request.getParameter("nombreCancion").equals("")) {
                            ImagenCad cad = new ImagenCad();
                            ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                            try {
                                while (rs.next()) {
                %>
                <li>
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
                </nav>
            </aside>
            </div>
                <dialog id="bsDialog" onclick="salirImg()">
                    <center>
                        <img id="imgDialog"  src=""  />
                    </center>
                </dialog>
    </body>
</html>
