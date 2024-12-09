
// Crear el objeto Entrega_de_regalo__c con el campo Nombre__c y Codigo_Seguimiento__c ambos de tipo STRING.

@isTest
public class TestGenerarCodigoSeguimiento {
    @isTest
    static void testGenerarCodigo() {
        Entrega_de_regalo__c entrega = new Entrega_de_regalo__c(
            Nombre__c = 'Regalo de prueba'
        );

        insert entrega;

        Entrega_de_regalo__c entregaInsertada = [SELECT Id, Codigo_Seguimiento__c FROM Entrega_de_regalo__c WHERE Id = :entrega.Id];

        System.assertNotEquals(null, entregaInsertada.Codigo_Seguimiento__c, 'El código de seguimiento debe estar generado.');
        System.assertNotEquals('', entregaInsertada.Codigo_Seguimiento__c, 'El código de seguimiento no debe estar vacío.');

        System.assert(entregaInsertada.Codigo_Seguimiento__c.length() == 36, 'El código de seguimiento debe tener 36 caracteres (formato UUID).');
    }
}
