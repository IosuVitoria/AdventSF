// 3. **Asignación de elfos a tareas**: *Desarrolla un trigger en Apex que asigne automáticamente un "Elfo" (objeto personalizado)
//  a cada registro de "Tarea de Empaque" creado, basado en su disponibilidad.*


// Pista:
// - Consulta una lista de elfos disponibles (Disponible__c = true).
// - Usa un índice (index) para asignar elfos de manera rotativa.
// - Piensa en cómo manejar una lista vacía de elfos o situaciones donde no hay disponibles.


trigger AssignElfOnTaskCreate on PackingTask__c (before insert) {
    List<Elf__c> availableElves = [SELECT Id, Name, LastAssignedDate__c FROM Elf__c WHERE Disponible__c = true ORDER BY LastAssignedDate__c ASC];

    if (availableElves.isEmpty()) {
        for (PackingTask__c task : Trigger.new) {
            task.addError('No hay elfos disponibles para asignar a esta tarea.');
        }
        return;
    }

    Integer elfIndex = 0;

    for (PackingTask__c task : Trigger.new) {
        task.Elf_Assigned__c = availableElves[elfIndex].Id; 
        elfIndex++;
        if (elfIndex >= availableElves.size()) {
            elfIndex = 0; 
        }
    }

    List<Elf__c> updatedElves = new List<Elf__c>();
    for (Elf__c elf : availableElves) {
        elf.LastAssignedDate__c = System.today();
        updatedElves.add(elf);
    }
    update updatedElves;
}