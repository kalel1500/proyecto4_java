/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Usuario
 */
public class Producto {
    private int producte_id;
    private String producte_nom;
    private String producte_fotoRuta;
    private String producte_fotoNom;
    private String producte_fotoExt;
    private double producte_preu;
    private String producte_descripcio;
    private int producte_descompte;
    private int serie_id;
    private String serie_nom;
    private int categoria_id;
    private String categoria_nom;

    public Producto() {
    }

    public Producto(int producte_id, String producte_nom, String producte_fotoRuta, String producte_fotoNom, String producte_fotoExt, double producte_preu, String producte_descripcio, int producte_descompte, int serie_id, String serie_nom, int categoria_id, String categoria_nom) {
        this.producte_id = producte_id;
        this.producte_nom = producte_nom;
        this.producte_fotoRuta = producte_fotoRuta;
        this.producte_fotoNom = producte_fotoNom;
        this.producte_fotoExt = producte_fotoExt;
        this.producte_preu = producte_preu;
        this.producte_descripcio = producte_descripcio;
        this.producte_descompte = producte_descompte;
        this.serie_id = serie_id;
        this.serie_nom = serie_nom;
        this.categoria_id = categoria_id;
        this.categoria_nom = categoria_nom;
    }

    public int getProducte_id() {
        return producte_id;
    }

    public String getProducte_nom() {
        return producte_nom;
    }

    public String getProducte_fotoRuta() {
        return producte_fotoRuta;
    }

    public String getProducte_fotoNom() {
        return producte_fotoNom;
    }

    public String getProducte_fotoExt() {
        return producte_fotoExt;
    }

    public double getProducte_preu() {
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

    public void setProducte_id(int producte_id) {
        this.producte_id = producte_id;
    }

    public void setProducte_nom(String producte_nom) {
        this.producte_nom = producte_nom;
    }

    public void setProducte_fotoRuta(String producte_fotoRuta) {
        this.producte_fotoRuta = producte_fotoRuta;
    }

    public void setProducte_fotoNom(String producte_fotoNom) {
        this.producte_fotoNom = producte_fotoNom;
    }

    public void setProducte_fotoExt(String producte_fotoExt) {
        this.producte_fotoExt = producte_fotoExt;
    }

    public void setProducte_preu(double producte_preu) {
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

    
    
}
