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
public class EstocDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public EstocDAO() {
    }
    
    public Estoc recuperarEstoc(int i){
        Estoc infoEstoc = new Estoc();
        sql= "SELECT * FROM tbl_estoc WHERE producte_id ='"+i+"'";
        //JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            infoEstoc.setEstoc_id(rs.getInt("estoc_id"));
            infoEstoc.setEstoc_quantitat(rs.getInt("estoc_quantitat"));
            infoEstoc.setEstoc_maxim(rs.getInt("estoc_maxim"));
            infoEstoc.setEstoc_minim(rs.getInt("estoc_minim"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return infoEstoc;
    }
    
    public void restarStock(int num, int id){
        sql ="UPDATE tbl_estoc SET estoc_quantitat ='"+num+"' WHERE producte_id='"+id+"'";
        try {
            Statement st = cn.createStatement();
            int rs = st.executeUpdate(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "no se hace la query restarStock");
        }
    }
    
    public void sumarStock(int num, int id){
        sql ="UPDATE tbl_estoc SET estoc_quantitat ='"+num+"' WHERE producte_id='"+id+"'";
        try {
            Statement st = cn.createStatement();
            int rs = st.executeUpdate(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "no se hace la query sumarStock");
        }
    }
    
    //modificar cantidad máxima y mínima de stock
    public void modificarStockMax(int id, int stock_max){
        sql="UPDATE tbl_estoc SET estoc_maxim ='"+stock_max+"' WHERE producte_id='"+id+"'";
        try {
            Statement st = cn.createStatement();
            int rs = st.executeUpdate(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "no se hace la query modificarStock");
        }
    }
    
    public void modificarStockMin(int id, int stock_min){
        sql="UPDATE tbl_estoc SET estoc_minim ='"+stock_min+"' WHERE producte_id='"+id+"'";
        try {
            Statement st = cn.createStatement();
            int rs = st.executeUpdate(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "no se hace la query modificarStockMin");
        }
    }
}
