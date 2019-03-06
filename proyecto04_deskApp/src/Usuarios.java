
import java.awt.Color;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.Categoria;
import model.Conexion;
import model.Estoc;
import model.Lloc;
import model.Producto;
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
public final class Usuarios extends javax.swing.JFrame {
    UsuarioDAO uDAO = new UsuarioDAO();
    Usuario usuario = new Usuario();
    ArrayList<Usuario> infoUsuario = new ArrayList<Usuario>();
    int i=1;
    String mensaje = "yo vengo de la isla de japon";
    private Conexion con = new Conexion();
    private Connection cn = con.conectar();
    /**
     * Creates new form Usuarios
     */
    public Usuarios() {
        initComponents();
        this.setLocationRelativeTo(null);         
        cargarTabla();
        desactivarTodo();
    }

    
    //HACE LA TABLA
     public DefaultTableModel cargarTabla(){
        DefaultTableModel dmodel=null;
        String cabecera[]={"id","Usuario"};
        uDAO.getListaUsuarios(infoUsuario);
        dmodel=new DefaultTableModel(null,cabecera);
        String campo[]=new String[2];
        for(Usuario u:infoUsuario){
            //campo[0]=p.getId_persona().toString();
            campo[0]=String.valueOf(u.getId_usuario());
            campo[1]=u.getNombre_usuario();
            dmodel.addRow(campo);
        }
        this.tablaUsuarios.setModel(dmodel);
        return dmodel;
    }
     
     //METER DATOS EN LOS CAMPOS
     public void refrescar(int i){
        Usuario infoUsuario = uDAO.recuperarUsuario(i);
       
        this.jUsuNom.setText(String.valueOf(infoUsuario.getNombre_usuario()));
        this.jUsuCognom.setText(String.valueOf(infoUsuario.getApellido_usuario()));
        this.jUsuEmail.setText(String.valueOf(infoUsuario.getEmail_usuario()));
        this.jUsuPassword.setText(String.valueOf(infoUsuario.getPassword_usuario()));
                
        this.jUsuIndex.setText(String.valueOf(i));
    }
     
     private void openHome(){
         java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Home(mensaje).setVisible(true);
            }
        });
    }
    private void openUsuarios(){
        java.awt.EventQueue.invokeLater(() -> {
            new Usuarios().setVisible(true);
        });
    }
    
    private void openCrearUsu(){
        java.awt.EventQueue.invokeLater(() -> {
            new CrearUsu().setVisible(true);
        });
    }
    
    //FLECHAS
    public void activarDesactivarFlechas() {
        uDAO.getListaUsuarios(infoUsuario);
        //JOptionPane.showMessageDialog(null, i);
        if (i == infoUsuario.size() && infoUsuario.size() > 1) {
            activarFlechasAlante(false);
            activarFlechasAtras(true);
        } else if (i == 0 && infoUsuario.size() == 1) {
            activarFlechasAlante(false);
            activarFlechasAtras(false);
        } else if (i == 0 || i == 1) {
            activarFlechasAlante(true);
            activarFlechasAtras(false);
        }else {
            activarFlechasAlante(true);
            activarFlechasAtras(true);
        }
    }
    
    public void activarFlechasAlante(boolean ac) {
        this.jSiguiente.setEnabled(ac);
        this.jUltimo.setEnabled(ac);
    }

    public void activarFlechasAtras(boolean ac) {
        this.jAnterior.setEnabled(ac);
        this.jPrimero.setEnabled(ac);
    }
    
    //BLOQUEAR LOS CAMPOS
    public void desactivarTodo(){
        this.jUsuNom.setEditable(false);
        this.jUsuCognom.setEditable(false);
        this.jUsuEmail.setEditable(false);
        this.jUsuPassword.setEditable(false);
        
        this.jUsuIndex.setEditable(false);
        this.jGuardar.setEnabled(false);
        
        this.jUsuNom.setBackground(Color.lightGray);
        this.jUsuCognom.setBackground(Color.lightGray);
        this.jUsuEmail.setBackground(Color.lightGray);
        this.jUsuPassword.setBackground(Color.lightGray);
        
        this.jUsuIndex.setBackground(Color.lightGray);
        
    }
    
    //DESBLOQUEAR LOS CAMPOS
    public void activarTodo(){
        this.jUsuNom.setEditable(true);
        this.jUsuCognom.setEditable(true);
        this.jUsuEmail.setEditable(true);
        this.jUsuPassword.setEditable(true);
        
        this.jUsuIndex.setEditable(false);
        this.jGuardar.setEnabled(true);
        
        this.jUsuNom.setBackground(Color.white);
        this.jUsuCognom.setBackground(Color.white);
        this.jUsuEmail.setBackground(Color.white);
        this.jUsuPassword.setBackground(Color.white);
        
        this.jUsuIndex.setBackground(Color.white);
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
            java.util.logging.Logger.getLogger(Usuarios.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Usuarios.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Usuarios.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Usuarios.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Usuarios().setVisible(true);
            }
        });
    }
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jFrame1 = new javax.swing.JFrame();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaUsuarios = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jUsuNom = new javax.swing.JTextField();
        jUsuCognom = new javax.swing.JTextField();
        jUsuPassword = new javax.swing.JTextField();
        jUsuEmail = new javax.swing.JTextField();
        jUsuIndex = new javax.swing.JTextField();
        jPrimero = new javax.swing.JButton();
        jAnterior = new javax.swing.JButton();
        jSiguiente = new javax.swing.JButton();
        jUltimo = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jGuardar = new javax.swing.JButton();
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

        javax.swing.GroupLayout jFrame1Layout = new javax.swing.GroupLayout(jFrame1.getContentPane());
        jFrame1.getContentPane().setLayout(jFrame1Layout);
        jFrame1Layout.setHorizontalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jFrame1Layout.setVerticalGroup(
            jFrame1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel1.setText("USUARIOS");

        tablaUsuarios.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tablaUsuariosMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tablaUsuarios);

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel2.setText("Nombre:");

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel3.setText("Apellido:");

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setText("Password:");

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel5.setText("Email:");

        jUsuEmail.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUsuEmailActionPerformed(evt);
            }
        });

        jUsuIndex.setText("0");
        jUsuIndex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jUsuIndexActionPerformed(evt);
            }
        });

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

        jButton1.setText("MODIFICAR");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jGuardar.setText("GUARDAR");
        jGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jGuardarActionPerformed(evt);
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
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(34, 34, 34)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jUsuNom, javax.swing.GroupLayout.PREFERRED_SIZE, 350, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jUsuCognom, javax.swing.GroupLayout.PREFERRED_SIZE, 350, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jUsuEmail, javax.swing.GroupLayout.PREFERRED_SIZE, 350, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(jGuardar)
                                .addComponent(jUsuPassword, javax.swing.GroupLayout.PREFERRED_SIZE, 350, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(155, 155, 155)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 1000, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(121, 121, 121)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 205, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(4, 4, 4)
                        .addComponent(jPrimero)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jAnterior)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jUsuIndex, javax.swing.GroupLayout.PREFERRED_SIZE, 49, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jButton1)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jSiguiente)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jUltimo)))))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(jLabel1)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(78, 78, 78)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jUsuNom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(13, 13, 13)
                        .addComponent(jUsuCognom, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jUsuEmail, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jUsuPassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(85, 85, 85)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButton1)
                            .addComponent(jGuardar))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 35, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 500, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(14, 14, 14)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jUsuIndex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jSiguiente)
                    .addComponent(jUltimo)
                    .addComponent(jPrimero)
                    .addComponent(jAnterior))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

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

    private void jUsuEmailActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUsuEmailActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jUsuEmailActionPerformed

    //CLICKS
    private void tablaUsuariosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tablaUsuariosMouseClicked
        // TODO add your handling code here:
        int i=tablaUsuarios.getSelectedRow()+1;
        
        desactivarTodo();
        refrescar(i);
    }//GEN-LAST:event_tablaUsuariosMouseClicked

    private void jAnteriorActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jAnteriorActionPerformed
         i = Integer.parseInt(this.jUsuIndex.getText());
        if((i-1) > 0){
            refrescar(i-1);
        }
        activarDesactivarFlechas();
    }//GEN-LAST:event_jAnteriorActionPerformed

    private void jUltimoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUltimoActionPerformed
        // TODO add your handling code here:
        i = infoUsuario.size();
        //JOptionPane.showMessageDialog(null, i);
        refrescar(i);
        activarDesactivarFlechas();
    }//GEN-LAST:event_jUltimoActionPerformed

    private void jSiguienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jSiguienteActionPerformed
        // TODO add your handling code here:
        i = Integer.parseInt(this.jUsuIndex.getText());
        
        i++;
        //JOptionPane.showMessageDialog(null, i);
        if(i <= infoUsuario.size() ){
            refrescar(i);
        }
        activarDesactivarFlechas();
    }//GEN-LAST:event_jSiguienteActionPerformed

   
    private void jPrimeroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jPrimeroActionPerformed
        // TODO add your handling code here:
         // TODO add your handling code here:
        i= 1;
        refrescar(i);
        activarDesactivarFlechas();
    }//GEN-LAST:event_jPrimeroActionPerformed

    private void jUsuIndexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jUsuIndexActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jUsuIndexActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        if(Integer.parseInt(this.jUsuIndex.getText()) > 0){
            activarTodo();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jGuardarActionPerformed
        // TODO add your handling code here:
        //Usuario usuario = new Usuario();
        try {
            boolean error = false;
            if(this.jUsuNom.getText().length() > 0){
                usuario.setNombre_usuario(this.jUsuNom.getText());
            }else{
                error = true;
                 JOptionPane.showMessageDialog(null,"El campo nombre no puede estar vacío!");
            }

            if(this.jUsuCognom.getText().length() > 0){
                usuario.setApellido_usuario(this.jUsuCognom.getText());
            }else{
                error = true;
                JOptionPane.showMessageDialog(null, "Campo apellido no puede estar vacío!");
            }

            if(this.jUsuEmail.getText().length() > 0){
                usuario.setEmail_usuario(this.jUsuEmail.getText());
            }else{
                error = true;
                JOptionPane.showMessageDialog(null, "Campo email no puede estar vacío!");
            }

            if(this.jUsuPassword.getText().length() > 0){
                usuario.setPassword_usuario(this.jUsuPassword.getText());
            }else{
                error = true;
                JOptionPane.showMessageDialog(null, "Campo contraseña no puede estar vacío!");
            }
            usuario.setId_usuario(Integer.parseInt(this.jUsuIndex.getText()));

            if(error = false){
                uDAO.modificarUsuario(usuario);
                JOptionPane.showMessageDialog(null,"usuario modificado!");
                refrescar(i);
                cargarTabla();
                desactivarTodo();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
            JOptionPane.showMessageDialog(null, "Ha habido fallos!");
        }   
    }//GEN-LAST:event_jGuardarActionPerformed

    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jAnterior;
    private javax.swing.JButton jButton1;
    private javax.swing.JFrame jFrame1;
    private javax.swing.JButton jGuardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
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
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton jSiguiente;
    private javax.swing.JButton jUltimo;
    private javax.swing.JTextField jUsuCognom;
    private javax.swing.JTextField jUsuEmail;
    private javax.swing.JTextField jUsuIndex;
    private javax.swing.JTextField jUsuNom;
    private javax.swing.JTextField jUsuPassword;
    private javax.swing.JMenu ofertasBtn;
    private javax.swing.JMenu pedidosBtn;
    private javax.swing.JTable tablaUsuarios;
    // End of variables declaration//GEN-END:variables
}
