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
import java.util.logging.Level;
import java.util.logging.Logger;
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

    // recupera las listas de los lugares
    public void getListaLugares(ArrayList<Lugar> listaLugares, String cual) {
        switch (cual) {
            case "bloque":
                sql = "SELECT * FROM `tbl_lloc` GROUP BY `lloc_bloc`";
                break;
            case "pasillo":
                sql = "SELECT * FROM `tbl_lloc` GROUP BY `lloc_passadis`";
                break;
            case "estante":
                sql = "SELECT * FROM `tbl_lloc` GROUP BY `lloc_lleixa`";
                break;
        }

        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaLugares.clear();
            while (rs.next()) {
                Lugar lugar = new Lugar();
                lugar.setLloc_id(rs.getInt("lloc_id"));
                lugar.setLloc_bloc(rs.getString("lloc_bloc"));
                lugar.setLloc_passadis(rs.getString("lloc_passadis"));
                lugar.setLloc_lleixa(rs.getString("lloc_lleixa"));
                listaLugares.add(lugar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LugarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
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
