///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//import javax.swing.JOptionPane;
//import javax.validation.Valid;
//import model.Categoria;
//import model.CategoriaDAO;
//import model.Conexion;
//import model.Estoc;
//import model.EstocDAO;
//import model.EstocLugar;
//import model.EstocLugarDAO;
//import model.Lugar;
//import model.LugarDAO;
//import model.Producto;
//import model.ProductoDAO;
//import model.Serie;
//import model.SerieDAO;
//import model.Usuario;
//import model.UsuarioDAO;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.support.SessionStatus;
//import org.springframework.web.servlet.view.RedirectView;
//
///**
// *
// * @author Usuario
// */
//public class temp {
//    // variables
//    boolean filtrar = false;
//    // Usuario
//    UsuarioDAO udao = new UsuarioDAO();
//    Usuario usu = new Usuario();
//    ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
//    // Producto
//    Producto producto = new Producto();
//    Producto prodFiltro = new Producto();
//    ProductoDAO pdao = new ProductoDAO();
//    ArrayList<Producto> listaProducto = new ArrayList<Producto>();
//    ArrayList<Producto> listaFiltrarProducto = new ArrayList<Producto>();
//    // Estoc
//    Estoc estoc = new Estoc();
//    EstocDAO edao = new EstocDAO();
//    ArrayList<Estoc> listaEstoc = new ArrayList<Estoc>();
//    // Lugar
//    Lugar lugar = new Lugar();
//    LugarDAO ldao = new LugarDAO();
//    ArrayList<Lugar> listaBloqueLugar = new ArrayList<Lugar>();
//    ArrayList<Lugar> listaPasilloLugar = new ArrayList<Lugar>();
//    ArrayList<Lugar> listaEstanteLugar = new ArrayList<Lugar>();
//    // EstocLugar
//    EstocLugar estocLugar = new EstocLugar();
//    EstocLugarDAO eldao = new EstocLugarDAO();
//    ArrayList<EstocLugar> listaEstocLugar = new ArrayList<EstocLugar>();
//    // Categoria
//    Categoria categoria = new Categoria();
//    CategoriaDAO cdao = new CategoriaDAO();
//    ArrayList<Categoria> listaCategoria = new ArrayList<Categoria>();
//    // Serie
//    Serie serie = new Serie();
//    SerieDAO sdao = new SerieDAO();
//    ArrayList<Serie> listaSerie = new ArrayList<Serie>();
//    
//    @RequestMapping(value="index",method = RequestMethod.GET) // esto es lo mismo: @RequestMapping("index")    
//    public String indextemp(Model model) {
//        model.addAttribute("title", "Inicio");
//        return "index";
//    }
//    
//    // login
//    @RequestMapping(value="login",method = RequestMethod.GET)
//    public String logintemp(Model model) {
//        model.addAttribute("usu", usu);
//        model.addAttribute("title", "Login");
//        return "login";
//    }
//    
//    // login
//    @RequestMapping(value="login",method = RequestMethod.POST)
//    public String logintemp(@ModelAttribute("usu") Usuario usu, Model model) {
//        String pasa = udao.loginUsuario(usu);
//        //String nombre = usu.getNombre_usuario();
//        if(pasa.equals("correcto")) {
//            model.addAttribute("us",usu);
//            //JOptionPane.showMessageDialog(null, "exito");
//            model.addAttribute("title", "Inicio");
//            return "index";
//        } else if(pasa.equals("incorrecto")) {
//            JOptionPane.showMessageDialog(null, "Usuario o contraseña incorrecos");
//            model.addAttribute("title", "Login");
//            return "login";
//        } else {
//            JOptionPane.showMessageDialog(null, "Ha habido algun error. Vuelve en unos minutos.");
//            model.addAttribute("title", "Login");
//            return "login";
//        }
//    }
//    
//    // login
//    @RequestMapping(value="exito",method = RequestMethod.GET)
//    public String exitotemp(Model model) {
//        model.addAttribute("usu", usu);
//        model.addAttribute("title", "Inicio");
//        return "index";
//    }
//    
//    // perfil usuario
//    @RequestMapping(value="perfilUsuario",method = RequestMethod.GET)
//    public String perfilUsuariotemp(Model model) {
//        model.addAttribute("title", "Perfil");
//        return "perfilUsuario";
//    }
//    
//    // logout
//    @RequestMapping(value="logout",method = RequestMethod.GET)
//    public String logouttemp(SessionStatus cerrarSesion, Model model) {
//        cerrarSesion.setComplete();
//        model.addAttribute("usu", usu);
//        model.addAttribute("title", "Inicio");
//        return "index";
//    }
//    
//    // --------------------------------USUARIOS--------------------------------
//    // Mostrar usuarios
//    @RequestMapping(value = "listarUsuario", method = RequestMethod.GET)
//    public String listarUsuariotemp(Model model) {     
//        udao.getListaUsuarios(listaUsuario);
//        model.addAttribute("listaUsuario", listaUsuario);
//        model.addAttribute("title", "Usuarios");
//        return "listarUsuario";
//    }
//    
//    // Eliminar usuarios
//    @RequestMapping(value = "eliminarUsuario", method = RequestMethod.GET)
//    public RedirectView eliminarUsuariotemp(@RequestParam("id") int id) {     
//        RedirectView respuesta = new RedirectView("listarUsuario");
//        udao.eliminarUsuario(id);
//        return respuesta;
//    }
//       
//    // Insertar usuarios
//    @RequestMapping(value="insertarUsuario",method = RequestMethod.GET)
//    public String insertarUsuariotemp(Model model) {
//        Usuario usuario = new Usuario();
//        model.addAttribute("usuario",usuario);
//        model.addAttribute("title", "Insertar usuarios");
//        String vista = "insertarUsuario";
//        return vista;
//    }
//    
//    // Insertar usuarios
//    @RequestMapping(value="insertarUsuario",method = RequestMethod.POST)
//    public RedirectView insertarUsuariotemp(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult resultado, Model model) {
//        RedirectView respuesta;
//        if (resultado.hasErrors()) {
//            respuesta = new RedirectView("insertarUsuario");
//        } else {
//            //udao.insertarUsuario(usuario);
//            respuesta = new RedirectView("listarUsuario");
//        }
//        
//        
//        return respuesta;
//    }
//    
//    // Modificar usuarios
//    @RequestMapping(value = "modificarUsuario", method = RequestMethod.GET)
//    public String modificarUsuariotemp(@RequestParam("id") int id, Model model) {
//        Usuario usuario = udao.recuperarUsuario(id);
//        model.addAttribute("usuario", usuario);
//        model.addAttribute("title", "Modificar usuario");
//        return "modificarUsuario";
//    }
//    
//    // Modificar usuarios
//    @RequestMapping(value="modificarUsuario",method = RequestMethod.POST)
//    public RedirectView modificarUsuariotemp(@ModelAttribute("usuario") Usuario usuario) {
//        RedirectView respuesta = new RedirectView("listarUsuario");
//        udao.modificarUsuario(usuario);
//        return respuesta;
//    }
//    
//    
//    // --------------------------------PRODUCTOS--------------------------------
//    // Mostrar productos
//    @RequestMapping(value = "listarProducto", method = RequestMethod.GET)
//    public String listarProductotemp(Model model) {     
//        // comprobamos si estamos filtrando
//        if(filtrar == true) {
//            // enviamos la lista de los productos filtrados
//            model.addAttribute("listaProducto", listaFiltrarProducto);
//            // enviamos el producto lleno para el formulario
//            model.addAttribute("producto",prodFiltro);
//            filtrar = false;
//        } else {
//            // enviamos un producto vacio para el formulario
//            producto = new Producto();
//            model.addAttribute("producto",producto);
//            // llenamos la lista con los productos
//            pdao.getListaProductos(listaProducto);
//            model.addAttribute("listaProducto", listaProducto);
//        }
//        
//        // enviamos la lista de categorias para el desplegable
//        cdao.getListaCategorias(listaCategoria);
//        model.addAttribute("listaCategoria", listaCategoria);
//        // enviamos el titulo para el head
//        model.addAttribute("title", "Productos");
//        return "listarProducto";
//    }
//    
//    // Mostrar productos
//    @RequestMapping(value = "listarProducto1", method = RequestMethod.GET)
//    public String listarProducto1temp(Model model) {     
//        // comprobamos si estamos filtrando
//        
//            
//        model.addAttribute("producto",producto);
//        model.addAttribute("listaProducto", listaProducto);
//        model.addAttribute("listaSeries", listaSerie);
//        
//        
//        // enviamos la lista de categorias para el desplegable
//        model.addAttribute("listaCategoria", listaCategoria);
//        // enviamos el titulo para el head
//        model.addAttribute("title", "Productos");
//        return "listarProducto";
//    }
//    
//    // Filtar productos
//    @RequestMapping(value = "filtrarProducto", method = RequestMethod.POST)
//    public RedirectView filtrarProductotemp(@ModelAttribute("producto") Producto prod) {     
//        // llenamos la lista con los productos filtrados
//        pdao.getListaProductosFiltrados(listaFiltrarProducto, prod);
//        //enviamos el producto para que el filtro este lleno
//        prodFiltro = prod;
//        
//        filtrar = true;
//        RedirectView respuesta = new RedirectView("listarProducto");
//        return respuesta;
//    }
//    
//    // Detalle productos
//    @RequestMapping(value = "detalleProducto", method = RequestMethod.GET)
//    public String detalleProductotemp(@RequestParam("id") int id, Model model) {     
//        producto = pdao.recuperarProducto(id);
////        edao.recuperarEstoc(id,listaEstoc);
////        ldao.recuperarLugar(id,listaLugar);
//        eldao.recuperarEstocLugar(id, listaEstocLugar);
//        model.addAttribute("producto", producto);
////        model.addAttribute("listaEstoc", listaEstoc);
////        model.addAttribute("listaLugar", listaLugar);
//        model.addAttribute("listaEstocLugar", listaEstocLugar);
//        model.addAttribute("title", "Detalle "+producto.getProducte_nom());
//        return "detalleProducto";
//    }
//    
//    // Eliminar productos
//    @RequestMapping(value = "eliminarProducto", method = RequestMethod.GET)
//    public RedirectView eliminarProductotemp(@RequestParam("id") int id, Model model) {     
//        RedirectView respuesta = new RedirectView("listarProducto");
//        pdao.eliminarProducto(id);
//        return respuesta;
//    }
//       
//    // Insertar productos
//    @RequestMapping(value="insertarProducto",method = RequestMethod.GET)
//    public String insertarProductotemp(Model model) {
//        // enviamos un producto vacio para el formulario
//        producto = new Producto();
//        model.addAttribute("producto",producto);
//        // enviamos la lista de series para el desplegable
//        sdao.getListaSeries(listaSerie);
//        model.addAttribute("listaSerie", listaSerie);
//        // enviamos la lista de bloques para el desplegable
//        ldao.getListaBloquesLugares(listaBloqueLugar);
//        model.addAttribute("listaBloqueLugar", listaBloqueLugar);
//        // enviamos la lista de passillos para el desplegable
//        ldao.getListaPasillosLugares(listaPasilloLugar);
//        model.addAttribute("listaPasilloLugar", listaPasilloLugar);
//        // enviamos la lista de estantes para el desplegable
//        ldao.getListaEstanteLugares(listaEstanteLugar);
//        model.addAttribute("listaEstanteLugar", listaEstanteLugar);
//        // enviamos el titulo para el head
//        model.addAttribute("title", "Insertar producto");
//        String vista = "insertarProducto";
//        return vista;
//    }
//    
//    // Insertar productos
//    @RequestMapping(value="insertarProducto",method = RequestMethod.POST)
//    public RedirectView insertarProductotemp(@Valid @ModelAttribute("producto") Producto producto, BindingResult resultado, Model model) {
//        RedirectView respuesta = new RedirectView("listarProducto");
//        if (resultado.hasErrors()) {
//            respuesta = new RedirectView("insertarProducto");
//        } else {
//            pdao.insertarProducto(producto);
//        }
//        
//        return respuesta;
//    }
//    
//    // Modificar productos
//    @RequestMapping(value = "modificarProducto", method = RequestMethod.GET)
//    public String modificarProductotemp(@RequestParam("id") int id, Model model) {
//        producto = pdao.recuperarProducto(id);
//        model.addAttribute("producto", producto);
//        // enviamos la lista de series para el desplegable
//        sdao.getListaSeries(listaSerie);
//        model.addAttribute("listaSerie", listaSerie);
//        // enviamos la lista de bloques para el desplegable
//        ldao.getListaBloquesLugares(listaBloqueLugar);
//        model.addAttribute("listaBloqueLugar", listaBloqueLugar);
//        // enviamos la lista de passillos para el desplegable
//        ldao.getListaPasillosLugares(listaPasilloLugar);
//        model.addAttribute("listaPasilloLugar", listaPasilloLugar);
//        // enviamos la lista de estantes para el desplegable
//        ldao.getListaEstanteLugares(listaEstanteLugar);
//        model.addAttribute("listaEstanteLugar", listaEstanteLugar);
//        // enviamos el titulo para el head
//        model.addAttribute("title", "Modificar producto");
//        return "modificarProducto";
//    }
//    
//    // Modificar productos
//    @RequestMapping(value="modificarProducto",method = RequestMethod.POST)
//    public RedirectView modificarProductotemp(@ModelAttribute("producto") Producto producto) {
//        RedirectView respuesta = new RedirectView("listarProducto");
//        pdao.modificarProducto(producto);
//        return respuesta;
//    }
//    
//    @RequestMapping("cargarSelectSerie")
//    public RedirectView cargarSelectSerie(@RequestParam("categoria_nom") String cat_nom) {
//        RedirectView respuesta = new RedirectView("listarProducto1");
//        try {
//            sdao.getListaSeriePorCategoria(cat_nom,listaSerie);
//            
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, "error");
//        }
//        
//        return respuesta;
//    }
////    @RequestMapping("cargarSelectSerie")
////    public @ResponseBody ArrayList<Serie> cargarSelectSerie(@RequestParam("categoria_nom") String cat_nom) {
////        try {
////            sdao.getListaSeriePorCategoria(cat_nom,listaSerie);
////        } catch (Exception e) {
////            JOptionPane.showMessageDialog(null, "error");
////        }
////        
////        return listaSerie;
////    }
//    
//    // --------------------------------OFERTAS--------------------------------
//    // Mostrar ofertas
//    @RequestMapping(value = "listarOferta", method = RequestMethod.GET)
//    public String listarOfertatemp(Model model) {     
//        // comprobamos si estamos filtrando
//        if(filtrar == true) {
//            // enviamos la lista de los productos filtrados
//            model.addAttribute("listaProducto", listaFiltrarProducto);
//            // enviamos el producto lleno para el formulario
//            model.addAttribute("producto",prodFiltro);
//            filtrar = false;
//        } else {
//            // enviamos un producto vacio para el formulario
//            producto = new Producto();
//            model.addAttribute("producto",producto);
//            // llenamos la lista con los productos
//            pdao.getListaOfertas(listaProducto);
//            model.addAttribute("listaProducto", listaProducto);
//        }
//        
//        // enviamos la lista de categorias para el desplegable
//        cdao.getListaCategorias(listaCategoria);
//        model.addAttribute("listaCategoria", listaCategoria);
//        // enviamos el titulo para el head
//        model.addAttribute("title", "Ofertas");
//        return "listarOferta";
//    }
//    
//    // Filtar ofertas
//    @RequestMapping(value = "filtrarOferta", method = RequestMethod.POST)
//    public RedirectView filtrarOfertatemp(@ModelAttribute("producto") Producto prod) {     
//        // llenamos la lista con los productos filtrados
//        pdao.getListaOfertasFiltradas(listaFiltrarProducto, prod);
//        //enviamos el producto para que el filtro este lleno
//        prodFiltro = prod;
//        
//        filtrar = true;
//        RedirectView respuesta = new RedirectView("listarOferta");
//        return respuesta;
//    }
//    
//    
//    // --------------------------------CATEGORIAS--------------------------------
//    // Mostrar categorias
//    @RequestMapping(value = "listarCategoria", method = RequestMethod.GET)
//    public String listarCategoriatemp(Model model) {     
//        cdao.getListaCategorias(listaCategoria);
//        model.addAttribute("listaCategoria", listaCategoria);
//        model.addAttribute("title", "Categorias");
//        return "listarCategoria";
//    }
//    
//    // Eliminar categorias
//    @RequestMapping(value = "eliminarCategoria", method = RequestMethod.GET)
//    public RedirectView eliminarCategoriatemp(@RequestParam("id") int id, Model model) {     
//        RedirectView respuesta = new RedirectView("listarCategoria");
//        boolean res = cdao.eliminarCategoria(id);
//        if(res == false) {
//            model.addAttribute("eliminarCat", "false");
//        } else {
//            model.addAttribute("eliminarCat", "true");
//        }
//        return respuesta;
//    }
//       
//    // Insertar categorias
//    @RequestMapping(value="insertarCategoria",method = RequestMethod.GET)
//    public String insertarCategoriatemp(Model model) {
//        Categoria categoria = new Categoria();
//        model.addAttribute("categoria",categoria);
//        model.addAttribute("title", "Insertar categorias");
//        String vista = "insertarCategoria";
//        return vista;
//    }
//    
//    // Insertar categorias
//    @RequestMapping(value="insertarCategoria",method = RequestMethod.POST)
//    public RedirectView insertarUsuariotemp(@Valid @ModelAttribute("categoria") Categoria categoria, BindingResult resultado, Model model) {
//        RedirectView respuesta = new RedirectView("listarCategoria");
//        if (resultado.hasErrors()) {
//            respuesta = new RedirectView("insertarCategoria");
//            model.addAttribute(resultado);
//        } else {
//            cdao.insertarCategoria(categoria);
//        }
//        return respuesta;
//    }
//    
//    // Modificar categorias
//    @RequestMapping(value = "modificarCategoria", method = RequestMethod.GET)
//    public String modificarCategoriatemp(@RequestParam("id") int id, Model model) {
//        Categoria categoria = cdao.recuperarCategoria(id);
//        model.addAttribute("categoria", categoria);
//        model.addAttribute("title", "Modificar categoria");
//        return "modificarCategoria";
//    }
//    
//    // Modificar categorias
//    @RequestMapping(value="modificarCategoria",method = RequestMethod.POST)
//    public RedirectView modificarCategoriatemp(@ModelAttribute("categoria") Categoria categoria) {
//        RedirectView respuesta = new RedirectView("listarCategoria");
//        cdao.modificarCategoria(categoria);
//        return respuesta;
//    }
//    
//    // --------------------------------SERIES--------------------------------
//    // Mostrar series
//    @RequestMapping(value = "listarSerie", method = RequestMethod.GET)
//    public String listarSerietemp(Model model) {     
//        sdao.getListaSeries(listaSerie);
//        model.addAttribute("listaSerie", listaSerie);
//        model.addAttribute("title", "Series");
//        return "listarSerie";
//    }
//    
//    // Eliminar series
//    @RequestMapping(value = "eliminarSerie", method = RequestMethod.GET)
//    public RedirectView eliminarSerietemp(@RequestParam("id") int id, Model model) {     
//        RedirectView respuesta = new RedirectView("listarSerie");
//        boolean res = sdao.eliminarSerie(id);
//        if(res == false) {
//            model.addAttribute("eliminarSer", "false");
//        } else {
//            model.addAttribute("eliminarSer", "true");
//        }
//        
//        return respuesta;
//    }
//       
//    // Insertar series
//    @RequestMapping(value="insertarSerie",method = RequestMethod.GET)
//    public String insertarSerietemp(Model model) {
//        Serie serie = new Serie();
//        model.addAttribute("serie",serie);
//        // enviamos la lista de categorias para el desplegable
//        cdao.getListaCategorias(listaCategoria);
//        model.addAttribute("listaCategoria", listaCategoria);
//        
//        model.addAttribute("title", "Insertar series");
//        String vista = "insertarSerie";
//        return vista;
//    }
//    
//    // Insertar series
//    @RequestMapping(value="insertarSerie",method = RequestMethod.POST)
//    public RedirectView insertarUsuariotemp(@Valid @ModelAttribute("serie") Serie serie, BindingResult resultado, Model model) {
//        RedirectView respuesta = new RedirectView("listarSerie");
//        if (resultado.hasErrors()) {
//            respuesta = new RedirectView("insertarSerie");
//        } else {
//            sdao.insertarSerie(serie);
//        }
//        return respuesta;
//    }
//    
//    // Modificar series
//    @RequestMapping(value = "modificarSerie", method = RequestMethod.GET)
//    public String modificarSerietemp(@RequestParam("id") int id, Model model) {
//        Serie serie = sdao.recuperarSerie(id);
//        model.addAttribute("serie", serie);
//        // enviamos la lista de categorias para el desplegable
//        cdao.getListaCategorias(listaCategoria);
//        model.addAttribute("listaCategoria", listaCategoria);
//        
//        model.addAttribute("title", "Modificar serie");
//        return "modificarSerie";
//    }
//    
//    // Modificar series
//    @RequestMapping(value="modificarSerie",method = RequestMethod.POST)
//    public RedirectView modificarSerietemp(@ModelAttribute("serie") Serie serie) {
//        RedirectView respuesta = new RedirectView("listarSerie");
//        sdao.modificarSerie(serie);
//        return respuesta;
//    }
//}
