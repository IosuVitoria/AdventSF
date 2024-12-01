// Si quieres que funcione este test. Agrega en el objeto estándar Contact el campo checkbox de nombre Travieso. 

@isTest
public class NavidadContactsTest {
    @isTest
    static void testNinosTraviesos() {
        Contact travieso1 = new Contact(FirstName = 'Juan', LastName = 'Perez', Travieso__c = true);
        Contact travieso2 = new Contact(FirstName = 'Ana', LastName = 'Gomez', Travieso__c = true);
        Contact bueno1 = new Contact(FirstName = 'Luis', LastName = 'Lopez', Travieso__c = false);


        insert new List<Contact>{travieso1, travieso2, bueno1};


        List<Contact> contactos = [
            SELECT Name, Travieso__c 
            FROM Contact
        ];

        Set<String> resultado = NavidadContacts.ninosTraviesos(contactos);

        System.assert(resultado.contains('Juan Perez'), 'El contacto Juan Perez debería estar en la lista de traviesos.');
        System.assert(resultado.contains('Ana Gomez'), 'El contacto Ana Gomez debería estar en la lista de traviesos.');
        System.assert(!resultado.contains('Luis Lopez'), 'El contacto Luis Lopez no debería estar en la lista de traviesos.');
        System.assertEquals(2, resultado.size(), 'El tamaño del conjunto debería ser 2.');
    }
}
