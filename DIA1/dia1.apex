// 1. **Verificar lista de traviesos**: *Escribe un método en Apex que recorra una lista de contactos y devuelva un conjunto de nombres de aquellos con el campo Travieso__c 
// marcado como verdadero.*

// Pista:

// - Usa un bucle for para recorrer una lista de contactos.
// - Comprueba el valor del campo Travieso__c.
// - Usa un Set<String> para almacenar los nombres, eliminando duplicados automáticamente.

public class NavidadContacts{
    public static Set<String> ninosTraviesos(List<Contact> contactos){
        Set<String> nombresTraviesos = new Set<String>();
        for(Contact con : contactos){
            if(con.Travieso__c == true){
                nombresTraviesos.add(con.Name);
            }
        }
        return nombresTraviesos;
    }
}