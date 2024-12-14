@isTest
public class sumandoMagiaTest {

    @isTest
    static void testSumadaMagiaConRegistros() {
        List<Magia_Navideña__c> magiaDePrueba = new List<Magia_Navideña__c>{
            new Magia_Navideña__c(Cantidad__c = 10),
            new Magia_Navideña__c(Cantidad__c = 20),
            new Magia_Navideña__c(Cantidad__c = 30)
        };
        insert magiaDePrueba;

        sumandoMagia sm = new sumandoMagia();
        Decimal total = sm.sumadaMagia();

        System.assertEquals(60, total, 'El total acumulado debería ser 60.');
    }

    @isTest
    static void testSumadaMagiaSinRegistros() {
        delete [SELECT Id FROM Magia_Navideña__c];

        sumandoMagia sm = new sumandoMagia();
        Decimal total = sm.sumadaMagia();

        System.assertEquals(0, total, 'El total acumulado debería ser 0 cuando no hay registros.');
    }
}
