/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author msi
 */
public class Producto {
    int producte_id;
    String producte_nom;
    String producte_fotoNom;
    Double producte_preu;
    String producte_descripcio;
    int producte_descompte;
    int serie_id;

    public Producto() {
    }

    public Producto(int producte_id, String producte_nom, double producte_preu, String producte_fotoNom, int serie_id, String producte_descripcio, int producte_descompte) {
        this.producte_id = producte_id;
        this.producte_nom = producte_nom;
        this.producte_preu = producte_preu;
        this.producte_fotoNom = producte_fotoNom;
        this.serie_id = serie_id;
        this.producte_descripcio = producte_descripcio;
        this.producte_descompte = producte_descompte;
    }

    public int getProducte_id() {
        return producte_id;
    }

    public String getProducte_nom() {
        return producte_nom;
    }

    public double getProducte_preu() {
        return producte_preu;
    }

    public String getProducte_fotoNom() {
        return producte_fotoNom;
    }

    public int getSerie_id() {
        return serie_id;
    }

    public String getProducte_descripcio() {
        return producte_descripcio;
    }

    public int getProducte_descompte() {
        return producte_descompte;
    }

    public void setProducte_id(int producte_id) {
        this.producte_id = producte_id;
    }

    public void setProducte_nom(String producte_nom) {
        this.producte_nom = producte_nom;
    }

    public void setProducte_preu(double producte_preu) {
        this.producte_preu = producte_preu;
    }

    public void setProducte_fotoNom(String producte_fotoNom) {
        this.producte_fotoNom = producte_fotoNom;
    }

    public void setSerie_id(int serie_id) {
        this.serie_id = serie_id;
    }

    public void setProducte_descripcio(String producte_descripcio) {
        this.producte_descripcio = producte_descripcio;
    }

    public void setProducte_descompte(int producte_descompte) {
        this.producte_descompte = producte_descompte;
    }

   
}
