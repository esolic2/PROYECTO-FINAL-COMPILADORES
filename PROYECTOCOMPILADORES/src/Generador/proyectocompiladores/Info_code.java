/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompiladores;

/**
 *
 * @author CISCO
 */
public class Info_code {
    public static int linea;
    public static int columna;
    public static String token;
    public static void guardarInfo(int l,int col,String t){
        linea = l;
        columna = col;
        token = t;
        
    }
    
}
