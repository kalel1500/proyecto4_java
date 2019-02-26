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
import javax.swing.JOptionPane;

/**
 *
 * @author msi
 */
public class Categoria {
    private String sql="";
    private Conexion conn=new Conexion();
    private Connection cn=conn.conectar();
    int categoria_id;
    String categoria_nom;

    public Categoria() {
    }

    public Categoria(int categoria_id, String categoria_nom) {
        this.categoria_id = categoria_id;
        this.categoria_nom = categoria_nom;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public String getCategoria_nom() {
        return categoria_nom;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }

    public void setCategoria_nom(String categoria_nom) {
        this.categoria_nom = categoria_nom;
    }
    
    public Categoria nomCategoria(int i){
        Categoria cat = new Categoria();
        sql = "SELECT categoria_nom FROM tbl_categoria "
                + "INNER JOIN tbl_serie ON tbl_serie.categoria_id = tbl_categoria.categoria_id "
                + "INNER JOIN tbl_producte ON tbl_producte.serie_id = tbl_serie.serie_id "
                + "WHERE tbl_producte.serie_id ='"+i+"'";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            cat.setCategoria_nom(rs.getString("categoria_nom"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return cat;
    }
}
