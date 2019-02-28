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
    String num_bloc;
    String num_passadis;
    String num_lleixa;

    public Lloc(int lloc, String num_bloc, String num_passadis, String num_lleixa) {
        this.lloc = lloc;
        this.num_bloc = num_bloc;
        this.num_passadis = num_passadis;
        this.num_lleixa = num_lleixa;
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

   

    public Lloc() {
    }
}
