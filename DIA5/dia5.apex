// 5. **Cálculo de distancia de renos**: *Implementa una clase que reciba coordenadas de diferentes ciudades (almacenadas en un objeto personalizado) 
// y calcule la distancia total recorrida por los renos usando una fórmula matemática.*

// **5. Cálculo de distancia de renos**

// Pistas:

// - Utiliza una fórmula sencilla de distancia euclidiana para calcular la diferencia entre las coordenadas de dos ciudades.
// - Implementa un método que acepte las coordenadas de las ciudades como entrada y devuelva la distancia total recorrida.
// - Prueba con datos ficticios para verificar que el cálculo sea correcto. HOY NO HAY TEST JEJEJEJEJE REGALO ADELANTADO DEL DÍA.

public class RutaRenos {
    private List<CityCoordinates> ciudades = new List<CityCoordinates>();

    public class CityCoordinates {
        public Decimal latitud { get; set; }
        public Decimal longitud { get; set; }
        
        public CityCoordinates(Decimal lat, Decimal lon) {
            latitud = lat;
            longitud = lon;
        }
    }

    public void agregarCiudad(Decimal latitud, Decimal longitud) {
        this.ciudades.add(new CityCoordinates(latitud, longitud));
    }


    public Decimal distanciaRecta(Decimal lat1, Decimal lon1, Decimal lat2, Decimal lon2) {
        Decimal deltaLat = lat2 - lat1;
        Decimal deltaLon = lon2 - lon1;

        return Math.sqrt(deltaLat * deltaLat + deltaLon * deltaLon) * 111;
    }

    public Decimal calcularDistanciaTotal() {
        Decimal totalDistance = 0.0;

        for (Integer i = 0; i < this.ciudades.size() - 1; i++) {
            CityCoordinates ciudad1 = this.ciudades[i];
            CityCoordinates ciudad2 = this.ciudades[i + 1];
            totalDistance += distanciaRecta(ciudad1.latitud, ciudad1.longitud, ciudad2.latitud, ciudad2.longitud);
        }

        return totalDistance;
    }
}
