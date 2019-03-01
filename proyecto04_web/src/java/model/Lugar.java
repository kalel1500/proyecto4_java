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
public class Lugar {
    private int lloc_id;
    private String lloc_bloc;
    private String lloc_passadis;
    private String lloc_lleixa;

    public Lugar() {
    }

    public Lugar(int lloc_id, String lloc_bloc, String lloc_passadis, String lloc_lleixa) {
        this.lloc_id = lloc_id;
        this.lloc_bloc = lloc_bloc;
        this.lloc_passadis = lloc_passadis;
        this.lloc_lleixa = lloc_lleixa;
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
