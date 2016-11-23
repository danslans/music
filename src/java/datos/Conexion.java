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
    private static Connection c=null;
    public Connection connection() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       Class.forName("com.mysql.jdbc.Driver").newInstance();
        c= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");
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
