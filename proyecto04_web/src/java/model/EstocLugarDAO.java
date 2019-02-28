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
public class EstocLugarDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public EstocLugarDAO() {
    }
    
    // recupera lugar
    public void recuperarEstocLugar(int id, ArrayList<EstocLugar> listaEstocLugar) {
        sql = "SELECT * FROM tbl_estoc INNER JOIN tbl_lloc ON `tbl_estoc`.`lloc_id` = `tbl_lloc`.`lloc_id` WHERE `tbl_estoc`.`producte_id` = " + id;
        //
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaEstocLugar.clear();
            while (rs.next()) {
                EstocLugar estoclugar = new EstocLugar();
                estoclugar.setLloc_id(rs.getInt("lloc_id"));
                estoclugar.setLloc_bloc(rs.getString("lloc_bloc"));
                estoclugar.setLloc_passadis(rs.getString("lloc_passadis"));
                estoclugar.setLloc_lleixa(rs.getString("lloc_lleixa"));
                estoclugar.setEstoc_id(rs.getInt("estoc_id"));
                estoclugar.setEstoc_quantitat(rs.getInt("estoc_quantitat"));
                estoclugar.setEstoc_maxim(rs.getInt("estoc_maxim"));
                estoclugar.setEstoc_minim(rs.getInt("estoc_minim"));
                estoclugar.setProducte_id(rs.getInt("producte_id"));
                listaEstocLugar.add(estoclugar);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        //return lugar;
    }
}
