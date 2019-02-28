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
public class LlocDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public LlocDAO() {
    }
    
    public Lloc recuperarLloc(int i){
        Lloc infoLloc = new Lloc();
        sql="select tbl_lloc.lloc_id, num_bloc, num_passadis, num_lleixa from tbl_estoc inner join tbl_lloc on tbl_estoc.lloc_id = tbl_lloc.lloc_id where tbl_estoc.producte_id ='"+i+"'";
       // JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            infoLloc.setLloc(rs.getInt("lloc_id"));
            infoLloc.setNum_bloc(rs.getString("num_bloc"));
            infoLloc.setNum_passadis(rs.getString("num_passadis"));
            infoLloc.setNum_lleixa(rs.getString("num_lleixa"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return infoLloc;
    }
}
