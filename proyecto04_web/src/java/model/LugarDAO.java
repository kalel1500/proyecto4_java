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
public class LugarDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public LugarDAO() {
    }
    
    // recupera lugar
    public void recuperarLugar(int id, ArrayList<Lugar> listaLugar) {
        sql = "SELECT * FROM tbl_estoc INNER JOIN tbl_lloc ON `tbl_estoc`.`lloc_id` = `tbl_lloc`.`lloc_id` WHERE `tbl_estoc`.`producte_id` = " + id;
        //
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaLugar.clear();
            while (rs.next()) {
                Lugar lugar = new Lugar();
                lugar.setLloc_id(rs.getInt("lloc_id"));
                lugar.setLloc_bloc(rs.getString("lloc_bloc"));
                lugar.setLloc_passadis(rs.getString("lloc_passadis"));
                lugar.setLloc_lleixa(rs.getString("lloc_lleixa"));
                listaLugar.add(lugar);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        //return lugar;
    }
}
