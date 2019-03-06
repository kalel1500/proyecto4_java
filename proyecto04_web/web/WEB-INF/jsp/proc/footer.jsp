<%-- 
    Document   : footer
    Created on : 23-feb-2019, 1:30:01
    Author     : Usuario
--%>

        <footer>

        </footer>
        </section>
        
        <!--Ventana modal-->
        <div id="openModal" class="modal fade in modalDialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a href="javascript:void(0)" title="Close" class="close" onclick="javascript:CloseModal();">X</a>
                        <h2 class="modal-title" id="titulo-error"></h2>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger">
                            <strong>Atencion!</strong> <span id="msg-error"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="CloseModal()">Aceptar</button>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>