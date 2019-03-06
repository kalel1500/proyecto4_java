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
public class Lloc {
    int lloc;
    String lloc_bloc;
    String lloc_passadis;
    String lloc_lleixa;

    public Lloc(int lloc, String lloc_bloc, String lloc_passadis, String lloc_lleixa) {
        this.lloc = lloc;
        this.lloc_bloc = lloc_bloc;
        this.lloc_passadis = lloc_passadis;
        this.lloc_lleixa = lloc_lleixa;
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

   

    public Lloc() {
    }
}
