/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Usuario
 */
public class Producto {
    private int producte_id;
    //--
    @NotBlank(message = "Nombre requerido")
    private String producte_nom;
    private String producte_fotoRuta;
    private String producte_fotoNom;
    private String producte_fotoExt;
    //--
    @NotNull(message = "Precio requerido")
    @Min(value=1, message = "Precio minimo 1")
    private double producte_preu;
    private String producte_descripcio;
    //--
    @NotNull(message = "Descuento requerido")
    private int producte_descompte;
    private int serie_id;
    //--
    @NotEmpty(message = "Serie requerido")
    private String serie_nom;
    private int categoria_id;
    private String categoria_nom;
    
    private int estoc_id;
    //--
    @Min(value=1, message = "Estoc requerido (minimo 1)")
    private int estoc_quantitat;
    @Min(value=1, message = "Maximo requerido (minimo 1)")
    private int estoc_maxim;
    @Min(value=1, message = "Minimo requerido (minimo 1)")
    private int estoc_minim;
    
    private int lloc_id;
    //--
    @NotEmpty(message = "Bloque requerido")
    private String lloc_bloc;
    //--
    @NotEmpty(message = "Pasillo requerido")
    private String lloc_passadis;
    //--
    @NotEmpty(message = "Estante requerido")
    private String lloc_lleixa;

    public Producto() {
    }

    public Producto(int producte_id, String producte_nom, String producte_fotoRuta, String producte_fotoNom, String producte_fotoExt, double producte_preu, String producte_descripcio, int producte_descompte, int serie_id, String serie_nom, int categoria_id, String categoria_nom, int estoc_id, int estoc_quantitat, int estoc_maxim, int estoc_minim, int lloc_id, String lloc_bloc, String lloc_passadis, String lloc_lleixa) {
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
        this.estoc_id = estoc_id;
        this.estoc_quantitat = estoc_quantitat;
        this.estoc_maxim = estoc_maxim;
        this.estoc_minim = estoc_minim;
        this.lloc_id = lloc_id;
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

    public int getLloc_id() {
        return lloc_id;
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

    public void setLloc_id(int lloc_id) {
        this.lloc_id = lloc_id;
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

    
}
