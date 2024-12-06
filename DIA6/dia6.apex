// 6. **Asignación automática de paquetes grandes**: *Escribe un trigger que asigne automáticamente los paquetes con peso superior a 10 kg a un objeto "Reno Especial" específico.*

// Pista:
// - Usa un trigger before insert para revisar el peso de los paquetes (Peso__c).
// - Consulta los registros de "Reno Especial" y asigna el primero disponible.
// - Asegúrate de manejar correctamente cuando no hay un reno disponible.

trigger giftClassificator on Package__c (before insert){
    List<RenoEspecial__c> renosEspeciales = [SELECT Id, Name, IsAvaiable__c FROM RenoEspecial__c WHERE IsAvaiable__c = true LIMIT 1];

    if(renosEspeciales.isEmpty()){
        for(Package__c pkg : Trigger.new){
            if(pkg.Peso__c > 10){
                pkg.addError('No hay un "Reno Especial" disponible para asignar a este paquete.');
            }
        }
    }else{
        RenoEspecial__c renoAsignado = renosEspeciales[0];
        for(Package__c pkg : Trigger.new){
            if(pkg.Peso__c > 10){
                pkg.RenoEspecial__c = renoAsignado.Id;
            }
        }
    }
}