// Agregar al objeto que teníamos en nuestra org Pedido__c los campos Fecha_de_entrega y Estado


@isTest
public class EstadoDelPedidoTest {
    @isTest
    static void testActualizarEstadoUrgente() {
        Pedido__c pedido1 = new Pedido__c(
            Fecha_de_entrega = Date.today().addDays(2),
            Estado__c = 'Pendiente'
        );
        insert pedido1;

        pedido1.Fecha_de_entrega = Date.today().addDays(2);
        update pedido1;

        Pedido__c updatedPedido = [SELECT Estado__c FROM Pedido__c WHERE Id = :pedido1.Id];

        System.assertEquals('Urgente', updatedPedido.Estado__c);
    }

    @isTest
    static void testNoActualizarEstadoUrgente() {
        Pedido__c pedido2 = new Pedido__c(
            Fecha_de_entrega = Date.today().addDays(5),
            Estado__c = 'Pendiente'
        );
        insert pedido2;

        pedido2.Fecha_de_entrega = Date.today().addDays(5);
        update pedido2;

        Pedido__c updatedPedido = [SELECT Estado__c FROM Pedido__c WHERE Id = :pedido2.Id];

        System.assertEquals('Pendiente', updatedPedido.Estado__c);
    }
}
