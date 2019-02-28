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
public class Estoc {
    private int estoc_id;
    private int estoc_quantitat;
    private int estoc_maxim;
    private int estoc_minim;
    private int producte_id;
    private int lloc_id;

    public Estoc() {
    }

    public Estoc(int estoc_id, int estoc_quantitat, int estoc_maxim, int estoc_minim, int producte_id, int lloc_id) {
        this.estoc_id = estoc_id;
        this.estoc_quantitat = estoc_quantitat;
        this.estoc_maxim = estoc_maxim;
        this.estoc_minim = estoc_minim;
        this.producte_id = producte_id;
        this.lloc_id = lloc_id;
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

    public int getProducte_id() {
        return producte_id;
    }

    public int getLloc_id() {
        return lloc_id;
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

    public void setProducte_id(int producte_id) {
        this.producte_id = producte_id;
    }

    public void setLloc_id(int lloc_id) {
        this.lloc_id = lloc_id;
    }

    
    
    
}
