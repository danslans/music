/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import cad.ImagenCad;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Imagen;

/**
 *
 * @author danslans
 */
public class Servlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter(); 
        ImagenCad cad=new ImagenCad();
        if(request.getParameter("number")!=null){
          if(request.getParameter("number").equals("false")){
               int num=Integer.parseInt(request.getParameter("nMax"));
                for(int i=1;i<=num;i++){
                    String nombre =request.getParameter("nombre"+i);
                    String descrip =request.getParameter("descripcion"+i);
                    String direc =request.getParameter("direccion"+i);
                    String url="images/thumbs/"+direc;
                    System.out.println(nombre+" "+descrip+" "+url);
                    Imagen imagen=new Imagen(0, nombre, descrip, url);
                    try {
                    cad.guardar(imagen);
                    }catch(Exception e){
                    }
                }
           }else if(request.getParameter("number").equals("true")){
        int cant=Integer.parseInt( request.getParameter("cantidad"));
           if(cant>0){
               out.println("<form action='Servlet' method='POST'>"
                       + "<input type='hidden' name='number' value='false' >"
                       + "<input type='hidden' name='nMax' value='"+cant+"' >");
                       
            for(int i=1;i<=cant;i++){
            out.println(
        "<input type='text' name='nombre"+i+"' placeholder='nombre"+i+"' >"+" "
        + "<input type='text' name='descripcion"+i+"' placeholder='descripcion"+i+"' >"+" "
        + "<input type='file' name='direccion"+i+"' value='images/thumbs/.jpg' >"+" "
        +"<br>"           
        );
            }
            out.println("<input type='submit'>"+" "
+ "</form>");
            }
           }
        }
        
        /*
         */
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
