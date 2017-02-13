/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import datos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Persona;

/**
 *
 * @author danslans
 */
public class PersonaCad {

    private final Connection c = Conexion.connectBD();

    public Persona consultarPersona(Persona p) {
        try {
            PreparedStatement ps;
            ps = c.prepareStatement("SELECT * FROM TBL_PERSONA WHERE username=? AND pwd=password(?)");
            ps.setString(1, p.getUsername());
            ps.setString(2, p.getPwd());
            ResultSet res = ps.executeQuery();
            return personsData(res);
        } catch (SQLException ex) {
            Logger.getLogger(PersonaCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    private Persona personsData(ResultSet resultSet) throws SQLException {
        Persona p = new Persona();
        while (resultSet.next()) {
            p.setUsername(resultSet.getString("username"));
            p.setRol(resultSet.getInt("rol"));
            p.setId(resultSet.getInt("id"));
            
        }
        return p;
    }

}
