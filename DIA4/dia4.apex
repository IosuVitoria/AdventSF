// 4. **Actualizar estado de pedidos urgentes**: *Escribe un trigger que actualice el campo Estado__c de un pedido a "Urgente" si su fecha de entrega está a menos de 3 días.*

trigger estadoDelPedido on Pedido__c (before update) {
    for (Pedido__c ped : Trigger.new) {
        if (ped.Fecha_de_entrega != null && ped.Fecha_de_entrega < Date.today().addDays(3)) {
            ped.Estado__c = 'Urgente';
        }
    }
}
