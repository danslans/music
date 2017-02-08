/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.context.FacesContextFactory;
import javax.inject.Named;

/**
 *
 * @author daniel.gomez
 */
@Named
@SessionScoped
public class LoginBean implements Serializable {
    private String user;
    private String pwd;
    

    public LoginBean() {
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public void validateUser(){
         System.out.println(this.user+" "+this.pwd);
         FacesContext.getCurrentInstance().getExternalContext().getSession(true);
    }
}
