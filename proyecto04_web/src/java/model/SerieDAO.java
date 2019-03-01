/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class SerieDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public SerieDAO() {
    }

    // recupera la lista de las series
    public void getListaSeries(ArrayList<Serie> listaSerie) {
        sql = "SELECT * FROM tbl_serie INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id ORDER BY tbl_serie.serie_id DESC";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaSerie.clear();
            while (rs.next()) {
                Serie serie = new Serie();
                serie.setSerie_id(rs.getInt("serie_id"));
                serie.setSerie_nom(rs.getString("serie_nom"));
                serie.setCategoria_nom(rs.getString("categoria_nom"));
                listaSerie.add(serie);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SerieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean eliminarSerie(int id) {
        boolean res = true;
        sql = "DELETE FROM `tbl_serie` WHERE `tbl_serie`.`serie_id` = ?";

        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            res = false;
            Logger.getLogger(SerieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public void insertarSerie(Serie serie) {
        sql = "INSERT INTO `tbl_serie` (`serie_nom`,`categoria_id`) VALUES(?,?)";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, serie.getSerie_nom());
            pst.setInt(2, serie.getCategoria_id());
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SerieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // recupera serie
    public Serie recuperarSerie(int id) {
        Serie serie = new Serie();
        sql = "SELECT * FROM tbl_serie INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `tbl_serie`.`serie_id` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            serie.setSerie_id(rs.getInt("serie_id"));
            serie.setSerie_nom(rs.getString("serie_nom"));
            serie.setCategoria_id(rs.getInt("categoria_id"));
            serie.setCategoria_nom(rs.getString("categoria_nom"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return serie;
    }
    
    // recupera lista serie por categoria
    public void getListaSeriePorCategoria(String nom, ArrayList<Serie> listaSerie) {
        
        sql = "SELECT * FROM tbl_serie INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `tbl_categoria`.`categoria_nom` = '" + nom + "'";
        JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaSerie.clear();
            while (rs.next()) {
                Serie serie = new Serie();
                serie.setSerie_id(rs.getInt("serie_id"));
                serie.setSerie_nom(rs.getString("serie_nom"));
                serie.setCategoria_id(rs.getInt("categoria_id"));
                listaSerie.add(serie);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }

    // modifica la serie
    public void modificarSerie(Serie serie) {
        sql = "UPDATE `tbl_serie` SET `serie_nom` = ?, `categoria_id` = ? WHERE `tbl_serie`.`serie_id` = ?";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, serie.getSerie_nom());
            pst.setInt(2, serie.getCategoria_id());
            pst.setInt(3, serie.getSerie_id());
//            JOptionPane.showMessageDialog(null, pst);
            int n = pst.executeUpdate();
//            JOptionPane.showMessageDialog(null, n);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(SerieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
