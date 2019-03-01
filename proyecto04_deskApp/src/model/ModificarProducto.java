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
public class ModificarProducto {
    
    private String sql="";
    private Conexion conn=new Conexion();
    private Connection cn=conn.conectar();
    
    int producte_id;
    String producte_nom;
    String producte_foto;
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
    String num_bloc;
    String num_passadis;
    String num_lleixa;

    public ModificarProducto() {
    }

    public ModificarProducto(int producte_id, String producte_nom, String producte_foto, Double producte_preu, String producte_descripcio, int producte_descompte, int serie_id, String serie_nom, int categoria_id, String categoria_nom, int estoc_id, int estoc_quantitat, int estoc_maxim, int estoc_minim, int lloc, String num_bloc, String num_passadis, String num_lleixa) {
        this.producte_id = producte_id;
        this.producte_nom = producte_nom;
        this.producte_foto = producte_foto;
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
        this.num_bloc = num_bloc;
        this.num_passadis = num_passadis;
        this.num_lleixa = num_lleixa;
    }

    public int getProducte_id() {
        return producte_id;
    }

    public String getProducte_nom() {
        return producte_nom;
    }

    public String getProducte_foto() {
        return producte_foto;
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

    public String getNum_bloc() {
        return num_bloc;
    }

    public String getNum_passadis() {
        return num_passadis;
    }

    public String getNum_lleixa() {
        return num_lleixa;
    }

    public void setProducte_id(int producte_id) {
        this.producte_id = producte_id;
    }

    public void setProducte_nom(String producte_nom) {
        this.producte_nom = producte_nom;
    }

    public void setProducte_foto(String producte_foto) {
        this.producte_foto = producte_foto;
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

    public void setNum_bloc(String num_bloc) {
        this.num_bloc = num_bloc;
    }

    public void setNum_passadis(String num_passadis) {
        this.num_passadis = num_passadis;
    }

    public void setNum_lleixa(String num_lleixa) {
        this.num_lleixa = num_lleixa;
    }
    
    private int getIdLloc(String bloc, String passadis, String lleixa){
        Lloc llocId = new Lloc();
        sql="SELECT lloc_id FROM tbl_lloc WHERE num_bloc='"+bloc+"' AND num_passadis='"+passadis+"' AND num_lleixa='"+lleixa+"'";
        
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
    
    public void updateProd(ModificarProducto modProd){
        
        int producto_id = modProd.getProducte_id();
        String nombre = modProd.producte_nom;
        double preu = modProd.producte_preu;
        int descompte = modProd.producte_descompte;
        int categoria = modProd.categoria_id;
        int serie = modProd.serie_id+1;
        String bloc = modProd.num_bloc;
        String passadis = modProd.num_passadis;
        String lleixa = modProd.num_lleixa;
        
        int lloc_id = getIdLloc(bloc,passadis,lleixa);
        //JOptionPane.showMessageDialog(null, serie);
        
        try {
            cn.setAutoCommit(false);
            sql="UPDATE tbl_producte SET producte_nom ='"+nombre+"', producte_preu='"+preu+"'"
                    + ", producte_descompte='"+descompte+"', serie_id='"+serie+"' WHERE producte_id ='"+producto_id+"'";
            try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
            }
            sql="UPDATE tbl_estoc SET lloc_id='"+lloc_id+"' WHERE producte_id='"+producto_id+"'";
            try {
                Statement st = cn.createStatement();
                int rs = st.executeUpdate(sql);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex);
            }
            cn.commit();
        } catch (Exception e) {
            //algo
            try {
                cn.rollback();
            } catch (SQLException ex1) {
               JOptionPane.showMessageDialog(null, "se hace el rollback");
            }
        }
        
    }
    //hacer get procute nom
}
