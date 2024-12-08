//Crea un objeto llamado producto con un campo que se llame StoackDisponible que sea del tipo number.

@isTest
public class InventoryManagerTest {
    @isTest
    static void testVerificarYReducirStock_SuficienteStock() {
        Producto__c producto = new Producto__c(Name = 'Juguete', StockDisponible__c = 20);
        insert producto;

        Test.startTest();
        InventoryManager.verificarYReducirStock(producto.Id, 10);
        Test.stopTest();

        Producto__c productoActualizado = [
            SELECT StockDisponible__c
            FROM Producto__c
            WHERE Id = :producto.Id
        ];
        System.assertEquals(10, productoActualizado.StockDisponible__c, 'El stock no se redujo correctamente.');
    }

    @isTest
    static void testVerificarYReducirStock_StockInsuficiente() {
        Producto__c producto = new Producto__c(Name = 'Pelota', StockDisponible__c = 5);
        insert producto;

        Test.startTest();
        try {
            InventoryManager.verificarYReducirStock(producto.Id, 10);
            System.assert(false, 'Se esperaba una excepción por stock insuficiente.');
        } catch (InventoryManager.InventoryException e) {
            System.assert(e.getMessage().contains('No hay suficiente stock disponible'), 'Mensaje de excepción incorrecto.');
        }
        Test.stopTest();
    }

    @isTest
    static void testVerificarYReducirStock_CantidadInvalida() {
        Producto__c producto = new Producto__c(Name = 'Muñeca', StockDisponible__c = 10);
        insert producto;

        Test.startTest();
        try {
            InventoryManager.verificarYReducirStock(producto.Id, -5);
            System.assert(false, 'Se esperaba una excepción por cantidad inválida.');
        } catch (InventoryManager.InventoryException e) {
            System.assert(e.getMessage().contains('La cantidad solicitada debe ser mayor que cero'), 'Mensaje de excepción incorrecto.');
        }
        Test.stopTest();
    }
}
