// Instrucciones extra:

// Objeto Package__c (Personalizado):

// Este objeto representa los paquetes que serán procesados.
// Campos necesarios:
// - Peso__c: Campo numérico (Decimal, 16, 2), obligatorio. Representa el peso del paquete.
// - RenoEspecial__c: Campo de búsqueda (Lookup) relacionado con el objeto RenoEspecial__c. Representa el reno asignado al paquete.


// Objeto RenoEspecial__c (Personalizado):

// Este objeto representa los "Renos Especiales" disponibles.
// Campos necesarios:
// - IsAvailable__c: Campo lógico (Checkbox), obligatorio. Indica si el reno está disponible.
// - Name: Campo estándar. Se usará para identificar al reno.


@isTest
public class giftClassificatorTest {
    @isTest
    static void testGiftClassificator() {
        RenoEspecial__c reno = new RenoEspecial__c(Name = 'Reno 1', IsAvaiable__c = true);
        insert reno;

        Package__c paqueteGrande = new Package__c(Name = 'Paquete Grande', Peso__c = 15);
        Package__c paquetePequeno = new Package__c(Name = 'Paquete Pequeño', Peso__c = 5);

        insert new List<Package__c>{paqueteGrande, paquetePequeno};

        List<Package__c> paquetesInsertados = [
            SELECT Id, Peso__c, RenoEspecial__c
            FROM Package__c
            WHERE Id IN :new Set<Id>{paqueteGrande.Id, paquetePequeno.Id}
        ];


        System.assertNotEquals(null, paquetesInsertados[0].RenoEspecial__c, 'El paquete grande debería tener un Reno asignado.');
        System.assertEquals(null, paquetesInsertados[1].RenoEspecial__c, 'El paquete pequeño no debería tener un Reno asignado.');
    }

    @isTest
    static void testNoAvailableReno() {
        Package__c paqueteGrande = new Package__c(Name = 'Paquete Grande', Peso__c = 15);

        Test.startTest();
        try {
            insert paqueteGrande;
            System.assert(false, 'Se esperaba un error al no haber renos disponibles.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('No hay un "Reno Especial" disponible'), 'Mensaje de error esperado.');
        }
        Test.stopTest();
    }
}
