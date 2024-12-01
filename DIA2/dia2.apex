// 2. **Calculadora de regalos por niño**: *Crea una clase en Apex que reciba una lista de pedidos y calcule cuántos regalos debe entregar 
// Santa a cada contacto, devolviendo un Map<Id, Integer>.*

// Pista:

// - Usa un Map<Id, Integer> para acumular la cantidad de regalos por contacto.
// - Recorre la lista de pedidos y verifica si el contacto ya existe como clave en el mapa.
// - Suma los valores si ya existe; si no, inicializa la clave con el valor del campo Cantidad_Regalos__c.


public class RegalosUtils {
    public static Map<Id, Decimal> calcularRegalosPorContacto(List<Pedido__c> pedidos) {
        Map<Id, Decimal> regalosPorContacto = new Map<Id, Decimal>();
        for (Pedido__c pedido : pedidos) {
            if (regalosPorContacto.containsKey(pedido.Contacto__c)) {
                regalosPorContacto.put(
                    pedido.Contacto__c,
                    regalosPorContacto.get(pedido.Contacto__c) + pedido.Cantidad_Regalos__c
                );
            } else {
                regalosPorContacto.put(pedido.Contacto__c, pedido.Cantidad_Regalos__c);
            }
        }
        return regalosPorContacto;
    }
}


