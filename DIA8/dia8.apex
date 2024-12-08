// 8. **Filtro de niños buenos**: *Escribe un método que reciba una lista de contactos y devuelva solo aquellos que tengan el campo Buen_Comportamiento__c marcado como verdadero.*

// Pista:
// - Usa un bucle para recorrer una lista de contactos.
// - Filtra aquellos donde el campo Buen_Comportamiento__c sea verdadero.
// - Devuelve los registros filtrados como una nueva lista o conjunto.

public class ninosBuenos{

    public List<Contact> ninosBuenosFiltrar(List<Contact> ninosAFiltrar){

        List<Contact> ninosFiltrados = new List<Contact>();

        for(Contact con : ninosAFiltrar){
            if(con.Buen_Comportamiento__c == true){
                ninosFiltrados.add(con);
            }
        }

        return ninosFiltrados;
    }
} 