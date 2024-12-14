@isTest
public class TallerServiceTest {
    @isTest
    static void testActualizarEstadoTalleres() {
        Account cuenta = new Account(Name = 'Cuenta Test');
        insert cuenta;
        
        Taller__c tallerAbierto = new Taller__c(Name = 'Taller Abierto', Estado__c = 'Abierto', Account__c = cuenta);
        insert tallerAbierto;
        
        Pedido__c pedidoPendiente = new Pedido__c(Name = 'Pedido Pendiente', Estado__c = 'Pendiente', Taller__c = tallerAbierto.Id);
        insert pedidoPendiente;
        
        Taller__c tallerCerrado = new Taller__c(Name = 'Taller Cerrado', Estado__c = 'Abierto', Account__c = cuenta);
        insert tallerCerrado;
        
        Test.startTest();
        TallerService.actualizarEstadoTalleres();
        Test.stopTest();
        
        Taller__c tallerActualizado = [SELECT Estado__c FROM Taller__c WHERE Id = :tallerAbierto.Id];
        System.assertEquals('Abierto', tallerActualizado.Estado__c, 'El taller con pedidos pendientes no debe actualizarse.');
        
        Taller__c tallerNoActualizado = [SELECT Estado__c FROM Taller__c WHERE Id = :tallerCerrado.Id];
        System.assertEquals('Cerrado', tallerNoActualizado.Estado__c, 'El taller sin pedidos pendientes debe actualizarse.');
    }
}
