@isTest
public class TestAssignElfToPackingTask {
    @isTest
    static void testAssignElf() {
        List<Elf__c> elves = new List<Elf__c>();
        for (Integer i = 1; i <= 3; i++) {
            elves.add(new Elf__c(Name = 'Elf ' + i, Disponible__c = true, LastAssignedDate__c = null));
        }
        insert elves;

        List<PackingTask__c> tasks = new List<PackingTask__c>();
        for (Integer i = 1; i <= 5; i++) {
            tasks.add(new PackingTask__c(Name = 'Task ' + i));
        }
        insert tasks;

        tasks = [SELECT Id, Name, Elf_Assigned__c FROM PackingTask__c];
        System.assert(tasks.size() == 5, 'Debe haber 5 tareas creadas.');

        for (PackingTask__c task : tasks) {
            System.assertNotEquals(task.Elf_Assigned__c, null, 'Cada tarea debe tener un elfo asignado.');
        }

        List<Id> assignedElves = new List<Id>();
        for (PackingTask__c task : tasks) {
            assignedElves.add(task.Elf_Assigned__c);
        }
        System.assertEquals(3, new Set<Id>(assignedElves).size(), 'Los elfos deben asignarse de forma rotativa.');
    }

    @isTest
    static void testNoAvailableElves() {
        PackingTask__c task = new PackingTask__c(Name = 'Task without elves');
        try {
            insert task;
            System.assert(false, 'Debe fallar cuando no hay elfos disponibles.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('No hay elfos disponibles'), 'Debe mostrar un mensaje de error adecuado.');
        }
    }
}
