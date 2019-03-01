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
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
public class EstocDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public EstocDAO() {
    }
    
    // recupera estoc
    public void recuperarEstoc(int id, ArrayList<Estoc> listaEstoc) {
        
        sql = "SELECT * FROM tbl_estoc WHERE `tbl_estoc`.`producte_id` = " + id;
        //sql = "SELECT `estoc_id`, `producte_id`, SUM(`estoc_quantitat`) AS 'estoc_quantitat', SUM(`estoc_maxim`) AS 'estoc_maxim', SUM(`estoc_minim`) AS 'estoc_minim' FROM tbl_estoc WHERE `tbl_estoc`.`producte_id` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaEstoc.clear();
            while (rs.next()) {
                Estoc estoc = new Estoc();
                estoc.setEstoc_id(rs.getInt("estoc_id"));
                estoc.setEstoc_quantitat(rs.getInt("estoc_quantitat"));
                estoc.setEstoc_maxim(rs.getInt("estoc_maxim"));
                estoc.setEstoc_minim(rs.getInt("estoc_minim"));
                estoc.setProducte_id(rs.getInt("producte_id"));
                listaEstoc.add(estoc);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        //return estoc;
    }
}
