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
import javax.validation.Valid;
import model.Categoria;
import model.CategoriaDAO;
import model.Conexion;
import model.Estoc;
import model.EstocDAO;
import model.EstocLugar;
import model.EstocLugarDAO;
import model.Lugar;
import model.LugarDAO;
import model.Producto;
import model.ProductoDAO;
import model.Serie;
import model.SerieDAO;
import model.Usuario;
import model.UsuarioDAO;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    // variables
    boolean filtrar = false;
    // Usuario
    UsuarioDAO udao = new UsuarioDAO();
    Usuario usu = new Usuario();
    Usuario usuario = new Usuario();
    ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
    // Producto
    Producto producto = new Producto();
    Producto prodFiltro = new Producto();
    ProductoDAO pdao = new ProductoDAO();
    ArrayList<Producto> listaProducto = new ArrayList<Producto>();
    ArrayList<Producto> listaFiltrarProducto = new ArrayList<Producto>();
    // Estoc
    Estoc estoc = new Estoc();
    EstocDAO edao = new EstocDAO();
    ArrayList<Estoc> listaEstoc = new ArrayList<Estoc>();
    // Lugar
    Lugar lugar = new Lugar();
    LugarDAO ldao = new LugarDAO();
    ArrayList<Lugar> listaBloqueLugar = new ArrayList<Lugar>();
    ArrayList<Lugar> listaPasilloLugar = new ArrayList<Lugar>();
    ArrayList<Lugar> listaEstanteLugar = new ArrayList<Lugar>();
    // EstocLugar
    EstocLugar estocLugar = new EstocLugar();
    EstocLugarDAO eldao = new EstocLugarDAO();
    ArrayList<EstocLugar> listaEstocLugar = new ArrayList<EstocLugar>();
    // Categoria
    Categoria categoria = new Categoria();
    CategoriaDAO cdao = new CategoriaDAO();
    ArrayList<Categoria> listaCategoria = new ArrayList<Categoria>();
    // Serie
    Serie serie = new Serie();
    SerieDAO sdao = new SerieDAO();
    ArrayList<Serie> listaSerie = new ArrayList<Serie>();

    @RequestMapping(value = "index", method = RequestMethod.GET) // esto es lo mismo: @RequestMapping("index")    
    public String indexController(Model model) {
        model.addAttribute("title", "Inicio");
        return "index";
    }
    
    // --------------------------------LOGIN--------------------------------
    

    // login
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginController(Model model) {
        usu = new Usuario();
        model.addAttribute("usu", usu);
        model.addAttribute("title", "Login");
        return "login";
    }

    // login
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginController(@Valid @ModelAttribute("usu") Usuario usu, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            model.addAttribute("usu", usu);
            model.addAttribute("title", "Login");
            return "login";
        } else {
            String pasa = udao.loginUsuario(usu);
            if (pasa.equals("correcto")) {
                model.addAttribute("us", usu);
                //JOptionPane.showMessageDialog(null, "exito");
                model.addAttribute("title", "Inicio");
                return "index";
            } else if (pasa.equals("incorrecto")) {
                model.addAttribute("msgLogin", "incorrecto");
                model.addAttribute("title", "Login");
                return "login";
            } else {
                JOptionPane.showMessageDialog(null, "Ha habido algun error. Vuelve en unos minutos.");
                model.addAttribute("title", "Login");
                return "login";
            }
        }
            
    }

    // login
    @RequestMapping(value = "exito", method = RequestMethod.GET)
    public String exitoController(Model model) {
        model.addAttribute("usu", usu);
        model.addAttribute("title", "Inicio");
        return "index";
    }

    // perfil usuario
    @RequestMapping(value = "perfilUsuario", method = RequestMethod.GET)
    public String perfilUsuarioController(Model model) {
        model.addAttribute("title", "Perfil");
        return "perfilUsuario";
    }

    // logout
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logoutController(SessionStatus cerrarSesion, Model model) {
        cerrarSesion.setComplete();
        model.addAttribute("usu", usu);
        model.addAttribute("title", "Inicio");
        return "index";
    }

    // --------------------------------USUARIOS--------------------------------
    // ------funciones series---------------
    public void funcionListarUsu(Model model) {
        udao.getListaUsuarios(listaUsuario);
        model.addAttribute("listaUsuario", listaUsuario);
        model.addAttribute("title", "Usuarios");
    }
    public void funcionInsertarUsu(Model model, Usuario usuario) {
        // enviamos la serie para el form
        model.addAttribute("usuario", usuario);
        // enviamos el titulo head
        model.addAttribute("title", "Insertar usuarios");
    }
    public void funcionModificarUsu(Model model, Usuario usuario) {
        // enviamos la serie para el formulario
        model.addAttribute("usuario", usuario);
        // enviamos el titulo para el head
        model.addAttribute("title", "Modificar usuario");
    }
    // ------fin-funciones series---------------

    // Mostrar usuarios
    @RequestMapping(value = "listarUsuario", method = RequestMethod.GET)
    public String listarUsuarioController(Model model) {
        funcionListarUsu(model);
        return "listarUsuario";
    }

    // Eliminar usuarios
    @RequestMapping(value = "eliminarUsuario", method = RequestMethod.GET)
    public RedirectView eliminarUsuarioController(@RequestParam("id") int id) {
        RedirectView respuesta = new RedirectView("listarUsuario");
        udao.eliminarUsuario(id);
        return respuesta;
    }

    // Insertar usuarios
    @RequestMapping(value = "insertarUsuario", method = RequestMethod.GET)
    public String insertarUsuarioController(Model model) {
        usuario = new Usuario();
        funcionInsertarUsu(model, usuario);
        return "insertarUsuario";
    }

    // Insertar usuarios
    @RequestMapping(value = "insertarUsuario", method = RequestMethod.POST)
    public String insertarUsuarioController(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionInsertarUsu(model, usuario);
            return "insertarUsuario";
        } else {
            udao.insertarUsuario(usuario);
            funcionListarUsu(model);
            return "listarUsuario";
        }
    }

    // Modificar usuarios
    @RequestMapping(value = "modificarUsuario", method = RequestMethod.GET)
    public String modificarUsuarioController(@RequestParam("id") int id, Model model) {
        usuario = udao.recuperarUsuario(id);
        funcionModificarUsu(model, usuario);
        return "modificarUsuario";
    }
    
    // Modificar usuarios
    @RequestMapping(value = "modificarUsuario", method = RequestMethod.POST)
    public String modificarUsuarioController(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionModificarUsu(model, usuario);
            return "modificarUsuario";
        } else {
            udao.modificarUsuario(usuario);
            funcionListarUsu(model);
            return "listarUsuario";
        }
    }

    // --------------------------------PRODUCTOS--------------------------------
    // --------------------------------PRODUCTOS--------------------------------
    
    // ------funciones productos---------------
    public void funcionListarProd(Model model) {
        // comprobamos si estamos filtrando
        if (filtrar == true) {
            // enviamos la lista de los productos filtrados
            model.addAttribute("listaProducto", listaFiltrarProducto);
            // enviamos el producto lleno para el formulario
            model.addAttribute("producto", prodFiltro);
            filtrar = false;
        } else {
            // enviamos un producto vacio para el formulario
            producto = new Producto();
            model.addAttribute("producto", producto);
            // llenamos la lista con los productos
            pdao.getListaProductos(listaProducto);
            model.addAttribute("listaProducto", listaProducto);
        }

        // enviamos la lista de categorias para el desplegable
        cdao.getListaCategorias(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        // enviamos el titulo para el head
        model.addAttribute("title", "Productos");
    }
    
    public void funcionEnviarListasFroms(Model model, Producto producto) {
        // enviamos el producto para el formulario
        model.addAttribute("producto", producto);
        // enviamos la lista de series para el desplegable
        sdao.getListaSeries(listaSerie);
        model.addAttribute("listaSerie", listaSerie);
        // enviamos la lista de bloques para el desplegable
        ldao.getListaLugares(listaBloqueLugar, "bloque");
        model.addAttribute("listaBloqueLugar", listaBloqueLugar);
        // enviamos la lista de passillos para el desplegable
        ldao.getListaLugares(listaPasilloLugar, "pasillo");
        model.addAttribute("listaPasilloLugar", listaPasilloLugar);
        // enviamos la lista de estantes para el desplegable
        ldao.getListaLugares(listaEstanteLugar, "estante");
        model.addAttribute("listaEstanteLugar", listaEstanteLugar);
    }
    
    
    // -----fin-funciones---------------
    
    // Mostrar productos
    @RequestMapping(value = "listarProducto", method = RequestMethod.GET)
    public String listarProductoController(Model model) {
        funcionListarProd(model);
        return "listarProducto";
    }
    
    // Filtar productos
    @RequestMapping(value = "filtrarProducto", method = RequestMethod.POST)
    public RedirectView filtrarProductoController(@ModelAttribute("producto") Producto prod) {
        // llenamos la lista con los productos filtrados
        pdao.getListaProductosFiltrados(listaFiltrarProducto, prod);
        //enviamos el producto para que el filtro este lleno
        prodFiltro = prod;
        // ponemos la variable filtrar a true
        filtrar = true;
        RedirectView respuesta = new RedirectView("listarProducto");
        return respuesta;
    }

    // Detalle productos
    @RequestMapping(value = "detalleProducto", method = RequestMethod.GET)
    public String detalleProductoController(@RequestParam("id") int id, Model model) {
        producto = pdao.recuperarProducto(id);
        eldao.recuperarEstocLugar(id, listaEstocLugar);
        model.addAttribute("producto", producto);
        model.addAttribute("listaEstocLugar", listaEstocLugar);
        model.addAttribute("title", "Detalle " + producto.getProducte_nom());
        return "detalleProducto";
    }

    // Eliminar productos
    @RequestMapping(value = "eliminarProducto", method = RequestMethod.GET)
    public RedirectView eliminarProductoController(@RequestParam("id") int id, Model model) {
        RedirectView respuesta = new RedirectView("listarProducto");
        pdao.eliminarProducto(id);
        return respuesta;
    }

    // Insertar productos
    @RequestMapping(value = "insertarProducto", method = RequestMethod.GET)
    public String insertarProductoController(Model model) {
        producto = new Producto();
        funcionEnviarListasFroms(model, producto);
        model.addAttribute("title", "Insertar producto");
        return "insertarProducto";
    }

    // Insertar productos
    @RequestMapping(value = "insertarProducto", method = RequestMethod.POST)
    public String insertarProductoController(@Valid @ModelAttribute("producto") Producto producto, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            // llamamos a la funcion que hemos creado (seria el codigo que iria en insertarProductoController)
            funcionEnviarListasFroms(model, producto);
            model.addAttribute("title", "Insertar producto");
            return "insertarProducto";
        } else {
            pdao.insertarProducto(producto);
            funcionListarProd(model);
            return "listarProducto";
        }

    }

    // Modificar productos
    @RequestMapping(value = "modificarProducto", method = RequestMethod.GET)
    public String modificarProductoController(@RequestParam("id") int id, Model model) {
        producto = pdao.recuperarProducto(id);
        funcionEnviarListasFroms(model, producto);
        model.addAttribute("title", "Modificar producto");
        return "modificarProducto";
    }

    // Modificar productos
    @RequestMapping(value = "modificarProducto", method = RequestMethod.POST)
    public String modificarProductoController(@Valid @ModelAttribute("producto") Producto producto, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionEnviarListasFroms(model, producto);
            model.addAttribute("title", "Modificar producto");
            return "modificarProducto";
        } else {
            pdao.modificarProducto(producto);
            funcionListarProd(model);
            return "listarProducto";
        }
        
    }

    // --------------------------------OFERTAS--------------------------------
    // Mostrar ofertas
    @RequestMapping(value = "listarOferta", method = RequestMethod.GET)
    public String listarOfertaController(Model model) {
        // comprobamos si estamos filtrando
        if (filtrar == true) {
            // enviamos la lista de los productos filtrados
            model.addAttribute("listaProducto", listaFiltrarProducto);
            // enviamos el producto lleno para el formulario
            model.addAttribute("producto", prodFiltro);
            filtrar = false;
        } else {
            // enviamos un producto vacio para el formulario
            producto = new Producto();
            model.addAttribute("producto", producto);
            // llenamos la lista con los productos
            pdao.getListaOfertas(listaProducto);
            model.addAttribute("listaProducto", listaProducto);
        }

        // enviamos la lista de categorias para el desplegable
        cdao.getListaCategorias(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        // enviamos el titulo para el head
        model.addAttribute("title", "Ofertas");
        return "listarOferta";
    }

    // Filtar ofertas
    @RequestMapping(value = "filtrarOferta", method = RequestMethod.POST)
    public RedirectView filtrarOfertaController(@ModelAttribute("producto") Producto prod) {
        // llenamos la lista con los productos filtrados
        pdao.getListaOfertasFiltradas(listaFiltrarProducto, prod);
        //enviamos el producto para que el filtro este lleno
        prodFiltro = prod;
        // ponemos la variable filtrar a true
        filtrar = true;
        RedirectView respuesta = new RedirectView("listarOferta");
        return respuesta;
    }

    // --------------------------------CATEGORIAS--------------------------------
    // --------------------------------CATEGORIAS--------------------------------
    // --------------------------------CATEGORIAS--------------------------------
    
    // ------funciones categorias---------------
    public void funcionListarCat(Model model) {
        cdao.getListaCategorias(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        model.addAttribute("title", "Categorias");
    }
    public void funcionInsertarCat(Model model, Categoria categoria) {
        model.addAttribute("categoria", categoria);
        model.addAttribute("title", "Insertar categorias");
    }
    public void funcionModificarCat(Model model, Categoria categoria) {
        model.addAttribute("categoria", categoria);
        model.addAttribute("title", "Modificar categoria");
    }
    // ------fin-funciones categorias---------------

    // Mostrar categorias
    @RequestMapping(value = "listarCategoria", method = RequestMethod.GET)
    public String listarCategoriaController(Model model) {
        funcionListarCat(model);
        return "listarCategoria";
    }

    // Eliminar categorias
    @RequestMapping(value = "eliminarCategoria", method = RequestMethod.GET)
    public RedirectView eliminarCategoriaController(@RequestParam("id") int id, Model model) {
        RedirectView respuesta = new RedirectView("listarCategoria");
        boolean res = cdao.eliminarCategoria(id);
        if (res == false) {
            model.addAttribute("eliminarCat", "false");
        } else {
            model.addAttribute("eliminarCat", "true");
        }
        return respuesta;
    }

    // Insertar categorias
    @RequestMapping(value = "insertarCategoria", method = RequestMethod.GET)
    public String insertarCategoriaController(Model model) {
        categoria = new Categoria();
        funcionInsertarCat(model, categoria);
        return "insertarCategoria";
    }

    // Insertar categorias
    @RequestMapping(value = "insertarCategoria", method = RequestMethod.POST)
    public String insertarUsuarioController(@Valid @ModelAttribute("categoria") Categoria categoria, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionInsertarCat(model, categoria);
            return "insertarCategoria";
        } else {
            cdao.insertarCategoria(categoria);
            funcionListarCat(model);
            return "listarCategoria";
        }
    }

    // Modificar categorias
    @RequestMapping(value = "modificarCategoria", method = RequestMethod.GET)
    public String modificarCategoriaController(@RequestParam("id") int id, Model model) {
        categoria = cdao.recuperarCategoria(id);
        funcionModificarCat(model,categoria);
        return "modificarCategoria";
    }

    // Modificar categorias
    @RequestMapping(value = "modificarCategoria", method = RequestMethod.POST)
    public String modificarCategoriaController(@Valid @ModelAttribute("categoria") Categoria categoria, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionModificarCat(model,categoria);
            return "modificarCategoria";
        } else {
            cdao.modificarCategoria(categoria);
            funcionListarCat(model);
            return "listarCategoria";
        }
    }

    // --------------------------------SERIES--------------------------------
    // ------funciones series---------------
    public void funcionListarSer(Model model) {
        sdao.getListaSeries(listaSerie);
        model.addAttribute("listaSerie", listaSerie);
        model.addAttribute("title", "Series");
    }
    public void funcionInsertarSer(Model model, Serie serie) {
        // enviamos la serie para el form
        model.addAttribute("serie", serie);
        // enviamos la lista de categorias para el desplegable
        cdao.getListaCategorias(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        // enviamos el titulo head
        model.addAttribute("title", "Insertar series");
    }
    public void funcionModificarSer(Model model, Serie serie) {
        // enviamos la serie para el formulario
        model.addAttribute("serie", serie);
        // enviamos la lista de categorias para el desplegable
        cdao.getListaCategorias(listaCategoria);
        model.addAttribute("listaCategoria", listaCategoria);
        // enviamos el titulo para el head
        model.addAttribute("title", "Modificar serie");
    }
    // ------fin-funciones series---------------

    // Mostrar series
    @RequestMapping(value = "listarSerie", method = RequestMethod.GET)
    public String listarSerieController(Model model) {
        funcionListarSer(model);
        return "listarSerie";
    }

    // Eliminar series
    @RequestMapping(value = "eliminarSerie", method = RequestMethod.GET)
    public RedirectView eliminarSerieController(@RequestParam("id") int id, Model model) {
        RedirectView respuesta = new RedirectView("listarSerie");
        boolean res = sdao.eliminarSerie(id);
        if (res == false) {
            model.addAttribute("eliminarSer", "false");
        } else {
            model.addAttribute("eliminarSer", "true");
        }

        return respuesta;
    }

    // Insertar series
    @RequestMapping(value = "insertarSerie", method = RequestMethod.GET)
    public String insertarSerieController(Model model) {
        serie = new Serie();
        funcionInsertarSer(model, serie);
        return "insertarSerie";
    }

    // Insertar series
    @RequestMapping(value = "insertarSerie", method = RequestMethod.POST)
    public String insertarUsuarioController(@Valid @ModelAttribute("serie") Serie serie, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionInsertarSer(model, serie);
            return "insertarSerie";
        } else {
            sdao.insertarSerie(serie);
            funcionListarSer(model);
            return "listarSerie";
        }
    }

    // Modificar series
    @RequestMapping(value = "modificarSerie", method = RequestMethod.GET)
    public String modificarSerieController(@RequestParam("id") int id, Model model) {
        serie = sdao.recuperarSerie(id);
        funcionModificarSer(model,serie);
        return "modificarSerie";
    }

    // Modificar series
    @RequestMapping(value = "modificarSerie", method = RequestMethod.POST)
    public String modificarSerieController(@Valid @ModelAttribute("serie") Serie serie, BindingResult resultado, Model model) {
        if (resultado.hasErrors()) {
            funcionModificarSer(model, serie);
            return "modificarSerie";
        } else {
            sdao.modificarSerie(serie);
            funcionListarSer(model);
            return "listarSerie";
        }
            
    }
}
