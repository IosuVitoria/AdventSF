//OJO: Agrega el campo buen comportamiento a tu objeto contacto para poder realizar el ejercicio.

@IsTest
public class NinosBuenosTest {

    @IsTest
    static void testNinosBuenosFiltrar() {
        List<Contact> contactosDePrueba = new List<Contact>{
            new Contact(LastName = 'Juan', Buen_Comportamiento__c = true),
            new Contact(LastName = 'Maria', Buen_Comportamiento__c = false),
            new Contact(LastName = 'Pedro', Buen_Comportamiento__c = true),
            new Contact(LastName = 'Ana', Buen_Comportamiento__c = false)
        };

        insert contactosDePrueba;

        List<Contact> contactosInsertados = [SELECT Id, LastName, Buen_Comportamiento__c FROM Contact];

        NinosBuenos filtro = new NinosBuenos();
        List<Contact> contactosFiltrados = filtro.ninosBuenosFiltrar(contactosInsertados);

        System.assertEquals(2, contactosFiltrados.size(), 'Debe haber 2 contactos con buen comportamiento');
        System.assert(contactosFiltrados[0].Buen_Comportamiento__c, 'El primer contacto debe tener buen comportamiento');
        System.assert(contactosFiltrados[1].Buen_Comportamiento__c, 'El segundo contacto debe tener buen comportamiento');

        Set<String> nombresEsperados = new Set<String>{'Juan', 'Pedro'};
        for (Contact con : contactosFiltrados) {
            System.assert(nombresEsperados.contains(con.LastName), 'El contacto filtrado no está en la lista esperada');
        }
    }
}
