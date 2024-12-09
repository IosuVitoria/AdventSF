// 9. **Generar códigos de seguimiento de trineo**: Desarrolla un método que cree automáticamente un código único de seguimiento (UUID) 
// para cada registro de "Entrega de Regalo" al guardarlo.

// Pista:
// - Asegúrate de asignarlo al campo correspondiente en cada registro.
// - Usa un trigger para ejecutarlo automáticamente al crear un registro.

trigger GenerarCodigoSeguimiento on Entrega_de_regalo__c (before insert) {
    for (Entrega_de_regalo__c entrega : Trigger.new) {
        entrega.Codigo_Seguimiento__c = String.valueOf(Math.abs(Crypto.getRandomInteger())) + '-' + Datetime.now().getTime();
    }
}
