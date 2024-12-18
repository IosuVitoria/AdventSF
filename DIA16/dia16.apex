// 16. **Validación de envíos internacionales**: *Desarrolla un método que recorra una lista de pedidos y marque con un campo Internacional__c 
// aquellos cuya dirección de entrega esté fuera del país principal.*

// Pista:
// - Compara el campo País__c del pedido con el país base de operaciones.
// - Marca un campo Internacional__c como verdadero si el país es diferente.
// - Usa una clase para manejar la lógica y un trigger para ejecutarla.

public class Ejercicio16 {

    public static void internationalService(List<Pedidos__c> pedidos) {
        String paisBase = 'España'; 
        
        for (Pedidos__c pedido : pedidos) {
            if (pedido.Pais__c != null && !pedido.Pais__c.equalsIgnoreCase(paisBase)) {
                pedido.Internacional__c = true;
            } else {
                pedido.Internacional__c = false;
            }
        }
    }
}

// Trigger para ejecutar la lógica en el momento adecuado
// trigger PedidosTrigger on Pedidos__c (before insert, before update) {
//     if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
//         Ejercicio16.internationalService(Trigger.new);
//     }
// }
