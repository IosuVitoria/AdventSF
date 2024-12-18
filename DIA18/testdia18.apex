@isTest
public class TrineoTest {

    @isTest
    static void testCalcularVelocidadPromedio() {
  
        Decimal distancia1 = Decimal.valueOf(120); 
        Decimal tiempo1 = Decimal.valueOf(2); 
        String resultado1 = Trineo.calcularVelocidadPromedio(distancia1, tiempo1);
        System.assertEquals("La velocidad promedio del trineo es: 60.00 km/h", resultado1);

        Decimal distancia2 = Decimal.valueOf(150.5); 
        Decimal tiempo2 = Decimal.valueOf(3.2); 
        String resultado2 = Trineo.calcularVelocidadPromedio(distancia2, tiempo2);
        System.assertEquals("La velocidad promedio del trineo es: 47.03 km/h", resultado2);

        Decimal distancia3 = Decimal.valueOf(100);
        Decimal tiempo3 = Decimal.valueOf(0); 
        String resultado3 = Trineo.calcularVelocidadPromedio(distancia3, tiempo3);
        System.assertEquals("El tiempo no puede ser cero.", resultado3);
    }
}
