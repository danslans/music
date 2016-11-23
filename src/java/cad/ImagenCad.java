/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import datos.Conexion;
import java.awt.Cursor;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Imagen;

/**
 *
 * @author danslans
 */
public class ImagenCad {

    private Conexion c = new Conexion();

    public void guardar(Imagen imagen) throws ClassNotFoundException, InstantiationException, IllegalAccessException, IllegalAccessException {
        try {
            Connection con = c.connection();
            Imagen i = imagen;
            String sql = "INSERT INTO TBL_IMG VALUES (null,'" + i.getNombre() + "','" + i.getDescripcion() + "','" + i.getDireccion() + "')";
            System.out.println(sql);
            int b = con.prepareStatement(sql).executeUpdate();
            con.close();
            c.disconect();
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet buscar() {
        // ArrayList<Imagen> arrayList=new ArrayList<>();
        try {
            Connection con = c.connection();
            String sql = "SELECT * FROM TBL_IMG";
            ResultSet resultSet = con.prepareStatement(sql).executeQuery();
            return resultSet;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet BuscarParam(String param) {
        try {
            Connection connection = c.connection();
            String query = "SELECT * FROM TBL_IMG WHERE `nombre` LIKE '%" + param + "%'";
            ResultSet resultSet = connection.prepareStatement(query).executeQuery();
            return resultSet;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList traerLista(String cadena) {
        if (!cadena.equals("")) {
            String id="";
            ArrayList<String> arrayList=new ArrayList<>();
            String num=cadena.replace("id","");
            for (int i = 0; i < num.length(); i++) {
                char n= num.charAt(i);
                try {
                int convert=n;
                if(convert>=0){    
                    id +=convert;
                }    
                } catch (Exception e) {
                  id="";  
                }
            }
            
            return arrayList;
        }
        return null;
    }
}
