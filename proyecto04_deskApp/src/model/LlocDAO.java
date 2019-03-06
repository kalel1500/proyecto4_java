
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
public class LlocDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public LlocDAO() {
    }
    
    public Lloc recuperarLloc(int i){
        Lloc infoLloc = new Lloc();
        sql="SELECT tbl_lloc.lloc_id, lloc_bloc, lloc_passadis, lloc_lleixa "
                + "FROM tbl_estoc inner join tbl_lloc on tbl_estoc.lloc_id = tbl_lloc.lloc_id "
                + "WHERE tbl_estoc.producte_id ='"+i+"'";
       // JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            infoLloc.setLloc(rs.getInt("lloc_id"));
            infoLloc.setLloc_bloc(rs.getString("lloc_bloc"));
            infoLloc.setLloc_passadis(rs.getString("lloc_passadis"));
            infoLloc.setLloc_lleixa(rs.getString("lloc_lleixa"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return infoLloc;
    }
    
    public void getAllLlocs(ArrayList<Lloc> llocArray, JComboBox cbLlocBloc){
        Lloc cbL = new Lloc();
        sql="select lloc_id, lloc_bloc FROM tbl_lloc";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                cbL.setLloc(rs.getInt("lloc_id"));
                cbL.setLloc_bloc(rs.getString("lloc_bloc"));
                //cat.setCategoria
                llocArray.add(cbL);   
                cbLlocBloc.addItem(cbL.getLloc_bloc());
            }
        } catch (Exception e) {
        }
    }
}
