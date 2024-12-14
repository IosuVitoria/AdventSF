@isTest
public class TestReasignarTareasNoCompletadas {

    @isTest
    static void testTareasNoCompletadas() {
        User testUser = [SELECT Id FROM User LIMIT 1];

        PackingTask__c tareaCompletada = new PackingTask__c(
            Name = 'Tarea Completada',
            Status__c = 'Completado',
            OwnerId = testUser.Id
        );

        PackingTask__c tareaNoCompletada = new PackingTask__c(
            Name = 'Tarea No Completada',
            Status__c = 'Pendiente',
            OwnerId = testUser.Id
        );

        insert new List<PackingTask__c>{tareaCompletada, tareaNoCompletada};

        Test.startTest();
        Datetime fechaAntigua = Datetime.now().addDays(-3);
        Test.setCreatedDate(tareaCompletada.Id, fechaAntigua);
        Test.setCreatedDate(tareaNoCompletada.Id, fechaAntigua);
        Test.stopTest();

        tareaNoCompletada.Status__c = 'En Proceso';
        tareaCompletada.Status__c = 'En Proceso';

        update new List<PackingTask__c>{tareaCompletada, tareaNoCompletada};

        PackingTask__c tareaActualizada = [SELECT Asignado_A__c FROM PackingTask__c WHERE Id = :tareaNoCompletada.Id];
        System.assertEquals('Empaque Express', tareaActualizada.Asignado_A__c, 'La tarea no completada debería ser reasignada al equipo de Empaque Express.');

        PackingTask__c tareaNoActualizada = [SELECT Asignado_A__c FROM PackingTask__c WHERE Id = :tareaCompletada.Id];
        System.assertNotEquals('Empaque Express', tareaNoActualizada.Asignado_A__c, 'La tarea completada no debería ser reasignada.');
    }
}