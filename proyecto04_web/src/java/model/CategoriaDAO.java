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
public class CategoriaDAO {
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public CategoriaDAO() {
    }

    // recupera la lista de las categorias
    public void getListaCategorias(ArrayList<Categoria> listaCategoria) {
        sql = "SELECT * FROM tbl_categoria ORDER BY categoria_id DESC";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaCategoria.clear();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setCategoria_id(rs.getInt("categoria_id"));
                categoria.setCategoria_nom(rs.getString("categoria_nom"));
                listaCategoria.add(categoria);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean eliminarCategoria(int id) {
        boolean res = true;
        sql = "DELETE FROM `tbl_categoria` WHERE `tbl_categoria`.`categoria_id` = ?";

        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            //JOptionPane.showMessageDialog(null, "No se ha podido eliminar");
            res = false;
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public void insertarCategoria(Categoria categoria) {
        sql = "INSERT INTO `tbl_categoria` (`categoria_nom`) VALUES(?)";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, categoria.getCategoria_nom());
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // recupera categoria
    public Categoria recuperarCategoria(int id) {
        Categoria categoria = new Categoria();
        sql = "SELECT * FROM tbl_categoria WHERE `tbl_categoria`.`categoria_id` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            categoria.setCategoria_id(rs.getInt("categoria_id"));
            categoria.setCategoria_nom(rs.getString("categoria_nom"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return categoria;
    }

    // modifica la categoria
    public void modificarCategoria(Categoria categoria) {
        sql = "UPDATE `tbl_categoria` SET `categoria_nom` = ? WHERE `tbl_categoria`.`categoria_id` = ?";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, categoria.getCategoria_nom());
            pst.setInt(2, categoria.getCategoria_id());
//            JOptionPane.showMessageDialog(null, pst);
            int n = pst.executeUpdate();
//            JOptionPane.showMessageDialog(null, n);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
