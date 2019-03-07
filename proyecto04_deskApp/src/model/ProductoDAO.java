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
 * @author msi
 */
public class ProductoDAO {
    private String sql="";
    private Conexion conn=new Conexion();
    private Connection cn=conn.conectar();
    
    //carga la info de los recursos en la pagina principal
    /**
     * 
     * @param infoProducto 
     */
    public void getInfoProducto(ArrayList<Producto> infoProducto){
        sql="SELECT * FROM tbl_producte";
        try {
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            infoProducto.clear();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setProducte_id(rs.getInt("producte_id"));
                producto.setProducte_nom(rs.getString("producte_nom"));
                producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
                producto.setProducte_preu(rs.getDouble("producte_preu"));
                producto.setProducte_descripcio(rs.getString("producte_descripcio"));
                producto.setProducte_descompte(rs.getInt("producte_descompte"));
                producto.setSerie_id(rs.getInt("serie_id"));
                infoProducto.add(producto);
            }
            //JOptionPane.showMessageDialog(null,"query correcta");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "FALLA LA QUERY GetInfoProducto");
        }
    }
    
     public Producto recuperarProducto(int id) {
        Producto producto = new Producto();
        sql = "SELECT * FROM `tbl_producte` WHERE `tbl_producte`.`producte_id` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            producto.setProducte_id(rs.getInt("producte_id"));
            producto.setProducte_nom(rs.getString("producte_nom"));
            producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
            producto.setProducte_preu(rs.getDouble("producte_preu"));
            producto.setProducte_descripcio(rs.getString("producte_descripcio"));
            producto.setProducte_descompte(rs.getInt("producte_descompte"));
            producto.setProducte_descripcio(rs.getString("producte_descripcio"));
            producto.setSerie_id(rs.getInt("serie_id"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return producto;
    }
     
     public void getInfoProductoCat(ArrayList<Producto> infoProducto, int id){
        sql="SELECT * FROM tbl_producte "
                + "INNER JOIN tbl_serie ON tbl_producte.serie_id = tbl_serie.serie_id "
                + "INNER JOIN tbl_categoria ON tbl_serie.categoria_id = tbl_categoria.categoria_id "
                + "WHERE tbl_categoria.categoria_id = '"+id+"'";
        try {
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            infoProducto.clear();
            while(rs.next()){
                Producto producto = new Producto();
                producto.setProducte_id(rs.getInt("producte_id"));
                producto.setProducte_nom(rs.getString("producte_nom"));
                producto.setProducte_fotoNom(rs.getString("producte_fotoNom"));
                producto.setProducte_preu(rs.getDouble("producte_preu"));
                producto.setProducte_descripcio(rs.getString("producte_descripcio"));
                producto.setProducte_descompte(rs.getInt("producte_descompte"));
                producto.setSerie_id(rs.getInt("serie_id"));
                infoProducto.add(producto);
            }
            //JOptionPane.showMessageDialog(null,"query correcta");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "FALLA LA QUERY GetInfoProductoCat");
        }
    }
     
     public int getNextId(){
         int id = 0;
         sql="SELECT producte_id FROM tbl_producte ORDER BY producte_id DESC LIMIT 1";
         try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            id = rs.getInt("producte_id");
         } catch (Exception e) {
             JOptionPane.showMessageDialog(null, "FALLA LA QUERY getNextId");
         }
         return id;
     }
     
     //mira si el nombre ya existe
     public String nombreExists(String nombre){
         String productoNombre = "";
         sql ="SELECT producte_nom FROM tbl_producte WHERE producte_nom ='"+nombre+"'";
         try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            productoNombre = rs.getString("producte_nom");
         } catch (Exception e) {
             productoNombre = "";
         }
         return productoNombre;
     }
}
