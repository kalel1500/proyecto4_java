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
public class SuperProducto {
    
    private String sql="";
    private Conexion conn=new Conexion();
    private Connection cn=conn.conectar();
    
    int producte_id;
    String producte_nom;
    String producte_fotoNom;
    Double producte_preu;
    String producte_descripcio;
    int producte_descompte;
    int serie_id;
    String serie_nom;
    int categoria_id;
    String categoria_nom;
    int estoc_id;
    int estoc_quantitat;
    int estoc_maxim;
    int estoc_minim;
    int lloc;
    String lloc_bloc;
    String lloc_passadis;
    String lloc_lleixa;

    public SuperProducto() {
    }

    public SuperProducto(int producte_id, String producte_nom, String producte_fotoNom, Double producte_preu, String producte_descripcio, int producte_descompte, int serie_id, String serie_nom, int categoria_id, String categoria_nom, int estoc_id, int estoc_quantitat, int estoc_maxim, int estoc_minim, int lloc, String lloc_bloc, String lloc_passadis, String lloc_lleixa) {
        this.producte_id = producte_id;
        this.producte_nom = producte_nom;
        this.producte_fotoNom = producte_fotoNom;
        this.producte_preu = producte_preu;
        this.producte_descripcio = producte_descripcio;
        this.producte_descompte = producte_descompte;
        this.serie_id = serie_id;
        this.serie_nom = serie_nom;
        this.categoria_id = categoria_id;
        this.categoria_nom = categoria_nom;
        this.estoc_id = estoc_id;
        this.estoc_quantitat = estoc_quantitat;
        this.estoc_maxim = estoc_maxim;
        this.estoc_minim = estoc_minim;
        this.lloc = lloc;
        this.lloc_bloc = lloc_bloc;
        this.lloc_passadis = lloc_passadis;
        this.lloc_lleixa = lloc_lleixa;
    }

    public int getProducte_id() {
        return producte_id;
    }

    public String getProducte_nom() {
        return producte_nom;
    }

    public String getProducte_fotoNom() {
        return producte_fotoNom;
    }

    public Double getProducte_preu() {
        return producte_preu;
    }

    public String getProducte_descripcio() {
        return producte_descripcio;
    }

    public int getProducte_descompte() {
        return producte_descompte;
    }

    public int getSerie_id() {
        return serie_id;
    }

    public String getSerie_nom() {
        return serie_nom;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public String getCategoria_nom() {
        return categoria_nom;
    }

    public int getEstoc_id() {
        return estoc_id;
    }

    public int getEstoc_quantitat() {
        return estoc_quantitat;
    }

    public int getEstoc_maxim() {
        return estoc_maxim;
    }

    public int getEstoc_minim() {
        return estoc_minim;
    }

    public int getLloc() {
        return lloc;
    }

    public String getLloc_bloc() {
        return lloc_bloc;
    }

    public String getLloc_passadis() {
        return lloc_passadis;
    }

    public String getLloc_lleixa() {
        return lloc_lleixa;
    }

    public void setProducte_id(int producte_id) {
        this.producte_id = producte_id;
    }

    public void setProducte_nom(String producte_nom) {
        this.producte_nom = producte_nom;
    }

    public void setProducte_fotoNom(String producte_fotoNom) {
        this.producte_fotoNom = producte_fotoNom;
    }

    public void setProducte_preu(Double producte_preu) {
        this.producte_preu = producte_preu;
    }

    public void setProducte_descripcio(String producte_descripcio) {
        this.producte_descripcio = producte_descripcio;
    }

    public void setProducte_descompte(int producte_descompte) {
        this.producte_descompte = producte_descompte;
    }

    public void setSerie_id(int serie_id) {
        this.serie_id = serie_id;
    }

    public void setSerie_nom(String serie_nom) {
        this.serie_nom = serie_nom;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }

    public void setCategoria_nom(String categoria_nom) {
        this.categoria_nom = categoria_nom;
    }

    public void setEstoc_id(int estoc_id) {
        this.estoc_id = estoc_id;
    }

    public void setEstoc_quantitat(int estoc_quantitat) {
        this.estoc_quantitat = estoc_quantitat;
    }

    public void setEstoc_maxim(int estoc_maxim) {
        this.estoc_maxim = estoc_maxim;
    }

    public void setEstoc_minim(int estoc_minim) {
        this.estoc_minim = estoc_minim;
    }

    public void setLloc(int lloc) {
        this.lloc = lloc;
    }

    public void setLloc_bloc(String lloc_bloc) {
        this.lloc_bloc = lloc_bloc;
    }

    public void setLloc_passadis(String lloc_passadis) {
        this.lloc_passadis = lloc_passadis;
    }

    public void setLloc_lleixa(String lloc_lleixa) {
        this.lloc_lleixa = lloc_lleixa;
    }
    
    private int getIdLloc(String bloc, String passadis, String lleixa){
        Lloc llocId = new Lloc();
        sql="SELECT lloc_id FROM tbl_lloc WHERE lloc_bloc='"+bloc+"' AND lloc_passadis='"+passadis+"' AND lloc_lleixa='"+lleixa+"'";
        //JOptionPane.showMessageDialog(null,sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            llocId.setLloc(rs.getInt("lloc_id"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "no se hace la query updateProd, get id de lloc");
        }
        int lloc_id = llocId.getLloc();
        return lloc_id;
    }
    
    public void updateProd(SuperProducto modProd){
        
        int producto_id = modProd.getProducte_id();
        String nombre = modProd.producte_nom;
        double preu = modProd.producte_preu;
        String descripcio = modProd.producte_descripcio;
        int descompte = modProd.producte_descompte;
        int categoria = modProd.categoria_id;
        int serie = modProd.serie_id;
        String bloc = modProd.lloc_bloc;
        String passadis = modProd.lloc_passadis;
        String lleixa = modProd.lloc_lleixa;
        
        int lloc_id = getIdLloc(bloc,passadis,lleixa);
        //JOptionPane.showMessageDialog(null, lloc_id);
        
        
        try {
            cn.setAutoCommit(false);
            sql="UPDATE tbl_producte SET producte_nom ='"+nombre+"', producte_preu='"+preu+"', producte_descripcio='"+descripcio+"'"
                    + ", producte_descompte='"+descompte+"', serie_id='"+serie+"' WHERE producte_id ='"+producto_id+"'";
            try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
                JOptionPane.showMessageDialog(null, "falla el update de producto");
            }
            sql="UPDATE tbl_estoc SET lloc_id='"+producto_id+"' WHERE producte_id='"+producto_id+"'";
            try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
                JOptionPane.showMessageDialog(null, "falla el update de lloc");
            }
            cn.commit();
        } catch (Exception e) {
            //algo
            try {
                cn.rollback();
            } catch (SQLException ex1) {
               JOptionPane.showMessageDialog(null, "no se hace el rollback de modificar");
            }
        }
    }
    
    public void crearProducto(SuperProducto crearProd){
        int producto_id = crearProd.getId();
        String nombre = crearProd.producte_nom;
        String descripcio = crearProd.producte_descripcio;
        double preu = crearProd.producte_preu;
        int descompte = crearProd.producte_descompte;
        int categoria = crearProd.categoria_id;
        int serie = crearProd.serie_id;
        String bloc = crearProd.lloc_bloc;
        String passadis = crearProd.lloc_passadis;
        String lleixa = crearProd.lloc_lleixa;
        int lloc_id = getIdLloc(bloc,passadis,lleixa);
        int stock_max = crearProd.estoc_maxim;
        int stock_min = crearProd.estoc_minim;
        String foto = crearProd.producte_fotoNom;
      
        
        try {
            cn.setAutoCommit(false);
            sql= "INSERT INTO tbl_producte(producte_id,producte_nom,producte_fotoRuta,producte_fotoNom, producte_fotoExt,producte_preu, producte_descripcio, producte_descompte, serie_id)"
                    + "VALUES('"+producto_id+"','"+nombre+"','img/productos/','"+foto+"','.jpg','"+preu+"','"+descripcio+"','"+descompte+"','"+serie+"')";
             //JOptionPane.showMessageDialog(null, sql);
             try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex);
                JOptionPane.showMessageDialog(null, "falla el insert de producto");
            }
             
             sql="INSERT INTO tbl_estoc (estoc_id, estoc_quantitat, estoc_maxim, estoc_minim, producte_id, lloc_id)"
                     + "VALUES('"+producto_id+"','0','"+stock_max+"','"+stock_min+"','"+producto_id+"','"+lloc_id+"')";
             try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
                cn.commit();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex);
                JOptionPane.showMessageDialog(null, "falla el insert de stock");
            }
             
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al insertar");
            try {
                cn.rollback();
            } catch (SQLException ex1) {
               JOptionPane.showMessageDialog(null, "no se hace el rollback de insertar");
            }
        }
        //JOptionPane.showMessageDialog(null, producto_id);
        
    }
    
    public int getId(){
        int id = 0;
        sql = "SELECT producte_id FROM tbl_producte ORDER BY producte_id DESC LIMIT 1";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            id = (rs.getInt("producte_id"));
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "no se ha sacad el id");
        }
        return id+1;
    }
}
