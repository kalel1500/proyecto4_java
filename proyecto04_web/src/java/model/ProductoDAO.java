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

    private Conexion conexion = new Conexion();
    private Connection cn = conexion.conectar(); // Tiene los objetos para conectarnos conexion la bd
    private String sql = "";
    
    Statement statement;
    ResultSet resultset;
    PreparedStatement prepStat;

    public ProductoDAO() {
    }

    // recupera la lista de las productos
    public void getListaProductos(ArrayList<Producto> listaProducto) {
        // antigua // sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id";
        sql = "SELECT *, SUM(`estoc_quantitat`) AS SUM_estoc_quantitat, SUM(`estoc_maxim`) AS SUM_estoc_maxim, SUM(`estoc_minim`) AS SUM_estoc_minim FROM `tbl_producte` INNER JOIN `tbl_serie` ON `tbl_producte`.`serie_id` = `tbl_serie`.`serie_id` INNER JOIN `tbl_categoria` ON `tbl_serie`.`categoria_id` = `tbl_categoria`.`categoria_id` LEFT JOIN `tbl_estoc` ON `tbl_producte`.`producte_id` = `tbl_estoc`.`producte_id` GROUP BY `tbl_producte`.`producte_id`";
        try {
            statement = cn.createStatement();
            resultset = statement.executeQuery(sql);
            listaProducto.clear();
            while (resultset.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(resultset.getInt("producte_id"));
                producto.setProducte_nom(resultset.getString("producte_nom"));
                producto.setProducte_fotoRuta(resultset.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(resultset.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(resultset.getString("producte_fotoExt"));
                producto.setProducte_preu(resultset.getDouble("producte_preu"));
                producto.setProducte_descripcio(resultset.getString("producte_descripcio"));
                producto.setProducte_descompte(resultset.getInt("producte_descompte"));
                producto.setSerie_nom(resultset.getString("serie_nom"));
                producto.setCategoria_nom(resultset.getString("categoria_nom"));
                producto.setEstoc_quantitat(resultset.getInt("SUM_estoc_quantitat"));
                producto.setEstoc_maxim(resultset.getInt("SUM_estoc_maxim"));
                producto.setEstoc_minim(resultset.getInt("SUM_estoc_minim"));
                listaProducto.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // recupera la lista de las ofertas
    public void getListaOfertas(ArrayList<Producto> listaProducto) {
        // antigua // sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id";
        sql = "SELECT *, SUM(`estoc_quantitat`) AS SUM_estoc_quantitat, SUM(`estoc_maxim`) AS SUM_estoc_maxim, SUM(`estoc_minim`) AS SUM_estoc_minim FROM `tbl_producte` INNER JOIN `tbl_serie` ON `tbl_producte`.`serie_id` = `tbl_serie`.`serie_id` INNER JOIN `tbl_categoria` ON `tbl_serie`.`categoria_id` = `tbl_categoria`.`categoria_id` LEFT JOIN `tbl_estoc` ON `tbl_producte`.`producte_id` = `tbl_estoc`.`producte_id` GROUP BY `tbl_producte`.`producte_id` HAVING `tbl_producte`.`producte_descompte` IS NOT NULL";
        try {
            statement = cn.createStatement();
            resultset = statement.executeQuery(sql);
            listaProducto.clear();
            while (resultset.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(resultset.getInt("producte_id"));
                producto.setProducte_nom(resultset.getString("producte_nom"));
                producto.setProducte_fotoRuta(resultset.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(resultset.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(resultset.getString("producte_fotoExt"));
                producto.setProducte_preu(resultset.getDouble("producte_preu"));
                producto.setProducte_descripcio(resultset.getString("producte_descripcio"));
                producto.setProducte_descompte(resultset.getInt("producte_descompte"));
                producto.setSerie_nom(resultset.getString("serie_nom"));
                producto.setCategoria_nom(resultset.getString("categoria_nom"));
                producto.setEstoc_quantitat(resultset.getInt("SUM_estoc_quantitat"));
                producto.setEstoc_maxim(resultset.getInt("SUM_estoc_maxim"));
                producto.setEstoc_minim(resultset.getInt("SUM_estoc_minim"));
                listaProducto.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarProducto(int id) {
        sql = "DELETE FROM `tbl_estoc` WHERE `tbl_estoc`.`producte_id` = ?";
        try {
            cn.setAutoCommit(false);
            prepStat = cn.prepareStatement(sql);
            prepStat.setInt(1, id);
            int n = prepStat.executeUpdate();

            sql = "DELETE FROM `tbl_producte` WHERE `tbl_producte`.`producte_id` = ?";
            try {
                prepStat = cn.prepareStatement(sql);
                prepStat.setInt(1, id);
                n = prepStat.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
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

    public void insertarProducto(Producto producto) {
        String serie_nom = producto.getSerie_nom();
        String lloc_bloc = producto.getLloc_bloc();
        String lloc_passadis = producto.getLloc_passadis();
        String lloc_lleixa = producto.getLloc_lleixa();
        sql = "SELECT serie_id FROM tbl_serie WHERE serie_nom = '" + serie_nom + "'";
        try {
            cn.setAutoCommit(false);
            statement = cn.createStatement();
            resultset = statement.executeQuery(sql);
            resultset.next();
            int serie_id = resultset.getInt("serie_id");
            
            sql = "INSERT INTO `tbl_producte` (`producte_nom`,`producte_fotoRuta`,`producte_fotoNom`,`producte_fotoExt`,`producte_preu`,`producte_descripcio`,`producte_descompte`,`serie_id`) VALUES(?,?,?,?,?,?,?,?)";
            try {
                prepStat = cn.prepareStatement(sql);
                prepStat.setString(1, producto.getProducte_nom());
                prepStat.setString(2, "img/productos/");
                prepStat.setString(3, "default");
                prepStat.setString(4, ".png");
                prepStat.setDouble(5, producto.getProducte_preu());
                prepStat.setString(6, producto.getProducte_descripcio());
                if(producto.getProducte_descompte() == 0) {
                    prepStat.setNull(7, producto.getProducte_descompte());
                } else {
                    prepStat.setInt(7, producto.getProducte_descompte());
                }
                prepStat.setInt(8, serie_id);
                int n = prepStat.executeUpdate();

                sql = "SELECT lloc_id FROM tbl_lloc WHERE lloc_bloc = '"+lloc_bloc+"' AND lloc_passadis = '"+lloc_passadis+"' AND lloc_lleixa = '"+lloc_lleixa+"'";
                statement = cn.createStatement();
                resultset = statement.executeQuery(sql);
                resultset.next();
                int lloc_id = resultset.getInt("lloc_id");
                
                sql = "SELECT DISTINCT last_insert_id() FROM tbl_producte";
                statement = cn.createStatement();
                resultset = statement.executeQuery(sql);
                resultset.next();
                int prod_id = resultset.getInt("last_insert_id()");
                
                sql = "INSERT INTO `tbl_estoc` (`estoc_quantitat`,`estoc_maxim`,`estoc_minim`,`producte_id`,`lloc_id`) VALUES(?,?,?,?,?)";
                try {
                    prepStat = cn.prepareStatement(sql);
                    prepStat.setInt(1, producto.getEstoc_quantitat());
                    prepStat.setInt(2, producto.getEstoc_maxim());
                    prepStat.setInt(3, producto.getEstoc_minim());
                    prepStat.setInt(4, prod_id);
                    prepStat.setInt(5, lloc_id);
                    n = prepStat.executeUpdate();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
//                    JOptionPane.showMessageDialog(null, "Falla al insertar estoc");
                }
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
//                JOptionPane.showMessageDialog(null, "Falla al insertar producto");
            }
            cn.commit();
        } catch (SQLException ex) {
            try {
                cn.rollback();
            } catch (SQLException ex1) {
                JOptionPane.showMessageDialog(null, ex1);
//                JOptionPane.showMessageDialog(null, "Falla en el rollback");
            }
            JOptionPane.showMessageDialog(null, ex);
//            JOptionPane.showMessageDialog(null, "Hace el rollback");
        }
    }

    // recupera producto
    public Producto recuperarProducto(int id) {
        Producto producto = new Producto();
        sql = "SELECT * FROM `tbl_producte` INNER JOIN `tbl_serie` ON `tbl_producte`.`serie_id` = `tbl_serie`.`serie_id` INNER JOIN `tbl_categoria` ON `tbl_serie`.`categoria_id` = `tbl_categoria`.`categoria_id` LEFT JOIN `tbl_estoc` ON `tbl_producte`.`producte_id` = `tbl_estoc`.`producte_id` INNER JOIN `tbl_lloc` ON `tbl_estoc`.`lloc_id` = `tbl_lloc`.`lloc_id` WHERE `tbl_producte`.`producte_id` = " + id;
        try {
            Statement statement = cn.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            resultset.next();
            producto.setProducte_id(resultset.getInt("producte_id"));
            producto.setProducte_nom(resultset.getString("producte_nom"));
            producto.setProducte_fotoNom(resultset.getString("producte_fotoNom"));
            producto.setProducte_fotoRuta(resultset.getString("producte_fotoRuta"));
            producto.setProducte_fotoExt(resultset.getString("producte_fotoExt"));
            producto.setProducte_preu(resultset.getDouble("producte_preu"));
            producto.setProducte_descripcio(resultset.getString("producte_descripcio"));
            producto.setProducte_descompte(resultset.getInt("producte_descompte"));
            producto.setSerie_nom(resultset.getString("serie_nom"));
            producto.setCategoria_nom(resultset.getString("categoria_nom"));
            producto.setEstoc_quantitat(resultset.getInt("estoc_quantitat"));
            producto.setEstoc_maxim(resultset.getInt("estoc_maxim"));
            producto.setEstoc_minim(resultset.getInt("estoc_minim"));
            producto.setLloc_bloc(resultset.getString("lloc_bloc"));
            producto.setLloc_passadis(resultset.getString("lloc_passadis"));
            producto.setLloc_lleixa(resultset.getString("lloc_lleixa"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return producto;
    }

    // modifica la producto
    public void modificarProducto(Producto producto) {
        String serie_nom = producto.getSerie_nom();
        String lloc_bloc = producto.getLloc_bloc();
        String lloc_passadis = producto.getLloc_passadis();
        String lloc_lleixa = producto.getLloc_lleixa();
        sql = "SELECT serie_id FROM tbl_serie WHERE serie_nom = '" + serie_nom + "'";
        try {
            cn.setAutoCommit(false);
            statement = cn.createStatement();
            resultset = statement.executeQuery(sql);
            resultset.next();
            int serie_id = resultset.getInt("serie_id");
                        
            sql = "UPDATE `tbl_producte` SET `producte_nom` = ?, `producte_preu` = ?, `producte_descripcio` = ?, `producte_descompte` = ?, `serie_id` = ? WHERE `tbl_producte`.`producte_id` = ?";
            try {
                prepStat = cn.prepareStatement(sql);
                prepStat.setString(1, producto.getProducte_nom());
                prepStat.setDouble(2, producto.getProducte_preu());
                prepStat.setString(3, producto.getProducte_descripcio());
                if(producto.getProducte_descompte() == 0) {
                    prepStat.setNull(4, producto.getProducte_descompte());
                } else {
                    prepStat.setInt(4, producto.getProducte_descompte());
                }
                prepStat.setInt(5, serie_id);
                prepStat.setInt(6, producto.getProducte_id());
                int n = prepStat.executeUpdate();

                sql = "SELECT lloc_id FROM tbl_lloc WHERE lloc_bloc = '"+lloc_bloc+"' AND lloc_passadis = '"+lloc_passadis+"' AND lloc_lleixa = '"+lloc_lleixa+"'";
                statement = cn.createStatement();
                resultset = statement.executeQuery(sql);
                resultset.next();
                int lloc_id = resultset.getInt("lloc_id");
                
                sql = "UPDATE `tbl_estoc` SET `estoc_quantitat` = ?, `estoc_maxim` = ?, `estoc_minim` = ?, `lloc_id` = ? WHERE producte_id = ?";
                try {
                    prepStat = cn.prepareStatement(sql);
                    prepStat.setInt(1, producto.getEstoc_quantitat());
                    prepStat.setInt(2, producto.getEstoc_maxim());
                    prepStat.setInt(3, producto.getEstoc_minim());
                    prepStat.setInt(4, lloc_id);
                    prepStat.setInt(5, producto.getProducte_id());
                    n = prepStat.executeUpdate();
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex);
//                    JOptionPane.showMessageDialog(null, "Falla al modificar el estoc");
                }
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
//                JOptionPane.showMessageDialog(null, "Falla al modificar el producto");
            }
            cn.commit();
        } catch (SQLException ex) {
            try {
                cn.rollback();
            } catch (SQLException ex1) {
                JOptionPane.showMessageDialog(null, ex1);
//                JOptionPane.showMessageDialog(null, "Falla en el rollback");
            }
            JOptionPane.showMessageDialog(null, ex);
//            JOptionPane.showMessageDialog(null, "Hace el rollback");
        }
    }

    // filtrar producto
    public void getListaProductosFiltrados(ArrayList<Producto> listaFiltrarProducto, Producto prod) {
        String prodId = Integer.toString(prod.getProducte_id());
        String prodNom = prod.getProducte_nom();
        String catNom = prod.getCategoria_nom();

        if (prodId.equals("0")) {
            prodId = "";
        }

        // antigua //sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `producte_nom` LIKE '%"+ prodNom +"%' AND tbl_categoria.`categoria_nom` LIKE '%"+ catNom +"%' AND tbl_producte.`producte_id` LIKE '%"+ prodId +"%'";
        sql = "SELECT *, SUM(`estoc_quantitat`) AS SUM_estoc_quantitat, SUM(`estoc_maxim`) AS SUM_estoc_maxim, SUM(`estoc_minim`) AS SUM_estoc_minim FROM `tbl_producte` INNER JOIN `tbl_serie` ON `tbl_producte`.`serie_id` = `tbl_serie`.`serie_id` INNER JOIN `tbl_categoria` ON `tbl_serie`.`categoria_id` = `tbl_categoria`.`categoria_id` LEFT JOIN `tbl_estoc` ON `tbl_producte`.`producte_id` = `tbl_estoc`.`producte_id` WHERE `producte_nom` LIKE '%" + prodNom + "%' AND `tbl_categoria`.`categoria_nom` LIKE '%" + catNom + "%' AND `tbl_producte`.`producte_id` LIKE '%" + prodId + "%' GROUP BY `tbl_producte`.`producte_id`";
        //JOptionPane.showMessageDialog(null, sql);
        try {
            Statement statement = cn.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            listaFiltrarProducto.clear();
            while (resultset.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(resultset.getInt("producte_id"));
                producto.setProducte_nom(resultset.getString("producte_nom"));
                producto.setProducte_fotoRuta(resultset.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(resultset.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(resultset.getString("producte_fotoExt"));
                producto.setProducte_preu(resultset.getDouble("producte_preu"));
                producto.setProducte_descripcio(resultset.getString("producte_descripcio"));
                producto.setProducte_descompte(resultset.getInt("producte_descompte"));
                producto.setSerie_nom(resultset.getString("serie_nom"));
                producto.setCategoria_nom(resultset.getString("categoria_nom"));
                producto.setEstoc_quantitat(resultset.getInt("SUM_estoc_quantitat"));
                producto.setEstoc_maxim(resultset.getInt("SUM_estoc_maxim"));
                producto.setEstoc_minim(resultset.getInt("SUM_estoc_minim"));
                listaFiltrarProducto.add(producto);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }
    
    // filtrar ofertas
    public void getListaOfertasFiltradas(ArrayList<Producto> listaFiltrarProducto, Producto prod) {
        String prodId = Integer.toString(prod.getProducte_id());
        String prodNom = prod.getProducte_nom();
        String catNom = prod.getCategoria_nom();

        if (prodId.equals("0")) {
            prodId = "";
        }

        // antigua //sql = "SELECT * FROM tbl_producte INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id WHERE `producte_nom` LIKE '%"+ prodNom +"%' AND tbl_categoria.`categoria_nom` LIKE '%"+ catNom +"%' AND tbl_producte.`producte_id` LIKE '%"+ prodId +"%'";
        sql = "SELECT *, SUM(`estoc_quantitat`) AS SUM_estoc_quantitat, SUM(`estoc_maxim`) AS SUM_estoc_maxim, SUM(`estoc_minim`) AS SUM_estoc_minim FROM `tbl_producte` INNER JOIN `tbl_serie` ON `tbl_producte`.`serie_id` = `tbl_serie`.`serie_id` INNER JOIN `tbl_categoria` ON `tbl_serie`.`categoria_id` = `tbl_categoria`.`categoria_id` LEFT JOIN `tbl_estoc` ON `tbl_producte`.`producte_id` = `tbl_estoc`.`producte_id` WHERE `producte_nom` LIKE '%" + prodNom + "%' AND `tbl_categoria`.`categoria_nom` LIKE '%" + catNom + "%' AND `tbl_producte`.`producte_id` LIKE '%" + prodId + "%' AND `tbl_producte`.`producte_descompte` IS NOT NULL GROUP BY `tbl_producte`.`producte_id`";
        //JOptionPane.showMessageDialog(null, sql);
        try {
            Statement statement = cn.createStatement();
            ResultSet resultset = statement.executeQuery(sql);
            listaFiltrarProducto.clear();
            while (resultset.next()) {
                Producto producto = new Producto();
                producto.setProducte_id(resultset.getInt("producte_id"));
                producto.setProducte_nom(resultset.getString("producte_nom"));
                producto.setProducte_fotoRuta(resultset.getString("producte_fotoRuta"));
                producto.setProducte_fotoNom(resultset.getString("producte_fotoNom"));
                producto.setProducte_fotoExt(resultset.getString("producte_fotoExt"));
                producto.setProducte_preu(resultset.getDouble("producte_preu"));
                producto.setProducte_descripcio(resultset.getString("producte_descripcio"));
                producto.setProducte_descompte(resultset.getInt("producte_descompte"));
                producto.setSerie_nom(resultset.getString("serie_nom"));
                producto.setCategoria_nom(resultset.getString("categoria_nom"));
                producto.setEstoc_quantitat(resultset.getInt("SUM_estoc_quantitat"));
                producto.setEstoc_maxim(resultset.getInt("SUM_estoc_maxim"));
                producto.setEstoc_minim(resultset.getInt("SUM_estoc_minim"));
                listaFiltrarProducto.add(producto);
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
    }
}
