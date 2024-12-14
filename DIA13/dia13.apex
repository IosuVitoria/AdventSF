// 13. **Generador de cartas a Santa**: *Desarrolla un método que genere automáticamente un mensaje personalizado basado en la edad y
//  deseos del contacto y lo almacene en un campo Carta_Santa__c.*

//  Pista:
// - Usa concatenación de cadenas (+) para personalizar los mensajes.
// - Incluye datos como Edad__c y Regalo_Deseado__c en la carta.
// - Almacena el mensaje en un campo Texto (Carta_Santa__c).

public class GeneradorCartasSanta {
    public static void generarCartas() {
        List<Contact> contactos = [SELECT Id, Name, Edad__c, Regalo_Deseado__c FROM Contact WHERE Edad__c != null AND Regalo_Deseado__c != null];

        List<Contact> contactosParaActualizar = new List<Contact>();

        for (Contact contacto : contactos) {
            String carta = 'Querido Santa,\n\n';
            carta += 'Mi nombre es ' + contacto.Name + ' y tengo ' + contacto.Edad__c + ' años.\n';
            carta += 'Este año me he portado muy bien y me encantaría recibir ' + contacto.Regalo_Deseado__c + '.\n\n';
            carta += '¡Gracias, Santa!\nCon cariño,\n' + contacto.Name;

            contacto.Carta_Santa__c = carta;
            contactosParaActualizar.add(contacto);
        }

        if (!contactosParaActualizar.isEmpty()) {
            update contactosParaActualizar;
        }
    }
}

