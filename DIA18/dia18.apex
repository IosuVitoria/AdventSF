// 18. **Cálculo de velocidad de entrega del trineo**: *Escribe un método que reciba la distancia total recorrida y el tiempo tomado, y calcule la velocidad promedio del trineo.*

// Pista:
// - Divide la distancia total entre el tiempo total (usa Decimal para precisión).
// - Recibe los valores como parámetros de entrada.
// - Devuelve el resultado en un formato legible.

public class Trineo {

    public static String calcularVelocidadPromedio(Decimal distancia, Decimal tiempo) {
        if (tiempo.compareTo(Decimal.valueOf(0)) == 0) {
            return "El tiempo no puede ser cero.";
        }

        Decimal velocidadPromedio = distancia.divide(tiempo, 2, RoundingMode.HALF_UP);

        return "La velocidad promedio del trineo es: " + velocidadPromedio + " km/h";
    }
}
