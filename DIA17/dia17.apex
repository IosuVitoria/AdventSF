// *Utiliza un Map<Id, Integer> para almacenar la cantidad de tareas completadas por cada elfo. La clave será el ID del elfo y el valor será el número de tareas.*

// Pista:
// - Consulta los registros completados por cada elfo.
// - Usa un mapa para contar cuántas tareas ha completado cada uno.
// - Ordena los resultados para generar un ranking.


public class RankingEficienciaElfos {

    public static List<String> calcularRanking(List<Tarea__c> tareas) {
        Map<Id, Integer> tareasPorElfo = new Map<Id, Integer>();


        for (Tarea__c tarea : tareas) {
            if (tarea.ElfoAsignado__c != null) {
                tareasPorElfo.put(tarea.ElfoAsignado__c, 
                    tareasPorElfo.get(tarea.ElfoAsignado__c) != null ? tareasPorElfo.get(tarea.ElfoAsignado__c) + 1 : 1
                );
            }
        }

        List<String> ranking = new List<String>();

        for (Id elfoId : tareasPorElfo.keySet()) {
            ranking.add('Elfo: ' + elfoId + ', Tareas: ' + tareasPorElfo.get(elfoId));
        }

        ranking.sort();

        return ranking;
    }
}
