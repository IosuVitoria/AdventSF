@isTest
public class NotifyDuplicateGiftsTest {
    @isTest
    static void testDuplicateGifts() {
        // Crear un contacto de prueba
        Contact testContact = new Contact(
            LastName = 'Test Contact'
        );
        insert testContact;

        // Crear regalos de prueba
        Gift__c gift1 = new Gift__c(
            Name = 'Regalo A',
            Contact__c = testContact.Id
        );

        Gift__c gift2 = new Gift__c(
            Name = 'Regalo A',
            Contact__c = testContact.Id
        );

        Gift__c gift3 = new Gift__c(
            Name = 'Regalo B', 
            Contact__c = testContact.Id
        );

        insert new List<Gift__c>{gift1, gift2, gift3};

        List<Task> tasks = [SELECT Subject, Description, WhoId FROM Task WHERE WhoId = :testContact.Id];

        System.assertEquals(1, tasks.size(), 'Debe generarse solo una tarea para regalos duplicados');
        System.assertEquals('Alerta: Regalo duplicado detectado', tasks[0].Subject);
        System.assert(tasks[0].Description.contains('Regalo A'), 'La descripción debe contener el nombre del regalo duplicado');
    }
}
