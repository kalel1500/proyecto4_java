
import java.awt.Color;
import java.awt.HeadlessException;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.imageio.ImageIO;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import static jdk.nashorn.internal.objects.NativeRegExp.source;
import model.Categoria;
import model.Conexion;
import model.Estoc;
import model.EstocDAO;
import model.Lloc;
import model.LlocDAO;
import model.SuperProducto;
import model.Producto;
import model.ProductoDAO;
import model.Serie;
import model.Usuario;
import model.UsuarioDAO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author msi
 */
public class Home extends javax.swing.JFrame {

    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    ProductoDAO pDAO = new ProductoDAO();
    EstocDAO eDAO = new EstocDAO();
    LlocDAO lDAO = new LlocDAO();
    Serie serie = new Serie();
    Categoria cat = new Categoria();
    Estoc estoc = new Estoc();
    int i = 1;
    File file=null;
//    String ruta= System.getProperty("user.dir");
//    JOptionPane.showMessageDialog (null, ruta);
    
   
    
    
    
    ArrayList<Producto> infoProducto = new ArrayList<Producto>();
    ArrayList<Categoria> catArray = new ArrayList<Categoria>();
    ArrayList<Serie> serArray = new ArrayList<Serie>();
    ArrayList<Lloc> llocArray = new ArrayList<Lloc>();
    SuperProducto modProd = new SuperProducto();
    SuperProducto crearProd = new SuperProducto();
    /**
     * Creates new form Home
     */
    public Home(String texto) {
        initComponents();
        this.setLocationRelativeTo(null);
        cat.getAllCategoria(catArray, jCatNom);
        cargarTabla();
        desactivarCamposProducto();
        desactivarCamposStock();
        activarDesactivarFlechas();
        this.jGuardarProducto.setEnabled(false);
       
    }
    
    //FLECHAS
    public void activarDesactivarFlechas() {
        pDAO.getInfoProducto(infoProducto);
        //JOptionPane.showMessageDialog(null, i);
        if (i == infoProducto.size() && infoProducto.size() > 1) {
            activarFlechasAlante(false);
            activarFlechasAtras(true);
        } else if (i == 0 && infoProducto.size() == 1) {
            activarFlechasAlante(false);
            activarFlechasAtras(false);
        } else if (i == 0 || i == 1) {
            activarFlechasAlante(true);
            activarFlechasAtras(false);
        }else {
            activarFlechasAlante(true);
            activarFlechasAtras(true);
        }
        desactivarCamposProducto();
        desactivarCamposStock();
    }
    
    //Desactiva todos los botones para la creacion de productos
    public void desactivarTodo(){
        
        activarFlechasAlante(false);
        activarFlechasAtras(false);
        this.jCrearProducto.setEnabled(false);
        this.jBtnGuardarProducto.setEnabled(false);
        this.jBtnModificarProducto.setEnabled(false);
        this.jBtnModificarCantidad.setEnabled(false);
        this.jBtnUpdateStock.setEnabled(false);
        this.jBtnStock.setEnabled(false);
    }
    
    //Desactiva todos los botones para la creacion de productos
    public void activarTodo(){
        
        activarDesactivarFlechas();
        this.jCrearProducto.setEnabled(true);
        this.jBtnGuardarProducto.setEnabled(true);
        this.jBtnModificarProducto.setEnabled(true);
        this.jBtnModificarCantidad.setEnabled(true);
        this.jBtnUpdateStock.setEnabled(true);
        this.jBtnStock.setEnabled(true);
    }
    
    public void activarFlechasAlante(boolean ac) {
        this.jSiguiente.setEnabled(ac);
        this.jUltimo.setEnabled(ac);
    }

    public void activarFlechasAtras(boolean ac) {
        this.jAnterior.setEnabled(ac);
        this.jPrimero.setEnabled(ac);
    }

    //DESACTIVA EL BOTON DE SUBIR IMAGEN 
    public void activarSubirImg(){
        
    }
    
    //HACE LA TABLA
     public DefaultTableModel cargarTabla(){
        DefaultTableModel dmodel=null;
        String cabecera[]={"id","Nombre","Precio","Descuento","Serie"};
        pDAO.getInfoProducto(infoProducto);
        dmodel=new DefaultTableModel(null,cabecera);
        String campo[]=new String[5];
        for(Producto p:infoProducto){
            //campo[0]=p.getId_persona().toString();
            campo[0]=String.valueOf(p.getProducte_id());
            campo[1]=p.getProducte_nom();  
            campo[2]=String.valueOf(p.getProducte_preu());
            campo[3]=String.valueOf(p.getProducte_descompte());
            campo[4]=String.valueOf(p.getSerie_id());

            dmodel.addRow(campo);
        }
        this.tablaProducto.setModel(dmodel);
        
        return dmodel;
    }
     
     
     private void openUsuarios(){
        java.awt.EventQueue.invokeLater(() -> {
            new Usuarios().setVisible(true);
        });
    }
    private void openHome(){
         java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Home(null).setVisible(true);
            }
        });
    }
    private void openCategoria(){
         java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Categorias().setVisible(true);
            }
        });
    }
    private void openCrearUsu(){
        java.awt.EventQueue.invokeLater(() -> {
            new CrearUsu().setVisible(true);
        });
    }
    
    //guarda el nuevo producto
    public void guardarNuevoProducto(){
        boolean error = false;
        
        //Mirar si el nombre existe
        String nombre = pDAO.nombreExists(this.jProdNom.getText());
        if(!(nombre.equals(""))){
            JOptionPane.showMessageDialog(null, "este producto ya existe!");
            error=true;
        }
        
        /* NOMBRE */
        if(!(this.jProdNom.getText().equals("")) || !(this.jProdNom.getText().length() < 1)){
            crearProd.setProducte_nom(this.jProdNom.getText());
        }else{
            JOptionPane.showMessageDialog(null, "el nombre no puede estar vacío!");
            error = true;
        }
        
        /* PRECIO */
        try {
            if(!(this.jProdPreu.getText().equals("")) || !(this.jProdPreu.getText().length() < 1)){
               crearProd.setProducte_preu(Double.parseDouble(this.jProdPreu.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "el precio no puede estar vacío!");
                error = true;
            }
        } catch (Exception e) {
            error=true;
            JOptionPane.showMessageDialog(null, "el precio ha de ser un número!");
        }
        
        
        /*  DESCUENTO */
        try {
            if(!(this.jProdDescompte.getText().equals("")) || !(this.jProdDescompte.getText().length() < 1)){
                if(Integer.parseInt(this.jProdDescompte.getText()) > 99){
                    error = true;
                    JOptionPane.showMessageDialog(null,"El descuento no puede ser del 100% o más!");
                }
                crearProd.setProducte_descompte(Integer.parseInt(this.jProdDescompte.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "el descuento no puede estar vacío!");
                error = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "el descuento ha de ser un número!");
        }
        
        
        /* DESCRIPCIO */
        if(!(this.jProdDescripcio.getText().equals("")) || !(this.jProdDescripcio.getText().length() < 1)){
            crearProd.setProducte_descripcio(this.jProdDescripcio.getText());
        }else{
            JOptionPane.showMessageDialog(null, "la descripció no puede estar vacío!");
            error = true;
        }
        
        /* ESTO MAX */
        try {
            if(Integer.parseInt(this.jStockMax.getText()) < Integer.parseInt(this.jStockMin.getText()) ){
                error = true;
                JOptionPane.showMessageDialog(null, "El stock Máx no puede ser menor al Minimo!");
            }
            if(!(Integer.parseInt(this.jStockMax.getText()) <= 0)){
                crearProd.setEstoc_maxim(Integer.parseInt(this.jStockMax.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "el estoc max no puede estar vacío!");
                error = true;
            }

            /*ESTOC MIN */
             if(!(Integer.parseInt(this.jStockMin.getText()) <= 0)){
                crearProd.setEstoc_minim(Integer.parseInt(this.jStockMin.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "el estoc min no puede estar vacío!");
                error = true;
            }
             
        } catch (Exception e) {
            error = true;
            JOptionPane.showMessageDialog(null, "Introduce números!");
        }        
         
        try {
            String Serienom = (String)this.jSerNom.getSelectedItem();
            crearProd.setProducte_id(pDAO.getNextId()+1);
            //JOptionPane.showMessageDialog(null, crearProd.getProducte_id());
            crearProd.setCategoria_id(this.jCatNom.getSelectedIndex());
            crearProd.setSerie_id(serie.getId(Serienom));
            crearProd.setLloc_bloc((String)this.jLlocBloc.getSelectedItem());
            crearProd.setLloc_passadis((String)this.jLlocPassadis.getSelectedItem());
            crearProd.setLloc_lleixa((String)this.jLlocLleixa.getSelectedItem());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "error en algunos campos");
        }
        
        /* IMAGEN */
         try {                       
             BufferedImage imag = ImageIO.read(file);
           /************************************************************************/
             String Location="F:/msi/Documents/NetBeansProjects/1819_DAW2_PR04_DESKAPP/src/img1/"+crearProd.getProducte_id()+"_"+this.jProdNom.getText()+".jpg";
           /************************************************************************/
             JOptionPane.showMessageDialog(null, Location);
             String format="PNG";
             ImageIO.write(imag, format,new File(Location));
             crearProd.setProducte_fotoNom(this.jProdNom.getText());
             JOptionPane.showMessageDialog(null,"imagen subida correctamente");
            
        } catch (Exception ex) {
            //JOptionPane.showMessageDialog(null, ex.getMessage());
            JOptionPane.showMessageDialog(null, "error al subir la imagen");
        }
        
        //crearProd.setEstoc_quantitat(Integer.parseInt(this.jStockActual.getText()));
        
        //crearProd.setProducte_id(Integer.parseInt(this.jProdIndex.getText()));
        if(error == false){
            crearProd.crearProducto(crearProd);
            JOptionPane.showMessageDialog(null, "Producto creado!");
            int i = 0;
            limpiarCampos();
            cargarTabla(); 
        }
        
    }
    
    //Este boton recarga los registros de la BDD al hacer la accion
    public void refrescar(int i){
        Producto infoProducto =  pDAO.recuperarProducto(i);
        Estoc infoEstoc = eDAO.recuperarEstoc(i);
        Lloc infoLloc = lDAO.recuperarLloc(i);
        Serie getSerieId = serie.getSerieId(i);
        Categoria catNom = cat.nomCategoria(i);
        Serie serieNom = serie.nomSerie(i);
        
        //JMODIFICAR LA RUTA
        /******************************************************************************/
        ImageIcon img = new ImageIcon("F:\\msi\\Documents\\NetBeansProjects\\1819_DAW2_PR04_DESKAPP\\src\\img1\\"+infoProducto.getProducte_fotoNom()+".jpg");
        /******************************************************************************/
        this.jProdNom.setText(String.valueOf(infoProducto.getProducte_nom()));
        this.jProdPreu.setText(String.valueOf(infoProducto.getProducte_preu()));
        this.jProdDescompte.setText(String.valueOf(infoProducto.getProducte_descompte()));
        this.jProdDescripcio.setText(String.valueOf(infoProducto.getProducte_descripcio()));


        this.jCatNom.setSelectedItem(catNom.getCategoria_nom());
        this.jSerNom.setSelectedItem(serieNom.getSerie_nom());

        this.jLlocBloc.setSelectedItem(infoLloc.getLloc_bloc());
        this.jLlocPassadis.setSelectedItem(infoLloc.getLloc_passadis());
        this.jLlocLleixa.setSelectedItem(infoLloc.getLloc_lleixa());


        this.jStockActual.setText(String.valueOf(infoEstoc.getEstoc_quantitat()));
        this.jStockMax.setText(String.valueOf(infoEstoc.getEstoc_maxim()));
        this.jStockMin.setText(String.valueOf(infoEstoc.getEstoc_minim())); 

       // jProdImagen.setIcon(img);
        jProdImagen.setIcon(new javax.swing.ImageIcon(img.getImage().getScaledInstance(200, 180, Image.SCALE_SMOOTH)));
        //getscaled instance.
      
        this.jProdIndex.setText(String.valueOf(i));
        this.jGuardarProducto.setEnabled(false);
    }
    
    public void limpiarCampos(){
        this.jProdNom.setText("");
        this.jProdPreu.setText("");
        this.jProdDescompte.setText("");
        this.jProdDescripcio.setText("");
        
               
        this.jCatNom.setSelectedItem("");
        this.jSerNom.setSelectedItem("");
        
        this.jLlocBloc.setSelectedItem("");
        this.jLlocPassadis.setSelectedItem("");
        this.jLlocLleixa.setSelectedItem("");
        
        
        this.jStockActual.setText("");
        this.jStockMax.setText("");
        this.jStockMin.setText("");
        
        this.jProdImagen.setText("");
        //this.jProdIndex.setText("");
        this.jProdImagen.setOpaque(true);//repaint();
        //this.jProdImagen.setIcon(icon);
        this.jProdImagen.setIcon(null);
    }
    
    //Bloquea los campos si n hay id seleccionado
    public void desactivarCamposProducto(){
        
        //JOptionPane.showMessageDialog(null, "Neo esatamos dentro");
        //JOptionPane.showMessageDialog(null, Integer.parseInt(this.jProdIndex.getText()) );
        this.jProdNom.setEditable(false);
        this.jProdPreu.setEditable(false);
        this.jProdDescompte.setEditable(false);
        this.jProdDescripcio.setEditable(false);

        this.jSerNom.setEnabled(false);
        //this.jCatNom.setEditable(false);
        this.jCatNom.setEnabled(false);

        this.jLlocBloc.setEnabled(false);
        this.jLlocPassadis.setEnabled(false);
        this.jLlocLleixa.setEnabled(false);

        this.jProdIndex.setEditable(false);
        
        this.jBtnGuardarProducto.setEnabled(false);
        this.jBtnSubirImg.setEnabled(false);
        
        this.jProdNom.setBackground(Color.lightGray);
        this.jProdPreu.setBackground(Color.lightGray);
        this.jProdDescompte.setBackground(Color.lightGray);
        this.jProdDescripcio.setBackground(Color.lightGray);

        this.jSerNom.setBackground(Color.lightGray);
        this.jCatNom.setBackground(Color.lightGray);

        this.jLlocBloc.setBackground(Color.lightGray);
        this.jLlocPassadis.setBackground(Color.lightGray);
        this.jLlocLleixa.setBackground(Color.lightGray);

        this.jProdIndex.setBackground(Color.gray);
             
    }
    
    public void desactivarCamposStock(){
        this.jStockActual.setEditable(false);
        this.jStockMax.setEditable(false);
        this.jStockMin.setEditable(false);
        this.jEstocNuevo.setEditable(false);

        this.jStockActual.setBackground(Color.lightGray);
        this.jStockMax.setBackground(Color.lightGray);
        this.jStockMin.setBackground(Color.lightGray);
        this.jEstocNuevo.setBackground(Color.lightGray);
    }
  
    public void activarCamposStock(){
        this.jStockMax.setEditable(true);
        this.jStockMin.setEditable(true);

       // this.jStockActual.setBackground(Color.white);
        this.jStockMax.setBackground(Color.white);
        this.jStockMin.setBackground(Color.white);
    }
    
    public void activarCamposProducto(){
        this.jProdNom.setEditable(true);
        this.jProdPreu.setEditable(true);
        this.jProdDescompte.setEditable(true);
        this.jProdDescripcio.setEditable(true);

        this.jSerNom.setEnabled(true);
        this.jCatNom.setEnabled(true);

        this.jLlocBloc.setEnabled(true);
        this.jLlocPassadis.setEnabled(true);
        this.jLlocLleixa.setEnabled(true);

        this.jBtnGuardarProducto.setEnabled(true);
        this.jProdNom.setBackground(Color.white);
        this.jProdPreu.setBackground(Color.white);
        this.jProdDescompte.setBackground(Color.white);
        this.jProdDescripcio.setBackground(Color.white);

        this.jSerNom.setBackground(Color.white);
        this.jCatNom.setBackground(Color.white);

        this.jLlocBloc.setBackground(Color.white);
        this.jLlocPassadis.setBackground(Color.white);
        this.jLlocLleixa.setBackground(Color.white);

        this.jProdIndex.setBackground(Color.white);
    }
    
    //Sumar Stock
    private void sumarStock(int nuevo_stock){
        //hacer logica aqui
        //JOptionPane.showMessageDialog(null, num);
        int stock_actual = Integer.parseInt(this.jStockActual.getText());
        int stock_max = Integer.parseInt(this.jStockMax.getText());
        if((stock_actual + nuevo_stock) > stock_max){
            JOptionPane.showMessageDialog(null, "No caben tantas unidades!");
        }else if( nuevo_stock < 0){
            JOptionPane.showMessageDialog(null, "No sumes numeros negativos porfi, besis!");
        }else{
            // se hace la query
            int id = Integer.parseInt(this.jProdIndex.getText());
            eDAO.sumarStock((stock_actual + nuevo_stock), id);
            refrescar(id);
        }
    }
    
    //Restar Stock
    private void restarStock(int nuevo_stock){
        //hacer logica aqui
        int stock_actual = Integer.parseInt(this.jStockActual.getText());
        int stock_min = Integer.parseInt(this.jStockMin.getText());
        if((stock_actual - nuevo_stock) < 0){
            JOptionPane.showMessageDialog(null, "No hay tantas unidades!");
        }else if((stock_actual - nuevo_stock) > 0 && (stock_actual - nuevo_stock) < stock_min){
            JOptionPane.showMessageDialog(null, "Has bajado del mínimo de unidades!");
        }else if(nuevo_stock < 0){
            JOptionPane.showMessageDialog(null, "No metas números negativos!");
        }else{
            // se hace la query
            int id = Integer.parseInt(this.jProdIndex.getText());
            eDAO.restarStock((stock_actual - nuevo_stock), id);
            refrescar(id);
        }
    }
    
    private void setDesplegableSerie(int id){
       // catArray.clear();
       serArray.clear();
       
      //borrar los antiguos registros del select
      
        jSerNom.removeAllItems();
        serie.getAllSeries(serArray, jSerNom, id);
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jFCProd = new javax.swing.JFileChooser();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaProducto = new javax.swing.JTable();
        jProdNom = new javax.swing.JTextField();
        jProdPreu = new javax.swing.JTextField();
        jProdDescompte = new javax.swing.JTextField();
        jProdIndex = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jStockMax = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jStockActual = new javax.swing.JTextField();
        jStockMin = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jProdDescripcio = new javax.swing.JTextArea();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jProdImagen = new javax.swing.JLabel();
        jPrimero = new javax.swing.JButton();
        jAnterior = new javax.swing.JButton();
        jSiguiente = new javax.swing.JButton();
        jUltimo = new javax.swing.JButton();
        jBtnStock = new javax.swing.JButton();
        jBtnModificarProducto = new javax.swing.JButton();
        jBtnUpdateStock = new javax.swing.JButton();
        jBtnGuardarProducto = new javax.swing.JButton();
        jBtnSumarStock = new javax.swing.JButton();
        jBtnRestarStock = new javax.swing.JButton();
        jEstocNuevo = new javax.swing.JTextField();
        jBtnModificarCantidad = new javax.swing.JButton();
        jCatNom = new javax.swing.JComboBox<>();
        jSerNom = new javax.swing.JComboBox<>();
        jLlocBloc = new javax.swing.JComboBox<>();
        jLlocPassadis = new javax.swing.JComboBox<>();
        jLlocLleixa = new javax.swing.JComboBox<>();
        jCrearProducto = new javax.swing.JButton();
        jGuardarProducto = new javax.swing.JButton();
        jBtnSubirImg = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuVerUsuarios = new javax.swing.JMenuItem();
        jMenuCrearUsuarios = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuVerProductos = new javax.swing.JMenuItem();
        jMenuVerCategorias = new javax.swing.JMenuItem();
        ofertasBtn = new javax.swing.JMenu();
        jMenuVerOfertas = new javax.swing.JMenuItem();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        pedidosBtn = new javax.swing.JMenu();
        jMenuCrearPedido = new javax.swing.JMenuItem();

        jMenu3.setText("File");
        jMenuBar2.add(jMenu3);

        jMenu4.setText("Edit");
        jMenuBar2.add(jMenu4);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tablaProducto.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        tablaProducto.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tablaProductoMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tablaProducto);

        jProdIndex.setText("0");
        jProdIndex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jProdIndexActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel1.setText("PRODUCTE:");

        jLabel2.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel2.setText("PREU:");

        jLabel4.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel4.setText("DESCOMPTE:");

        jLabel5.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel5.setText("DESCRIPCIÓ:");

        jLabel3.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel3.setText("SERIE:");

        jStockMax.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jStockMaxActionPerformed(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel6.setText("CATEGORIA:");

        jLabel7.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel7.setText("STOCK MAX:");

        jLabel8.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel8.setText("STOCK ACTUAL:");

        jStockActual.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jStockActualActionPerformed(evt);
            }
        });

        jStockMin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jStockMinActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel9.setText("STOCK MIN:");

        jProdDescripcio.setColumns(20);
        jProdDescripcio.setRows(5);
        jScrollPane2.setViewportView(jProdDescripcio);

        jLabel10.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel10.setText("PASSADIS:");

        jLabel11.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel11.setText("LLOC:");

        jLabel12.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel12.setText("LLEIXA:");

        jProdImagen.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jPrimero.setText("Primero");
        jPrimero.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jPrimeroActionPerformed(evt);
            }
        });

        jAnterior.setText("Anterior");
        jAnterior.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jAnteriorActionPerformed(evt);
            }
        });

        jSiguiente.setText("Siguiente");
        jSiguiente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jSiguienteActionPerformed(evt);
            }
        });

        jUltimo.setText("Ultimo");
        jUltimo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUltimoActionPerformed(evt);
            }
        });

        jBtnStock.setText("MODIFICAR CAPACIDAD");
        jBtnStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnStockActionPerformed(evt);
            }
        });

        jBtnModificarProducto.setText("MODIFICAR PRODUCTO");
        jBtnModificarProducto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnModificarProductoActionPerformed(evt);
            }
        });

        jBtnUpdateStock.setText("GUARDAR STOCK");
        jBtnUpdateStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnUpdateStockActionPerformed(evt);
            }
        });

        jBtnGuardarProducto.setText("GUARDAR PRODUCTO");
        jBtnGuardarProducto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnGuardarProductoActionPerformed(evt);
            }
        });

        jBtnSumarStock.setText("+");
        jBtnSumarStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnSumarStockActionPerformed(evt);
            }
        });

        jBtnRestarStock.setText("-");
        jBtnRestarStock.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnRestarStockActionPerformed(evt);
            }
        });

        jEstocNuevo.setText("0");

        jBtnModificarCantidad.setText("MODIFICAR CANTIDAD");
        jBtnModificarCantidad.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnModificarCantidadActionPerformed(evt);
            }
        });

        jCatNom.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCatNomActionPerformed(evt);
            }
        });

        jSerNom.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jSerNomActionPerformed(evt);
            }
        });

        jLlocBloc.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Bloc 1", "Bloc 2", "Bloc3", "Bloc 4", "Bloc 5", "Bloc 6", "Bloc 7", "Bloc 8" }));

        jLlocPassadis.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "passadis 1", "passadis 2", "passadis 3", "passadis 4", "passadis 5", "passadis 6", "passadis 7", "passadis 8", "passadis 9", "passadis 10", "passadis 11", "passadis 12" }));

        jLlocLleixa.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "lleixa 1", "lleixa 2", "lleixa 3", "lleixa 4", "lleixa 5", "lleixa 6", "lleixa 7", "lleixa 8" }));

        jCrearProducto.setText("CREAR PRODUCTO");
        jCrearProducto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCrearProductoActionPerformed(evt);
            }
        });

        jGuardarProducto.setText("GUARDAR");
        jGuardarProducto.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jGuardarProductoActionPerformed(evt);
            }
        });

        jBtnSubirImg.setText("Subir Imagen");
        jBtnSubirImg.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBtnSubirImgActionPerformed(evt);
            }
        });

        jMenu1.setText("Usuarios");

        jMenuVerUsuarios.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_M, java.awt.event.InputEvent.SHIFT_MASK));
        jMenuVerUsuarios.setText("Ver Todos");
        jMenuVerUsuarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuVerUsuariosActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuVerUsuarios);

        jMenuCrearUsuarios.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_N, java.awt.event.InputEvent.SHIFT_MASK));
        jMenuCrearUsuarios.setText("Crear");
        jMenuCrearUsuarios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuCrearUsuariosActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuCrearUsuarios);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Productos");

        jMenuVerProductos.setText("Ver Todos");
        jMenuVerProductos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuVerProductosActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuVerProductos);

        jMenuVerCategorias.setText("Buscar por Categoria");
        jMenuVerCategorias.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuVerCategoriasActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuVerCategorias);

        jMenuBar1.add(jMenu2);

        ofertasBtn.setText("Ofertas");

        jMenuVerOfertas.setText("Ver Todas");
        jMenuVerOfertas.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuVerOfertasActionPerformed(evt);
            }
        });
        ofertasBtn.add(jMenuVerOfertas);

        jMenuItem1.setText("desde -50%");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem1ActionPerformed(evt);
            }
        });
        ofertasBtn.add(jMenuItem1);

        jMenuItem2.setText("desde -25%");
        jMenuItem2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem2ActionPerformed(evt);
            }
        });
        ofertasBtn.add(jMenuItem2);

        jMenuItem3.setText("desde -1%");
        jMenuItem3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem3ActionPerformed(evt);
            }
        });
        ofertasBtn.add(jMenuItem3);

        jMenuBar1.add(ofertasBtn);

        pedidosBtn.setText("Pedidos");

        jMenuCrearPedido.setText("Crear Pedido");
        jMenuCrearPedido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuCrearPedidoActionPerformed(evt);
            }
        });
        pedidosBtn.add(jMenuCrearPedido);

        jMenuBar1.add(pedidosBtn);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(83, 83, 83)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jProdPreu)
                                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jProdNom)
                                        .addComponent(jProdDescompte, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE)
                                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGroup(layout.createSequentialGroup()
                                            .addGap(22, 22, 22)
                                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                                .addComponent(jBtnGuardarProducto, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addComponent(jBtnModificarProducto, javax.swing.GroupLayout.Alignment.LEADING)))
                                        .addComponent(jCatNom, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                    .addComponent(jSerNom, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(22, 22, 22)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLlocBloc, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(43, 43, 43)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(69, 69, 69))
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLlocPassadis, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .addGap(48, 48, 48)))
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLlocLleixa, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(77, 77, 77)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                .addGroup(layout.createSequentialGroup()
                                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                            .addComponent(jStockMin, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jStockMax, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                            .addComponent(jStockActual)
                                                            .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addComponent(jBtnStock, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jBtnUpdateStock, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                        .addComponent(jBtnModificarCantidad, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                                .addGroup(layout.createSequentialGroup()
                                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                                        .addGroup(layout.createSequentialGroup()
                                                            .addComponent(jBtnRestarStock)
                                                            .addGap(18, 18, 18)
                                                            .addComponent(jEstocNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                            .addComponent(jBtnSumarStock))
                                                        .addComponent(jBtnSubirImg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                    .addComponent(jProdImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)))
                                            .addGroup(layout.createSequentialGroup()
                                                .addComponent(jGuardarProducto)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                                .addComponent(jCrearProducto, javax.swing.GroupLayout.PREFERRED_SIZE, 290, javax.swing.GroupLayout.PREFERRED_SIZE)))))))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 90, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 671, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 671, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(70, 70, 70))
            .addGroup(layout.createSequentialGroup()
                .addGap(197, 197, 197)
                .addComponent(jPrimero)
                .addGap(43, 43, 43)
                .addComponent(jAnterior)
                .addGap(42, 42, 42)
                .addComponent(jProdIndex, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42)
                .addComponent(jSiguiente)
                .addGap(43, 43, 43)
                .addComponent(jUltimo)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 546, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 126, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(70, 70, 70))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(86, 86, 86)
                        .addComponent(jBtnModificarProducto)
                        .addGap(18, 18, 18)
                        .addComponent(jBtnGuardarProducto)
                        .addGap(29, 29, 29)
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jProdNom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)
                        .addGap(4, 4, 4)
                        .addComponent(jProdPreu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel4)
                        .addGap(5, 5, 5)
                        .addComponent(jProdDescompte, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel6)
                        .addGap(18, 18, 18)
                        .addComponent(jCatNom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel3)
                        .addGap(18, 18, 18)
                        .addComponent(jSerNom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(51, 51, 51)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jLabel12)
                            .addComponent(jLabel11)))
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jProdImagen, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(123, 123, 123)
                                .addComponent(jBtnSubirImg)
                                .addGap(27, 27, 27)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jEstocNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jBtnRestarStock))
                                    .addComponent(jBtnSumarStock, javax.swing.GroupLayout.Alignment.TRAILING))))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel8)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(jStockActual, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jBtnModificarCantidad))
                                .addGap(18, 18, 18)
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jStockMax, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jStockMin, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                        .addComponent(jLabel9)
                                        .addGap(27, 27, 27))))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jBtnStock)
                                .addGap(46, 46, 46)
                                .addComponent(jBtnUpdateStock)))
                        .addGap(71, 71, 71)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jCrearProducto, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jGuardarProducto, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(19, 19, 19)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLlocBloc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLlocPassadis, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLlocLleixa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(157, 157, 157)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jProdIndex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jPrimero)
                    .addComponent(jAnterior)
                    .addComponent(jSiguiente)
                    .addComponent(jUltimo))
                .addGap(38, 38, 38))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    //CLICKS DE LA TABLA CON EL ID
    private void tablaProductoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tablaProductoMouseClicked

        int i=tablaProducto.getSelectedRow()+1;
        refrescar(i);
        desactivarCamposProducto();
        desactivarCamposStock();
        activarDesactivarFlechas();
        activarTodo();
    }//GEN-LAST:event_tablaProductoMouseClicked

    private void jStockMaxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockMaxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockMaxActionPerformed

    private void jStockActualActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockActualActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockActualActionPerformed

    private void jStockMinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockMinActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockMinActionPerformed

    private void jMenuVerUsuariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuVerUsuariosActionPerformed
        // TODO add your handling code here:
        openUsuarios();
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Vista.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.dispose();
    }//GEN-LAST:event_jMenuVerUsuariosActionPerformed

    private void jMenuCrearUsuariosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuCrearUsuariosActionPerformed
        // TODO add your handling code here:
        openCrearUsu();
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Vista.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.dispose();
    }//GEN-LAST:event_jMenuCrearUsuariosActionPerformed

    private void jMenuVerProductosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuVerProductosActionPerformed
        // TODO add your handling code here:
        openHome();
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Vista.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.dispose();
    }//GEN-LAST:event_jMenuVerProductosActionPerformed

    private void jMenuVerOfertasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuVerOfertasActionPerformed
        // TODO add your handling code here:
        JOptionPane.showMessageDialog(null, "Ops! parece que todavía no hay ofertas");
    }//GEN-LAST:event_jMenuVerOfertasActionPerformed

    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem1ActionPerformed
        // TODO add your handling code here:
        JOptionPane.showMessageDialog(null, "Ops! parece que todavía no hay ofertas");
    }//GEN-LAST:event_jMenuItem1ActionPerformed

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem2ActionPerformed
        // TODO add your handling code here:
        JOptionPane.showMessageDialog(null, "Ops! parece que todavía no hay ofertas");
    }//GEN-LAST:event_jMenuItem2ActionPerformed

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem3ActionPerformed
        // TODO add your handling code here:
        JOptionPane.showMessageDialog(null, "Ops! parece que todavía no hay ofertas");
    }//GEN-LAST:event_jMenuItem3ActionPerformed

    private void jMenuCrearPedidoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuCrearPedidoActionPerformed
        // TODO add your handling code here:
        JOptionPane.showMessageDialog(null, "Ops! parece que estamos en mantenimiento");
    }//GEN-LAST:event_jMenuCrearPedidoActionPerformed

    private void jBtnStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnStockActionPerformed
        // TODO add your handling code here:
        //Ver como hacer para que el primer click desactive campos y el segundo haga el update
        if(Integer.parseInt(this.jProdIndex.getText()) != 0){
            activarCamposStock();
        }
    }//GEN-LAST:event_jBtnStockActionPerformed

    private void jProdIndexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jProdIndexActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_jProdIndexActionPerformed

    private void jBtnModificarProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnModificarProductoActionPerformed
        // TODO add your handling code here:
        if(Integer.parseInt(this.jProdIndex.getText()) != 0){
            activarCamposProducto();
        }else{
            desactivarCamposProducto();
        }
    }//GEN-LAST:event_jBtnModificarProductoActionPerformed

    private void jBtnGuardarProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnGuardarProductoActionPerformed
        // TODO add your handling code here:
        // Guarda la informacion modificada
        boolean error = false;
        
        try {
            if(this.jProdNom.getText().length() > 1 && !(this.jProdNom.getText().equals("")) ){
               modProd.setProducte_nom(this.jProdNom.getText()); 
            }else{
                JOptionPane.showMessageDialog(null, "introduce nombre de producto");
                error = true;
            }
        } catch (HeadlessException ex) {
            JOptionPane.showMessageDialog(null, "falla nombre");
        }
        
        
        try {
            if(Double.parseDouble(this.jProdPreu.getText()) > 0 ){
                modProd.setProducte_preu(Double.parseDouble(this.jProdPreu.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "Ponle precio, no somos comunistas");
                error = true;
            }
        } catch (HeadlessException | NumberFormatException ex) {
            JOptionPane.showMessageDialog(null, "Precio vacio");
        }
        
        try {
            if(Integer.parseInt(this.jProdDescompte.getText()) >= 0 && Integer.parseInt(this.jProdDescompte.getText()) < 100){
                modProd.setProducte_descompte(Integer.parseInt(this.jProdDescompte.getText()));
            }else{
                JOptionPane.showMessageDialog(null, "Descuento no válido. introduce entre 1-99%");
                error = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "El descuento ha de ser un número!");
        }
        
        String Serienom = (String)this.jSerNom.getSelectedItem();
        try {
            modProd.setSerie_id(serie.getId(Serienom));
            modProd.setProducte_descripcio(this.jProdDescripcio.getText());
            modProd.setCategoria_id(this.jCatNom.getSelectedIndex());
    //        modProd.setSerie_id(this.jSerNom.getSelectedIndex());
            modProd.setLloc_bloc((String)this.jLlocBloc.getSelectedItem());
            modProd.setLloc_passadis((String)this.jLlocPassadis.getSelectedItem());
            modProd.setLloc_lleixa((String)this.jLlocLleixa.getSelectedItem());
            modProd.setProducte_id(Integer.parseInt(this.jProdIndex.getText()));
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al dar valores");
        }
       // JOptionPane.showMessageDialog(null, modProd.getProducte_preu());
        if(error == false){
            modProd.updateProd(modProd); 
            JOptionPane.showMessageDialog(null, "Producto actualizado!");
            desactivarCamposProducto();
            cargarTabla();
        }
             
    }//GEN-LAST:event_jBtnGuardarProductoActionPerformed

    //UPDATE STOCK
    private void jBtnUpdateStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnUpdateStockActionPerformed
        // TODO add your handling code here:
        // añadir botones con funciones de sumar y restar. solo estan operativos cuando el resto no lo esta
        Boolean control = true;
        try {
            int estoc_max = Integer.parseInt(this.jStockMax.getText());
            int estoc_min = Integer.parseInt(this.jStockMin.getText());
            if(estoc_max < estoc_min && estoc_min > 0){
                control = false;
                JOptionPane.showMessageDialog(null, "Por favor, introduce números válidos");
            }
            
            if(control){
                //JOptionPane.showMessageDialog(null, "todo ok");
                int id = Integer.parseInt(this.jProdIndex.getText());
                eDAO.modificarStockMax(id, estoc_max);
                eDAO.modificarStockMin(id, estoc_min);
                desactivarCamposStock();
                refrescar(id);
                JOptionPane.showMessageDialog(null, "Stock modificado!");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Has de introducir números!");
            control = false;
        }   
        
    }//GEN-LAST:event_jBtnUpdateStockActionPerformed

    private void jBtnSumarStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnSumarStockActionPerformed
        // TODO add your handling code here:
        //JOptionPane.showMessageDialog(null, "entro");
        int nuevoStock = 0;
        try {
             nuevoStock = Integer.parseInt(this.jEstocNuevo.getText());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Por favor, introduce números válidos");
            //System.exit(0);
        }
       
        if( nuevoStock != 0){
            //JOptionPane.showMessageDialog(null, "se hace la operacion");
            sumarStock(Integer.parseInt(this.jEstocNuevo.getText()));
            this.jEstocNuevo.setEditable(false);
            this.jEstocNuevo.setBackground(Color.lightGray);
            this.jEstocNuevo.setText("0");
        }
        
    }//GEN-LAST:event_jBtnSumarStockActionPerformed

    private void jBtnRestarStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnRestarStockActionPerformed
        // TODO add your handling code here:
        int nuevoStock = 0;
        try {
            nuevoStock = Integer.parseInt(this.jEstocNuevo.getText());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Por favor, introduce números válidos");
        }
        
        if( nuevoStock != 0){
            //JOptionPane.showMessageDialog(null, "se hace la operacion");
            restarStock(Integer.parseInt(this.jEstocNuevo.getText()));
            this.jEstocNuevo.setEditable(false);
            this.jEstocNuevo.setBackground(Color.lightGray);
            this.jEstocNuevo.setText("0");
        }
    }//GEN-LAST:event_jBtnRestarStockActionPerformed

    private void jBtnModificarCantidadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnModificarCantidadActionPerformed
        // TODO add your handling code here:
        if(Integer.parseInt(this.jProdIndex.getText()) != 0){
            this.jEstocNuevo.setEditable(true);
            this.jEstocNuevo.setBackground(Color.white);
            
        }else{
            this.jEstocNuevo.setEditable(false);
            this.jEstocNuevo.setBackground(Color.lightGray);
            
        }
    }//GEN-LAST:event_jBtnModificarCantidadActionPerformed

    private void jMenuVerCategoriasActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuVerCategoriasActionPerformed
        // TODO add your handling code here:
        openCategoria();
        try {
            cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Vista.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.dispose();
    }//GEN-LAST:event_jMenuVerCategoriasActionPerformed

    private void jCatNomActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCatNomActionPerformed
        // TODO add your handling code here:
        //hacer el desplegable de categoria
       int i= this.jCatNom.getSelectedIndex();
       setDesplegableSerie(i+1);
    }//GEN-LAST:event_jCatNomActionPerformed

    private void jCrearProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCrearProductoActionPerformed
        // TODO add your handling code here:
        activarCamposProducto();
        activarCamposStock();
        limpiarCampos();
        desactivarTodo();
        this.jGuardarProducto.setEnabled(true);
        this.jBtnSubirImg.setEnabled(true);
    }//GEN-LAST:event_jCrearProductoActionPerformed

    private void jGuardarProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jGuardarProductoActionPerformed
        // TODO add your handling code here:
        guardarNuevoProducto();
    }//GEN-LAST:event_jGuardarProductoActionPerformed

    private void jAnteriorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jAnteriorActionPerformed
        // TODO add your handling code here:
        i = Integer.parseInt(this.jProdIndex.getText());
        if((i-1) > 0){
            refrescar(i-1);
        }
        activarDesactivarFlechas();
    }//GEN-LAST:event_jAnteriorActionPerformed

    private void jPrimeroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPrimeroActionPerformed
        // TODO add your handling code here:
        i= 1;
        refrescar(i);
        activarDesactivarFlechas();
                
    }//GEN-LAST:event_jPrimeroActionPerformed

    private void jSiguienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jSiguienteActionPerformed
        // TODO add your handling code here:
        i = Integer.parseInt(this.jProdIndex.getText());
        i++;
        //JOptionPane.showMessageDialog(null, i);
        if(i <= infoProducto.size() ){
            refrescar(i);
        }
        activarDesactivarFlechas();
    }//GEN-LAST:event_jSiguienteActionPerformed

    private void jUltimoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUltimoActionPerformed
        i = infoProducto.size();
        //JOptionPane.showMessageDialog(null, i);
        refrescar(i);
        activarDesactivarFlechas();
    }//GEN-LAST:event_jUltimoActionPerformed

    private void jSerNomActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jSerNomActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jSerNomActionPerformed

    private void jBtnSubirImgActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnSubirImgActionPerformed
        // TODO add your handling code here:
        JFileChooser chooser = new JFileChooser();
        chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
        int res = chooser.showOpenDialog(Home.this);
        if(res == JFileChooser.APPROVE_OPTION)
        {
           file = chooser.getSelectedFile();
           String path = file.getAbsolutePath();
           ImageIcon image = new ImageIcon(file.getAbsolutePath());
           Rectangle rec = jProdImagen.getBounds();
           Image scaledimage = image.getImage().getScaledInstance(rec.width, rec.height, Image.SCALE_SMOOTH);
           image = new ImageIcon(scaledimage);
           jProdImagen.setIcon(image);
           //imagename.setText(file.getName());    yo no tengo nombre
        }else{
            JOptionPane.showMessageDialog(null, "No se ha podido guardar la imagen");
        }
    }//GEN-LAST:event_jBtnSubirImgActionPerformed

    
        
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Home.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> {
            new Home(null).setVisible(true);
        });
    }
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jAnterior;
    private javax.swing.JButton jBtnGuardarProducto;
    private javax.swing.JButton jBtnModificarCantidad;
    private javax.swing.JButton jBtnModificarProducto;
    private javax.swing.JButton jBtnRestarStock;
    private javax.swing.JButton jBtnStock;
    private javax.swing.JButton jBtnSubirImg;
    private javax.swing.JButton jBtnSumarStock;
    private javax.swing.JButton jBtnUpdateStock;
    private javax.swing.JComboBox<String> jCatNom;
    private javax.swing.JButton jCrearProducto;
    private javax.swing.JTextField jEstocNuevo;
    private javax.swing.JFileChooser jFCProd;
    private javax.swing.JButton jGuardarProducto;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JComboBox<String> jLlocBloc;
    private javax.swing.JComboBox<String> jLlocLleixa;
    private javax.swing.JComboBox<String> jLlocPassadis;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuItem jMenuCrearPedido;
    private javax.swing.JMenuItem jMenuCrearUsuarios;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuVerCategorias;
    private javax.swing.JMenuItem jMenuVerOfertas;
    private javax.swing.JMenuItem jMenuVerProductos;
    private javax.swing.JMenuItem jMenuVerUsuarios;
    private javax.swing.JButton jPrimero;
    private javax.swing.JTextField jProdDescompte;
    private javax.swing.JTextArea jProdDescripcio;
    private javax.swing.JLabel jProdImagen;
    private javax.swing.JTextField jProdIndex;
    private javax.swing.JTextField jProdNom;
    private javax.swing.JTextField jProdPreu;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JComboBox<String> jSerNom;
    private javax.swing.JButton jSiguiente;
    private javax.swing.JTextField jStockActual;
    private javax.swing.JTextField jStockMax;
    private javax.swing.JTextField jStockMin;
    private javax.swing.JButton jUltimo;
    private javax.swing.JMenu ofertasBtn;
    private javax.swing.JMenu pedidosBtn;
    private javax.swing.JTable tablaProducto;
    // End of variables declaration//GEN-END:variables
}
