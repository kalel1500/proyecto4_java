
import java.awt.Color;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.Categoria;
import model.Conexion;
import model.Estoc;
import model.EstocDAO;
import model.Lloc;
import model.LlocDAO;
import model.ModificarProducto;
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
    
    
    ArrayList<Producto> infoProducto = new ArrayList<Producto>();
    /**
     * Creates new form Home
     */
    public Home(String texto) {
        initComponents();
       // uDAO.getInfoUsuario(infoUsuario);
       // pDAO.getInfoProducto(infoProducto);
        cargarTabla();
        desactivarCamposProducto();
        desactivarCamposStock();
       
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
    
    //Este boton recarga los registros de la BDD al hacer la accion
    public void refrescar(int i){
       Producto infoProducto =  pDAO.recuperarProducto(i);
       Estoc infoEstoc = eDAO.recuperarEstoc(i);
       Lloc infoLloc = lDAO.recuperarLloc(i);
       Serie nomSerie = serie.nomSerie(i);
       Categoria nomCat = cat.nomCategoria(i);
       // this.jtfId.setText(String.valueOf(listapersona.get(i).getId_persona()));
        this.jProdNom.setText(String.valueOf(infoProducto.getProducte_nom()));
        this.jProdPreu.setText(String.valueOf(infoProducto.getProducte_preu()));
        this.jProdDescompte.setText(String.valueOf(infoProducto.getProducte_descompte()));
        this.jProdDescripcio.setText(String.valueOf(infoProducto.getProducte_descripcio()));
        
        this.jSerieNom.setText(String.valueOf(nomSerie.getSerie_nom()));
        this.jCatNom.setText(String.valueOf(nomCat.getCategoria_nom()));
        
        this.jStockActual.setText(String.valueOf(infoEstoc.getEstoc_quantitat()));
        this.jStockMax.setText(String.valueOf(infoEstoc.getEstoc_maxim()));
        this.jStockMin.setText(String.valueOf(infoEstoc.getEstoc_minim()));        
        
        this.jLlocBloc.setText(String.valueOf(infoLloc.getNum_bloc()));
        this.jLlocPassadis.setText(String.valueOf(infoLloc.getNum_passadis()));
        this.jLlocLleixa.setText(String.valueOf(infoLloc.getNum_lleixa()));
        
        this.jProdIndex.setText(String.valueOf(i));
    }
    
    //Bloquea los campos si n hay id seleccionado
    public void desactivarCamposProducto(){
        if(Integer.parseInt(this.jProdIndex.getText()) == 0){
            //JOptionPane.showMessageDialog(null, "Neo esatamos dentro");
            //JOptionPane.showMessageDialog(null, Integer.parseInt(this.jProdIndex.getText()) );
            this.jProdNom.setEditable(false);
            this.jProdPreu.setEditable(false);
            this.jProdDescompte.setEditable(false);
            this.jProdDescripcio.setEditable(false);

            this.jSerieNom.setEditable(false);
            this.jCatNom.setEditable(false);
            
            this.jLlocBloc.setEditable(false);
            this.jLlocPassadis.setEditable(false);
            this.jLlocLleixa.setEditable(false);
            
            this.jProdIndex.setEditable(false);
            this.jProdNom.setBackground(Color.lightGray);
            this.jProdPreu.setBackground(Color.lightGray);
            this.jProdDescompte.setBackground(Color.lightGray);
            this.jProdDescripcio.setBackground(Color.lightGray);

            this.jSerieNom.setBackground(Color.lightGray);
            this.jCatNom.setBackground(Color.lightGray);
            
            this.jLlocBloc.setBackground(Color.lightGray);
            this.jLlocPassadis.setBackground(Color.lightGray);
            this.jLlocLleixa.setBackground(Color.lightGray);
            
            this.jProdIndex.setBackground(Color.gray);
        }else{
            this.jProdNom.setEditable(true);
            this.jProdPreu.setEditable(true);
            this.jProdDescompte.setEditable(true);
            this.jProdDescripcio.setEditable(true);

            this.jSerieNom.setEditable(true);
            this.jCatNom.setEditable(true);
            
            this.jLlocBloc.setEditable(true);
            this.jLlocPassadis.setEditable(true);
            this.jLlocLleixa.setEditable(true);
            
            this.jProdNom.setBackground(Color.white);
            this.jProdPreu.setBackground(Color.white);
            this.jProdDescompte.setBackground(Color.white);
            this.jProdDescripcio.setBackground(Color.white);

            this.jSerieNom.setBackground(Color.white);
            this.jCatNom.setBackground(Color.white);
            
            this.jLlocBloc.setBackground(Color.white);
            this.jLlocPassadis.setBackground(Color.white);
            this.jLlocLleixa.setBackground(Color.white);
            
            this.jProdIndex.setBackground(Color.white);
        }        
    }
    
    public void desactivarCamposStock(){
        if(Integer.parseInt(this.jProdIndex.getText()) == 0){
            this.jStockActual.setEditable(false);
            this.jStockMax.setEditable(false);
            this.jStockMin.setEditable(false);
            this.jEstocNuevo.setEditable(false);
            
            this.jStockActual.setBackground(Color.lightGray);
            this.jStockMax.setBackground(Color.lightGray);
            this.jStockMin.setBackground(Color.lightGray);
            this.jEstocNuevo.setBackground(Color.lightGray);
        }else{
           // this.jStockActual.setEditable(true);
            this.jEstocNuevo.setEditable(true);
            this.jStockMax.setEditable(true);
            this.jStockMin.setEditable(true);
            
           // this.jStockActual.setBackground(Color.white);
            this.jStockMax.setBackground(Color.white);
            this.jStockMin.setBackground(Color.white);
        }
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
        jSerieNom = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jStockMax = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jCatNom1 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jCatNom = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jStockActual = new javax.swing.JTextField();
        jStockMin = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jProdDescripcio = new javax.swing.JTextArea();
        jLlocBloc = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jLlocPassadis = new javax.swing.JTextField();
        jLlocLleixa = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jProdImagen = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jBtnStock = new javax.swing.JButton();
        jBtnModificarProducto = new javax.swing.JButton();
        jBtnUpdateStock = new javax.swing.JButton();
        jBtnGuardarProducto = new javax.swing.JButton();
        jBtnSumarStock = new javax.swing.JButton();
        jBtnRestarStock = new javax.swing.JButton();
        jEstocNuevo = new javax.swing.JTextField();
        jBtnModificarCantidad = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuVerUsuarios = new javax.swing.JMenuItem();
        jMenuCrearUsuarios = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        jMenuVerProductos = new javax.swing.JMenuItem();
        jMenuVerCategorias = new javax.swing.JMenuItem();
        jMenuModificarCategoria = new javax.swing.JMenuItem();
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

        jCatNom.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCatNomActionPerformed(evt);
            }
        });

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

        jLlocBloc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jLlocBlocActionPerformed(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel10.setText("PASSADIS:");

        jLlocPassadis.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jLlocPassadisActionPerformed(evt);
            }
        });

        jLlocLleixa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jLlocLleixaActionPerformed(evt);
            }
        });

        jLabel11.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel11.setText("LLOC:");

        jLabel12.setFont(new java.awt.Font("Tw Cen MT", 1, 18)); // NOI18N
        jLabel12.setText("LLEIXA:");

        jButton1.setText("Primero");

        jButton2.setText("Anterior");

        jButton3.setText("Siguiente");

        jButton4.setText("Ultimo");

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
        jMenu2.add(jMenuVerCategorias);

        jMenuModificarCategoria.setText("Modificar Categoria");
        jMenuModificarCategoria.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuModificarCategoriaActionPerformed(evt);
            }
        });
        jMenu2.add(jMenuModificarCategoria);

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
            .addGroup(layout.createSequentialGroup()
                .addGap(214, 214, 214)
                .addComponent(jButton1)
                .addGap(43, 43, 43)
                .addComponent(jButton2)
                .addGap(42, 42, 42)
                .addComponent(jProdIndex, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42)
                .addComponent(jButton3)
                .addGap(43, 43, 43)
                .addComponent(jButton4)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLlocBloc, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(52, 52, 52)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLlocPassadis, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(57, 57, 57)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLlocLleixa, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(539, 539, 539))
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 671, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jSerieNom, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jCatNom1, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jCatNom, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(jProdPreu)
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jProdNom)
                                .addComponent(jProdDescompte, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(22, 22, 22)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(jBtnGuardarProducto, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(jBtnModificarProducto, javax.swing.GroupLayout.Alignment.LEADING))))
                        .addGap(174, 174, 174)
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
                                    .addComponent(jBtnModificarCantidad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jBtnRestarStock)
                                .addGap(18, 18, 18)
                                .addComponent(jEstocNuevo, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jBtnSumarStock)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jProdImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 200, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 109, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 671, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(35, 35, 35))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(88, 88, 88)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 51, Short.MAX_VALUE)
                                        .addComponent(jProdImagen, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                        .addGap(0, 0, Short.MAX_VALUE)
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
                                .addGap(77, 77, 77))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(22, 22, 22)
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
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jSerieNom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jCatNom1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jLabel12)
                            .addComponent(jLabel11))))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLlocBloc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLlocPassadis, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLlocLleixa, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 56, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jProdIndex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3)
                    .addComponent(jButton4))
                .addGap(35, 35, 35))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    //CLICKS DE LA TABLA CON EL ID
    private void tablaProductoMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tablaProductoMouseClicked

        int i=tablaProducto.getSelectedRow()+1;
        refrescar(i);
//        desactivarCamposProducto();
//        desactivarCamposStock();
    }//GEN-LAST:event_tablaProductoMouseClicked

    private void jStockMaxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockMaxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockMaxActionPerformed

    private void jCatNomActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCatNomActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jCatNomActionPerformed

    private void jStockActualActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockActualActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockActualActionPerformed

    private void jStockMinActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jStockMinActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jStockMinActionPerformed

    private void jLlocBlocActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jLlocBlocActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jLlocBlocActionPerformed

    private void jLlocPassadisActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jLlocPassadisActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jLlocPassadisActionPerformed

    private void jLlocLleixaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jLlocLleixaActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jLlocLleixaActionPerformed

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
        //ir a vista crear usuario
        //set editable false
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

    private void jMenuModificarCategoriaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuModificarCategoriaActionPerformed
        // TODO add your handling code here:
        //abrir un frame con categorias para elegir.
    }//GEN-LAST:event_jMenuModificarCategoriaActionPerformed

    private void jBtnStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnStockActionPerformed
        // TODO add your handling code here:
        desactivarCamposStock();
    }//GEN-LAST:event_jBtnStockActionPerformed

    private void jProdIndexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jProdIndexActionPerformed
        // TODO add your handling code here:
        
    }//GEN-LAST:event_jProdIndexActionPerformed

    private void jBtnModificarProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnModificarProductoActionPerformed
        // TODO add your handling code here:
        if(Integer.parseInt(this.jProdIndex.getText()) != 0){
            desactivarCamposProducto();
        }
    }//GEN-LAST:event_jBtnModificarProductoActionPerformed

    private void jBtnGuardarProductoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnGuardarProductoActionPerformed
        // TODO add your handling code here:
        // Guarda la informacion modificada
        ModificarProducto modProd = new ModificarProducto();
        //se ha creado la clase, falta hacer que categoria y serie sean desplegables porque no se 
        //tiene que poder modificar a mano, por si la categoria no existe y tal. 
               
    }//GEN-LAST:event_jBtnGuardarProductoActionPerformed

    //UPDATE STOCK
    private void jBtnUpdateStockActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBtnUpdateStockActionPerformed
        // TODO add your handling code here:
        // añadir botones con funciones de sumar y restar. solo estan operativos cuando el resto no lo esta
        Boolean control = true;
        try {
            int estoc_max = Integer.parseInt(this.jStockMax.getText());
            int estoc_min = Integer.parseInt(this.jStockMin.getText());
            if(estoc_max < estoc_min || estoc_min < 0){
                control = false;
                JOptionPane.showMessageDialog(null, "Por favor, introduce números válidos");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Has de introducir números!");
            control = false;
        }
                
        if(control){
            JOptionPane.showMessageDialog(null, "todo OK");
            // se puede modificar la base de datos
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
        }{
            // se hace la query
            int id = Integer.parseInt(this.jProdIndex.getText());
            eDAO.restarStock((stock_actual - nuevo_stock), id);
            refrescar(id);
        }
    }
    
    
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
    private javax.swing.JButton jBtnGuardarProducto;
    private javax.swing.JButton jBtnModificarCantidad;
    private javax.swing.JButton jBtnModificarProducto;
    private javax.swing.JButton jBtnRestarStock;
    private javax.swing.JButton jBtnStock;
    private javax.swing.JButton jBtnSumarStock;
    private javax.swing.JButton jBtnUpdateStock;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JTextField jCatNom;
    private javax.swing.JTextField jCatNom1;
    private javax.swing.JTextField jEstocNuevo;
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
    private javax.swing.JTextField jLlocBloc;
    private javax.swing.JTextField jLlocLleixa;
    private javax.swing.JTextField jLlocPassadis;
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
    private javax.swing.JMenuItem jMenuModificarCategoria;
    private javax.swing.JMenuItem jMenuVerCategorias;
    private javax.swing.JMenuItem jMenuVerOfertas;
    private javax.swing.JMenuItem jMenuVerProductos;
    private javax.swing.JMenuItem jMenuVerUsuarios;
    private javax.swing.JTextField jProdDescompte;
    private javax.swing.JTextArea jProdDescripcio;
    private javax.swing.JLabel jProdImagen;
    private javax.swing.JTextField jProdIndex;
    private javax.swing.JTextField jProdNom;
    private javax.swing.JTextField jProdPreu;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextField jSerieNom;
    private javax.swing.JTextField jStockActual;
    private javax.swing.JTextField jStockMax;
    private javax.swing.JTextField jStockMin;
    private javax.swing.JMenu ofertasBtn;
    private javax.swing.JMenu pedidosBtn;
    private javax.swing.JTable tablaProducto;
    // End of variables declaration//GEN-END:variables
}
