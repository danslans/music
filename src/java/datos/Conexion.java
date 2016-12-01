/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author danslans
 */
public class Conexion {
    private static final String URL =  "jdbc:mysql://node138589-mmmusic.j.layershift.co.uk/darkan";
    private static final String USER="darkan";
    private static final String PASS="66LqKTDucvK3cWsM";
    private static final String URLLOCAL="jdbc:mysql://localhost:3306/music";
    private static final String USERLOCAL="root";
    private static final String PASSLOCAL="";
//DriverManager.getConnection(URL, user_name, user_password);
    private static Connection c=null;
    public Connection connection() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       Class.forName("com.mysql.jdbc.Driver").newInstance();
        c= (Connection) DriverManager.getConnection(URLLOCAL,USERLOCAL,PASSLOCAL);
       // c= (Connection) DriverManager.getConnection(URL,USER,PASS);
       if(c==null){
           System.out.println("error");
       }else{
       System.out.println("conecto");  
       }
       return  c;
    }   
    public void disconect(){
        try {
            c.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
         
    public Conexion() {
        
    }
    
}
