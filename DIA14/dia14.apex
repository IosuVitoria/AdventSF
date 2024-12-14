// 14. **Actualización masiva de estado de talleres**: *Crea un método en Apex que actualice todos los talleres en el objeto "Taller__c" con Estado__c = 'Abierto'
//  a "Cerrado" si no tienen pedidos pendientes.*

//  Pista:
// - Usa una consulta SOQL para obtener los talleres con Estado__c = 'Abierto'.
// - Verifica si tienen pedidos pendientes asociados mediante un LEFT JOIN o consulta secundaria.
// - Usa un update para cambiar el estado a "Cerrado".

public class TallerService {
    public static void actualizarEstadoTalleres() {
        List<Taller__c> talleresABiertos = [SELECT Id FROM Taller__c WHERE Estado__c = 'Abierto' AND Id NOT IN (SELECT Taller__c FROM Pedido__c WHERE Estado__c = 'Pendiente')];
        
        for (Taller__c taller : talleresABiertos) {
            taller.Estado__c = 'Cerrado';
        }
        
        update talleresABiertos;
    }
}
