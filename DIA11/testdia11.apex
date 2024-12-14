@isTest
public class SorteoNavidadTest {

    @isTest
    static void testSeleccionarGanadorConContactos() {
        List<Contact> contactosDePrueba = new List<Contact>{
            new Contact(FirstName = 'Juan', LastName = 'Pérez'),
            new Contact(FirstName = 'María', LastName = 'Gómez'),
            new Contact(FirstName = 'Luis', LastName = 'Martínez')
        };
        insert contactosDePrueba;

        Test.startTest();
        Contact ganador = SorteoNavidad.seleccionarGanadorNavidad();
        Test.stopTest();

        System.assertNotEquals(null, ganador, 'El método debería devolver un ganador.');
        System.assert(contactosDePrueba.contains(ganador), 'El ganador debería ser uno de los contactos insertados.');
    }

    @isTest
    static void testSeleccionarGanadorSinContactos() {
        delete [SELECT Id FROM Contact];

        Test.startTest();
        Contact ganador = SorteoNavidad.seleccionarGanadorNavidad();
        Test.stopTest();

        System.assertEquals(null, ganador, 'El método debería devolver null si no hay contactos.');
    }
}