/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import cad.PersonaCad;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Persona;

/**
 *
 * @author danslans
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        Persona p = new Persona();
        p.setUsername(request.getParameter("user"));
        p.setPwd(request.getParameter("pass"));
        if (p.validarPersona()) {
            PersonaCad cad = new PersonaCad();
            try {
                Persona resultPersona = cad.consultarPersona(p);
                switch (resultPersona.getRol()) {
                    case 1:
                        session(resultPersona, request);
                        break;
                    case 2:
                        session(resultPersona, request);
                        break;
                    default:
                        pw.println("Usuario o contraseña incorrecta");
                        break;
                }
            } catch (Exception  e) {
                pw.println("Ocurrio un error con la conexión");
            }
        } else {
            pw.println("No llegaron los parametros");
        }

    }

    private void session(Persona resultPersona, HttpServletRequest request) {
        HttpSession httpSession;
        httpSession = request.getSession(true);
        httpSession.setAttribute("user", resultPersona.getUsername());
        httpSession.setAttribute("rol", resultPersona.getRol());
        httpSession.setAttribute("idUser", resultPersona.getId());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
