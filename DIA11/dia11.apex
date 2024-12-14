// 11. **Sorteo de Navidad**: *Crea un método en Apex que seleccione aleatoriamente un contacto de la base de datos para ganar un premio especial navideño.*

// Pista:
// - Usa el método Math.random() para generar números aleatorios.
// - Consulta una lista de contactos, calcula un índice aleatorio y selecciona al ganador.
// - Asegúrate de manejar listas vacías.

public class SorteoNavidad {
    public static Contact seleccionarGanadorNavidad() {
        List<Contact> contactos = [SELECT Id, Name FROM Contact];

        if (contactos.isEmpty()) {
            System.debug('No hay contactos disponibles para el sorteo.');
            return null;
        }
        Integer indiceAleatorio = (Integer)Math.floor(Math.random() * contactos.size());

        Contact ganador = contactos[indiceAleatorio];
        System.debug('El ganador del sorteo navideño es: ' + ganador.Name);

        return ganador;
    }
}
