/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {
    
    private Conexion con = new Conexion();
    private Connection cn = con.conectar(); // Tiene los objetos para conectarnos con la bd
    private String sql = "";

    public UsuarioDAO() {
    }
    
    
    // login usuario
    public Boolean loginUsuario(Usuario usuario) {
        
        String email = usuario.getEmail_usuario();
        String pass = usuario.getPassword_usuario();
        sql = "SELECT * FROM `tbl_usuario` WHERE `tbl_usuario`.`email_usuario` = '" + email + "' AND `tbl_usuario`.`password_usuario` = '" + pass + "'";
        
        //JOptionPane.showMessageDialog(null, sql);
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()) {
                //JOptionPane.showMessageDialog(null, "exito");
                usuario.setNombre_usuario(rs.getString("nombre_usuario"));
                usuario.setApellido_usuario(rs.getString("apellido_usuario"));
                return true;
            }else{
                return false;
            }
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrecta.");
            
        }
        return false;
    }
    
    // recupera la lista de las usuarios
    public void getListaUsuarios(ArrayList<Usuario> listaUsuario) {
        sql = "SELECT * FROM tbl_usuario";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaUsuario.clear();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre_usuario(rs.getString("nombre_usuario"));
                usuario.setApellido_usuario(rs.getString("apellido_usuario"));
                usuario.setPassword_usuario(rs.getString("password_usuario"));
                usuario.setEmail_usuario(rs.getString("email_usuario"));
                listaUsuario.add(usuario);
            }
            //JOptionPane.showMessageDialog(null,"query correcta");
        } catch (SQLException ex) {
//            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, "FALLA LA QUERY getListaUsuarios");
        }
    }
    

    public void eliminarUsuario(int id) {
        sql = "DELETE FROM `tbl_usuario` WHERE `tbl_usuario`.`id_usuario` = ?";

        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            int n = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertarUsuario(Usuario usuario) {
        sql = "INSERT INTO `tbl_usuario` (`nombre_usuario`,`apellido_usuario`,`password_usuario`,`email_usuario`) VALUES(?,?,?,?)";
        try {
            cn.setAutoCommit(false);
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, usuario.getNombre_usuario());
            pst.setString(2, usuario.getApellido_usuario());
            pst.setString(3, usuario.getPassword_usuario());
            pst.setString(4, usuario.getEmail_usuario());
            int n = pst.executeUpdate();

            cn.commit();
        } catch (SQLException ex) {
            try {
                cn.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // recupera usuario
    public Usuario recuperarUsuario(int id) {
        Usuario usuario = new Usuario();
        sql = "SELECT * FROM `tbl_usuario` WHERE `tbl_usuario`.`id_usuario` = " + id;
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            usuario.setId_usuario(rs.getInt("id_usuario"));
            usuario.setNombre_usuario(rs.getString("nombre_usuario"));
            usuario.setApellido_usuario(rs.getString("apellido_usuario"));
            usuario.setPassword_usuario(rs.getString("password_usuario"));
            usuario.setEmail_usuario(rs.getString("email_usuario"));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return usuario;
    }

    // modifica la usuario
    public void modificarUsuario(Usuario usuario) {
        sql = "UPDATE `tbl_usuario` SET `nombre_usuario` = ?, `apellido_usuario` = ?, `password_usuario` = ?, `email_usuario` = ? WHERE `tbl_usuario`.`id_usuario` = ?";
     
        try {
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, usuario.getNombre_usuario());
            pst.setString(2, usuario.getApellido_usuario());
            pst.setString(3, usuario.getPassword_usuario());
            pst.setString(4, usuario.getEmail_usuario());
            pst.setInt(5, usuario.getId_usuario());
            int n = pst.executeUpdate();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Saca el id del ultimo usuario para crear nuevos
    public int getLastId(){
        int id = 0;
        sql="SELECT id_usuario FROM tbl_usuario ORDER BY id_usuario DESC LIMIT 1";
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            id = rs.getInt("id_usuario");
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "Falla la query de sacar id");
        }
        
        return id+1;
    }
}
