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
public class Usuario {
    private int id_usuario;
    private String email_usuario;
    private String password_usuario;
    private String nombre_usuario;
    private String apellido_usuario;

    public Usuario() {
    }

    public Usuario(int id_usuario, String email_usuario, String password_usuario, String nombre_usuario, String apellido_usuario) {
        this.id_usuario = id_usuario;
        this.email_usuario = email_usuario;
        this.password_usuario = password_usuario;
        this.nombre_usuario = nombre_usuario;
        this.apellido_usuario = apellido_usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public String getEmail_usuario() {
        return email_usuario;
    }

    public String getPassword_usuario() {
        return password_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public String getApellido_usuario() {
        return apellido_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public void setEmail_usuario(String email_usuario) {
        this.email_usuario = email_usuario;
    }

    public void setPassword_usuario(String password_usuario) {
        this.password_usuario = password_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public void setApellido_usuario(String apellido_usuario) {
        this.apellido_usuario = apellido_usuario;
    }
    
    
}
