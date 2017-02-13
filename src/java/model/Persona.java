/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author danslans
 */
public class Persona {
    private int id;
    private String username;
    private String pwd;
    private int rol;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public Persona() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public boolean validarPersona() {
        if ("".equals(this.username) && "".equals(this.pwd)) {
            return false;
        } else if ("".equals(this.username) || "".equals(this.pwd)) {
            return false;
        } else if (this.username == null && this.pwd == null) {
            return false;
        } else if (this.username == null || this.pwd == null) {
            return false;
        }
        return true;
    }

}
