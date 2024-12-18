// 15. **Notificación de regalos duplicados**: *Escribe un trigger que detecte automáticamente cuando un contacto tiene dos o más registros 
// de regalos con el mismo nombre y genere una alerta.*


// Pista:
// - Usa un mapa (Map<String, Integer>) para rastrear regalos repetidos.
// - Al detectar un duplicado, genera un mensaje en el registro o crea una tarea de seguimiento.

trigger NotifyDuplicateGifts on Gift__c (after insert, after update) {
    Map<String, Integer> giftCountMap = new Map<String, Integer>();
    List<Task> tasksToCreate = new List<Task>();

    for (Gift__c gift : Trigger.new) {
        if (gift.Contact__c != null && gift.Name != null) {
            String key = gift.Contact__c + '-' + gift.Name;

            if (giftCountMap.containsKey(key)) {
                giftCountMap.put(key, giftCountMap.get(key) + 1);
            } else {
                giftCountMap.put(key, 1);
            }
        }
    }


    for (String key : giftCountMap.keySet()) {
        if (giftCountMap.get(key) > 1) {
            String[] keyParts = key.split('-');
            Id contactId = Id.valueOf(keyParts[0]);
            String giftName = keyParts[1];


            tasksToCreate.add(new Task(
                Subject = 'Alerta: Regalo duplicado detectado',
                Description = 'El contacto tiene múltiples regalos con el nombre: ' + giftName,
                WhoId = contactId,
                Status = 'Not Started',
                Priority = 'High'
            ));
        }
    }


    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}
