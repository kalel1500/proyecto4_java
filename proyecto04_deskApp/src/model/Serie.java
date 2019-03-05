/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author msi
 */
public class Serie {
    
    private String sql="";
    private Conexion conn=new Conexion();
    private Connection cn=conn.conectar();
    int serie_id;
    String serie_nom;
    int categoria_id;

    public Serie() {
    }

    public Serie(int serie_id, String serie_nom, int categoria_id) {
        this.serie_id = serie_id;
        this.serie_nom = serie_nom;
        this.categoria_id = categoria_id;
    }

    public int getSerie_id() {
        return serie_id;
    }

    public String getSerie_nom() {
        return serie_nom;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public void setSerie_id(int serie_id) {
        this.serie_id = serie_id;
    }

    public void setSerie_nom(String serie_nom) {
        this.serie_nom = serie_nom;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }
    
    public Serie nomSerie(int i){
        Serie serie = new Serie();
        sql = "SELECT serie_nom FROM tbl_serie "
                + "INNER JOIN tbl_producte ON tbl_producte.serie_id = tbl_serie.serie_id "
                + "WHERE tbl_producte.producte_id ='"+i+"'";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            serie.setSerie_nom(rs.getString("serie_nom"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return serie;
    }
    
    public void getAllSeries(ArrayList<Serie> serArray, JComboBox cbSerNom, int id){
        Serie ser = new Serie();
        sql = "SELECT serie_id, serie_nom FROM tbl_serie WHERE categoria_id ='"+id+"'";
        serArray.clear();
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                ser.setSerie_id(rs.getInt("serie_id"));
                ser.setSerie_nom(rs.getString("serie_nom"));
                //cat.setCategoria
                serArray.add(ser);   
                cbSerNom.addItem(ser.getSerie_nom());
            }
        } catch (Exception e) {
        }
    }
    
    public Serie getSerieId(int id){
        Serie serieId = new Serie();
        sql = "SELECT tbl_serie.serie_id FROM tbl_serie "
                + " INNER JOIN tbl_producte  on tbl_producte.serie_id = tbl_serie.serie_id "
                + "WHERE tbl_producte.producte_id='"+id+"'";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            serieId.setSerie_id(rs.getInt("serie_id"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return serieId;
    }
    
    public int getId(String nom){
        int id =0;
        sql = "SELECT serie_id FROM tbl_serie WHERE serie_nom ='"+nom+"'";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            id = rs.getInt("serie_id");
        } catch (Exception e) {
        }
        return id;
    }
}
