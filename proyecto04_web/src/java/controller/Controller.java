/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Conexion;
import model.Usuario;
import model.UsuarioDAO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Usuario
 */
@org.springframework.stereotype.Controller
@RequestMapping("/")
@SessionAttributes({"us"})
public class Controller {
    // Creamos la clase UsuarioDAO para realizar las conexiones a la bd
    UsuarioDAO udao = new UsuarioDAO();
    Usuario usu = new Usuario();
    
    ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
    
    @RequestMapping(value="index",method = RequestMethod.GET) // esto es lo mismo: @RequestMapping("index")    
    public String indexController() {
        return "index";
    }
    
    @RequestMapping(value="login",method = RequestMethod.GET)
    public String loginController(Model model) {
        model.addAttribute("usu", usu);
        return "login";
    }
    
    @RequestMapping(value="login",method = RequestMethod.POST)
    public String loginController(@ModelAttribute("usu") Usuario usu, Model model) {
        String pasa = udao.loginUsuario(usu);
        //String nombre = usu.getNombre_usuario();
        if(pasa.equals("correcto")) {
            model.addAttribute("us",usu);
            //JOptionPane.showMessageDialog(null, "exito");
            return "index";
        } else if(pasa.equals("incorrecto")) {
            JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrecos");
            return "login";
        } else {
            JOptionPane.showMessageDialog(null, "Ha habido algun error. Vuelve en unos minutos.");
            return "login";
        }
    }
    
    @RequestMapping(value="exito",method = RequestMethod.GET)
    public String exitoController(Model model) {
        model.addAttribute("usu", usu);
        return "index";
    }
    
    @RequestMapping(value="logout",method = RequestMethod.GET)
    public String logoutController(SessionStatus cerrarSesion, Model model) {
        cerrarSesion.setComplete();
        model.addAttribute("usu", usu);
        return "index";
    }
    // controlador
    @RequestMapping(value = "listarUsuario", method = RequestMethod.GET)
    public String listarUsuarioController(Model model) {     
        udao.getListaUsuarios(listaUsuario);
        model.addAttribute("listaUsuario", listaUsuario);
        return "listarUsuario";
    }
    
    // controlador
    @RequestMapping(value = "eliminar", method = RequestMethod.GET)
    public RedirectView eliminarUsuarioController(@RequestParam("id") int id) {     
        RedirectView respuesta = new RedirectView("listarUsuario");
        udao.eliminarUsuario(id);
        return respuesta;
    }
       
    // controlador
    @RequestMapping(value="insertarUsuario",method = RequestMethod.GET)
    public String insertarUsuarioController(Model model) {
        Usuario usuario = new Usuario();
        model.addAttribute("usuario",usuario);
        String vista = "insertarUsuario";
        return vista;
    }
    
    // controlador
    @RequestMapping(value="insertarUsuario",method = RequestMethod.POST)
    public RedirectView insertarUsuarioController(@ModelAttribute("usuario") Usuario usuario) {
        RedirectView respuesta = new RedirectView("listarUsuario");
        udao.insertarUsuario(usuario);
        return respuesta;
    }
    
    // controlador
    @RequestMapping(value = "modificar", method = RequestMethod.GET)
    public String modificarUsuarioController(@RequestParam("id") int id, Model model) {     
        Usuario usuario = udao.recuperarUsuario(id);
        model.addAttribute("usuario", usuario);
        return "modificarUsuario";
    }
    
    // controlador
    @RequestMapping(value="modificarUsuario",method = RequestMethod.POST)
    public RedirectView modificarUsuarioController(@ModelAttribute("usuario") Usuario usuario) {
        RedirectView respuesta = new RedirectView("listarUsuario");
        udao.modificarUsuario(usuario);
        return respuesta;
    }
}
