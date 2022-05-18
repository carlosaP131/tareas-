package ejemplos;
import java.util.HashMap;
import java.util.Map;
public class Sample_TestMaps { 
	HashMap <String, Object> map = new HashMap <String, Object> ();
	@SuppressWarnings("rawtypes")
	HashMap x = new HashMap (); 
	public static void main(String args[]) {   

        // crear y poblar el hash map     
        HashMap & lt;
        Integer, String & gt;
        map = new HashMap & lt;
        Integer, String & gt;
        ();             
        map.put(1, "Java");    
        map.put(2, "Python");    
        map.put(3, "PHP");    
        map.put(4, "SQL");  
        map.put(5, "C ++");  
        System.out.println("Tutorial en Guru99:" + map);      

        // Eliminar el valor de la clave 5    
        map.remove(5);    
        System.out.println("Tutorial en Guru99 después de Eliminar:" + map);  
    }
	 }