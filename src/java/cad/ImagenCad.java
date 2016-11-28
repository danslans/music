/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import datos.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Imagen;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
            String sql = "SELECT * FROM TBL_ASIGNAR_CANCION";
            ResultSet resultSet = con.prepareStatement(sql).executeQuery();
          //  con.close();
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
            //connection.close();
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
     
    
    public ArrayList BuscarParamId(int id) {
        try {
            ArrayList<Imagen> arrayList;
            try (Connection connection = c.connection()) {
                arrayList = new ArrayList<>();
                String query = "SELECT * FROM TBL_IMG WHERE id = "+id;
                ResultSet resultSet = connection.prepareStatement(query).executeQuery();
                while (resultSet.next()) {
                    arrayList.add(new Imagen(resultSet.getInt("id"),resultSet.getString("nombre"), resultSet.getString("descripcion"), resultSet.getString("direccion")));
                }
            }
            return arrayList;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList traerLista(String cadena) throws ClassNotFoundException {
        try {
            try {
                ArrayList<Imagen> arrayList;
                try (Connection connection = c.connection()) {
                    arrayList = new ArrayList<>();
                    String json="["+cadena+"]";
                    JSONArray jSONArray=new JSONArray(json);
                    for ( int i=0;i<jSONArray.length();i++) {
                        JSONObject object=jSONArray.getJSONObject(i);
                        int id=object.getInt("id");
                        arrayList=  BuscarParamId(id);
                        System.out.println(""+arrayList);
                    }
                }
                return arrayList;
            } catch (InstantiationException | IllegalAccessException | SQLException ex) {
                Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (JSONException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
