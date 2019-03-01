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
 * @author Producto
 */
public class ProductoDAO {

    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public ProductoDAO() {
    }

    // recupera la lista de las productos
    public void getListaProductos(ArrayList<Producto> listaProducto) {
        sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaProducto.clear();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(rs.getInt("producte_id"));
                producto.setProducte_nom(rs.getString("producte_nom"));
                producto.setProducte_fotoRuta(rs.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(rs.getString("producte_fotoExt"));
                producto.setProducte_preu(rs.getDouble("producte_preu"));
                producto.setProducte_descripcio(rs.getString("producte_descripcio"));
                producto.setProducte_descompte(rs.getInt("producte_descompte"));
                producto.setSerie_nom(rs.getString("serie_nom"));
                producto.setCategoria_nom(rs.getString("categoria_nom"));
                listaProducto.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean eliminarProducto(int id) {
        boolean res = true;
        sql = "DELETE FROM `tbl_producto` WHERE `tbl_producto`.`producte_id` = ?";

        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            res = false;
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public void insertarProducto(Producto producto) {
        sql = "INSERT INTO `tbl_producto` (`producte_nom`,`producte_fotoRuta`,`producte_fotoNom`,`producte_fotoExt`,`producte_preu`,`producte_descripcio`,`producte_descompte`,`serie_id`) VALUES(?,?,?,?,?,?,?,?)";
        try {
            cn.setAutoCommit(false);
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, producto.getProducte_nom());
            pst.setString(2, producto.getProducte_fotoRuta());
            pst.setString(3, producto.getProducte_fotoNom());
            pst.setString(4, producto.getProducte_fotoExt());
            pst.setDouble(5, producto.getProducte_preu());
            pst.setString(6, producto.getProducte_descripcio());
            pst.setInt(7, producto.getProducte_descompte());
            pst.setInt(8, producto.getSerie_id());
            int n = pst.executeUpdate();

//            sql = "SELECT DISTINCT last_insert_id() FROM tbl_producto";
//            Statement st = cn.createStatement();
//            ResultSet rs = st.executeQuery(sql);
//            rs.next();
//            int producte_id = rs.getInt("last_insert_id()");
//            JOptionPane.showMessageDialog(null, producte_id);
//            sql = "INSERT INTO `tbl_telefono` (`numero_telefono`,`producte_id`) VALUES(?,?)";
//            try {
//                pst = cn.prepareStatement(sql);
//                pst.setString(1, producto.getNumero_telefono1());
//                pst.setInt(2, producte_id);
//                n = pst.executeUpdate();
//                
//                pst.setString(1, producto.getNumero_telefono2());
//                pst.setInt(2, producte_id);
//                n = pst.executeUpdate();
//                
//                pst.setString(1, producto.getNumero_telefono3());
//                pst.setInt(2, producte_id);
//                n = pst.executeUpdate();
//            } catch (SQLException ex) {
//                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
            cn.commit();
        } catch (SQLException ex) {
            try {
                cn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // recupera producto
    public Producto recuperarProducto(int id) {
        Producto producto = new Producto();
        sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `tbl_producte`.`producte_id` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            producto.setProducte_id(rs.getInt("producte_id"));
            producto.setProducte_nom(rs.getString("producte_nom"));
            producto.setProducte_fotoRuta(rs.getString("producte_fotoRuta"));
            producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
            producto.setProducte_fotoExt(rs.getString("producte_fotoExt"));
            producto.setProducte_preu(rs.getDouble("producte_preu"));
            producto.setProducte_descripcio(rs.getString("producte_descripcio"));
            producto.setProducte_descompte(rs.getInt("producte_descompte"));
            producto.setSerie_nom(rs.getString("serie_nom"));
            producto.setCategoria_nom(rs.getString("categoria_nom"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return producto;
    }

    // modifica la producto
    public void modificarProducto(Producto producto) {
        sql = "UPDATE `tbl_producto` SET `producte_nom` = ?, `producte_fotoRuta` = ?, `producte_fotoNom` = ?, `producte_fotoExt` = ?, `producte_preu` = ?, `producte_descripcio` = ?, `producte_descompte` = ?, `serie_id` = ? WHERE `tbl_producto`.`producte_id` = ?";
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, producto.getProducte_nom());
            pst.setString(2, producto.getProducte_fotoRuta());
            pst.setString(3, producto.getProducte_fotoNom());
            pst.setString(4, producto.getProducte_fotoExt());
            pst.setDouble(5, producto.getProducte_preu());
            pst.setString(6, producto.getProducte_descripcio());
            pst.setInt(7, producto.getProducte_descompte());
            pst.setInt(8, producto.getSerie_id());
            pst.setInt(9, producto.getProducte_id());
//            JOptionPane.showMessageDialog(null, pst);
            int n = pst.executeUpdate();
//            JOptionPane.showMessageDialog(null, n);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // filtrar producto
    public void getListaProductosFiltrados(ArrayList<Producto> listaFiltrarProducto, Producto prod) {
        String prodNom = prod.getProducte_nom();
        String catNom = prod.getCategoria_nom();
        sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `producte_nom` LIKE '%"+ prodNom +"%' AND tbl_categoria.`categoria_nom` LIKE '%"+ catNom +"%'";
        //JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaFiltrarProducto.clear();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(rs.getInt("producte_id"));
                producto.setProducte_nom(rs.getString("producte_nom"));
                producto.setProducte_fotoRuta(rs.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(rs.getString("producte_fotoExt"));
                producto.setProducte_preu(rs.getDouble("producte_preu"));
                producto.setProducte_descripcio(rs.getString("producte_descripcio"));
                producto.setProducte_descompte(rs.getInt("producte_descompte"));
                producto.setSerie_nom(rs.getString("serie_nom"));
                producto.setCategoria_nom(rs.getString("categoria_nom"));
                listaFiltrarProducto.add(producto);
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }
}
