// 12. **Sumar magia navideña**: *Escribe un método que recorra un objeto personalizado "Magia_Navideña__c" y calcule el total acumulado en todas las regiones.*

// Pista:
// - Usa un bucle para recorrer una lista de registros "Magia_Navideña__c".
// - Acumula el valor del campo Cantidad__c en una variable Integer o Decimal.
// - Devuelve el total.

public class sumandoMagia{

    public Decimal sumadaMagia(){
        List<Magia_Navideña__c> listado = [SELECT Id, Cantidad__c FROM Magia_Navideña__c];
        Decimal total = 0;

        if(listado.isEmpty()){
            return total;
        }

        for(Magia_Navideña__c mag : listado){
            total += mag.Cantidad__c;
        }

        return total;
    }
}