@isTest
public class GeneradorCartasSantaTest {

    @isTest
    static void testGenerarCartas() {
        List<Contact> contactosDePrueba = new List<Contact>{
            new Contact(LastName = 'Iribar', Edad__c = 8, Regalo_Deseado__c = 'bizikleta bat'),
            new Contact(LastName = 'Etxeberria', Edad__c = 10, Regalo_Deseado__c = 'mahai-joko bat')
        };
        insert contactosDePrueba;

        Test.startTest();
        GeneradorCartasSanta.generarCartas();
        Test.stopTest();

        List<Contact> contactosActualizados = [SELECT Carta_Santa__c FROM Contact WHERE Id IN :contactosDePrueba];
        System.assertEquals('Querido Santa,\n\nMi nombre es Iribar y tengo 8 años.\nEste año me he portado muy bien y me encantaría recibir bizikleta bat.\n\n¡Gracias, Santa!\nCon cariño,\nIribar', contactosActualizados[0].Carta_Santa__c);
        System.assertEquals('Querido Santa,\n\nMi nombre es Etxeberria y tengo 10 años.\nEste año me he portado muy bien y me encantaría recibir mahai-joko bat.\n\n¡Gracias, Santa!\nCon cariño,\nEtxeberria', contactosActualizados[1].Carta_Santa__c);
    }

    @isTest
    static void testGenerarCartasSinDatos() {
        Contact contactoIncompleto = new Contact(LastName = 'Mendizabal');
        insert contactoIncompleto;

        Test.startTest();
        GeneradorCartasSanta.generarCartas();
        Test.stopTest();

        Contact contactoActualizado = [SELECT Carta_Santa__c FROM Contact WHERE Id = :contactoIncompleto.Id];
        System.assertEquals(null, contactoActualizado.Carta_Santa__c);
    }
}