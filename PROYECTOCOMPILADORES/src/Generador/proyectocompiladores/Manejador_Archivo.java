
package proyectocompiladores;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

/**
 *
 * @author wilo
 */
public class Manejador_Archivo {
    
    public ArrayList<String>LeerArchivo (String strFile){
            ArrayList<String> alttext=null;
            FileReader fr = null;
            BufferedReader br = null;
            File ffile=null;
            String strLine = null;
            try {
            alttext =new ArrayList<String>();
            ffile = new File(strFile);
            if(ffile.exists()){
                if(ffile.isFile()){
                    fr = new FileReader(ffile);
                    br = new BufferedReader(fr);
                    strLine = br.readLine();
                    while(strLine!=null)
                    {
                        if(!strLine.equalsIgnoreCase("")){
                            alttext.add(strLine);
                        }
                        strLine=br.readLine();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            return alttext; 
    }
    
}
