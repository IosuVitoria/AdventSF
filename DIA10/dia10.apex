// 10. **Reasignación de tareas no completadas**: Escribe un trigger que reasigne automáticamente cualquier tarea de empaquetado que no 
// se haya completado en 48 horas al equipo de "Empaque Express".

// Pista:
// - Usa un trigger after update para identificar tareas no completadas.
// - Consulta un equipo "Empaque Express" o un campo que represente el nuevo responsable.
// - Actualiza el campo Asignado_A__c con el nuevo responsable. Usa PackaginTask de tareas anteriores.

trigger ReasignarTareasNoCompletadasPack on PackingTask__c (after update) {
    final String nuevoResponsable = 'Empaque Express';
    List<PackingTask__c> tareasAActualizar = new List<PackingTask__c>();

    for (PackingTask__c t : Trigger.new) {
        if (t.Status__c != 'Completado' && Trigger.oldMap.get(t.Id).Status__c != t.Status__c) {
            if (t.CreatedDate != null && DateTime.now().getTime() - t.CreatedDate.getTime() > (48 * 60 * 60 * 1000)) {
                t.Asignado_A__c = nuevoResponsable;
                tareasAActualizar.add(t);
            }
        }
    }

    if (!tareasAActualizar.isEmpty()) {
        try {
            update tareasAActualizar;
        } catch (DmlException e) {
            System.debug('Error al actualizar tareas: ' + e.getMessage());
        }
    }
}