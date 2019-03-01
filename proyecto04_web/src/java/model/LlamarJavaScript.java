/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author Usuario
 */
public class LlamarJavaScript {

    /**
     * Archivo JavaScript.
     */
    //String path = pageContext.request.contextPath;
    private File SCRIPT = new File("web/js/prueba.js");
    /**
     * Motor de ejecuci&oacute;n JavaScript.
     */
    private ScriptEngine ENGINE = new ScriptEngineManager().
            getEngineByName("javascript");

    public void leerJs() {
        try {
            // Leemos el archivo JavaScript.
            FileReader fr = new FileReader(SCRIPT);

            // Ejecutamos el JavaScript
            Object result = ENGINE.eval(fr);

            // Imprimimos el retorno.
            System.out.println(result);
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ScriptException ex) {
            ex.printStackTrace();
        }
    }
}
