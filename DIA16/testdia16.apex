@isTest
public class Ejercicio16Test {

    @isTest
    static void testInternationalService() {

        Pedidos__c pedidoLocal = new Pedidos__c(
            Nombre__c = 'Pedido Local',
            Pais__c = 'España'
        );
        
        Pedidos__c pedidoInternacional = new Pedidos__c(
            Nombre__c = 'Pedido Internacional',
            Pais__c = 'Francia'
        );
        
        List<Pedidos__c> pedidos = new List<Pedidos__c>{pedidoLocal, pedidoInternacional};
        insert pedidos;
     
        List<Pedidos__c> result = [SELECT Id, Internacional__c, Pais__c FROM Pedidos__c];
        
        System.assertEquals(false, result[0].Internacional__c, 'El pedido local no debería ser internacional');
        System.assertEquals(true, result[1].Internacional__c, 'El pedido internacional debería ser marcado como internacional');
    }
}
