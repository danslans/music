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
public class AsignarImagen {
    private int id_img;
    private String fecha;
    private int orden;

    public AsignarImagen(int id_img, String fecha, int orden) {
        this.id_img = id_img;
        this.fecha = fecha;
        this.orden = orden;
    }
    
    public int getId_img() {
        return id_img;
    }

    public void setId_img(int id_img) {
        this.id_img = id_img;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }
    
}
