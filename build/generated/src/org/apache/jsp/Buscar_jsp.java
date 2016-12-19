package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Imagen;
import java.util.ArrayList;
import java.lang.String;
import cad.ImagenCad;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import com.sun.xml.ws.transport.tcp.server.glassfish.ServletFakeArtifactSet.FakeServletHttpRequest;

public final class Buscar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 ResultSet resultSet;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\" />\n");
      out.write("        <title>MM-Music</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"assets/css/styles.css\">\n");
      out.write("        <!-- jQuery library -->\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <!-- Latest compiled JavaScript -->\n");
      out.write("        <script type=\"text/javascript\" src=\"assets/js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"assets/js/Validacion.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Header -->\n");
      out.write("        <header id=\"header\">\n");
      out.write("            <h1><a href=\"index.jsp\"><strong>MMM -</strong>Music</a></h1>\n");
      out.write("            <nav>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a  href=\"Insert.jsp\" >Insertar</a></li>\n");
      out.write("                    <li><a href=\"Buscar.jsp\" >Buscar</a></li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("        ");

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

        
      out.write("\n");
      out.write("            <input type=\"text\" id=\"nCancion\" class=\"input\" value=\"");
      out.print(nombre);
      out.write("\" name=\"nombreCancion\" placeholder=\"Nombre de la canción\" required=\"required\">\n");
      out.write("            <input type=\"hidden\" name=\"lista\" id=\"lista\" value=\"");
      out.print( cadena);
      out.write("\">\n");
      out.write("            <input type=\"button\" class=\"boton\" id=\"buscar\"  value=\"Buscar\" onclick=\"redirect(false)\" >\n");
      out.write("        <div id=\"recibir\">\n");
      out.write("            <form id=\"formAgregar\" method=\"POST\" action=\"GetPost\">\n");
      out.write("                ");

                    if (resultSet != null) {
                        int cant;
                        int c=0;
                        if (request.getParameter("total") == null) {
                            cant = 0;
                        } else {
                            cant = Integer.parseInt(request.getParameter("total"));
                        }
                        while (resultSet.next()) {
                            c++;
                
      out.write("\n");
      out.write("                <li id=\"");
      out.print( resultSet.getString("id"));
      out.write("\" onclick=\"quitar(this, '");
      out.print(resultSet.getString("id"));
      out.write("')\">\n");
      out.write("                    <p class=\"listaSelect\">");
      out.print( resultSet.getString("nombre"));
      out.write("</p>\n");
      out.write("                    <input type=\"text\"  name=\"idImagen");
      out.print(c);
      out.write("\" value=\"");
      out.print( resultSet.getString("id"));
      out.write("\" />\n");
      out.write("                </li>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                <input type=\"hidden\" id=\"total\" name=\"total\" value=\"");
      out.print(cant);
      out.write("\" />\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                <input type=\"submit\" id=\"Agregar\" class=\"boton\" value=\"Agregar\" />\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("                <div>\n");
      out.write("                <section id=\"section1\">\n");
      out.write("            <ul id=\"imgBuscar\">\n");
      out.write("                ");

                    if (request.getParameter("nombreCancion") != null) {
                        if (!request.getParameter("nombreCancion").equals("")) {
                            ImagenCad cad = new ImagenCad();
                            ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                            try {
                                while (rs.next()) {
                
      out.write("\n");
      out.write("                <li ><img id=\"");
      out.print( rs.getString("id"));
      out.write("\" src=\"");
      out.print(rs.getString("direccion"));
      out.write("\"  title=\"");
      out.print( rs.getString("id"));
      out.write("\"  onclick=\"SelectImagen(");
      out.print( rs.getString("id"));
      out.write(")\"  />\n");
      out.write("                    <p onclick=\"SelectImagen(");
      out.print( rs.getString("id"));
      out.write(")\">");
      out.print(rs.getString("nombre"));
      out.write("</p>\n");
      out.write("                </li>\n");
      out.write("                ");

                                }
                            } catch (SQLException ex) {
                                Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </section>\n");
      out.write("            <aside id=\"aside1\">\n");
      out.write("                <nav>\n");
      out.write("                   ");

                    if (request.getParameter("nombreCancion") != null) {
                        if (!request.getParameter("nombreCancion").equals("")) {
                            ImagenCad cad = new ImagenCad();
                            ResultSet rs = cad.BuscarParam(request.getParameter("nombreCancion"));
                            try {
                                while (rs.next()) {
                
      out.write("\n");
      out.write("                <li>\n");
      out.write("                    <p onclick=\"SelectImagen(");
      out.print( rs.getString("id"));
      out.write(")\">");
      out.print(rs.getString("nombre"));
      out.write("</p>\n");
      out.write("                </li>\n");
      out.write("                ");

                                }
                            } catch (SQLException ex) {
                                Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    }
                
      out.write("\n");
      out.write("                </nav>\n");
      out.write("            </aside>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
