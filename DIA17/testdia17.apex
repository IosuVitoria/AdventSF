@isTest
public class RankingEficienciaElfosTest {

    @isTest
    static void testCalcularRanking() {
        User elfo1 = new User(FirstName = 'Elfo1', LastName = 'Prueba', Email = 'elfo1@test.com',
            Username = 'elfo1@test.com', Alias = 'elfo1', CommunityNickname = 'Elfo1',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
            TimeZoneSidKey = 'America/New_York', LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8', LanguageLocaleKey = 'en_US');
        insert elfo1;

        User elfo2 = new User(FirstName = 'Elfo2', LastName = 'Prueba', Email = 'elfo2@test.com',
            Username = 'elfo2@test.com', Alias = 'elfo2', CommunityNickname = 'Elfo2',
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
            TimeZoneSidKey = 'America/New_York', LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8', LanguageLocaleKey = 'en_US');
        insert elfo2;


        List<Tarea__c> tareas = new List<Tarea__c>{
            new Tarea__c(ElfoAsignado__c = elfo1.Id),
            new Tarea__c(ElfoAsignado__c = elfo1.Id),
            new Tarea__c(ElfoAsignado__c = elfo2.Id)
        };
        insert tareas;

        List<String> ranking = RankingEficienciaElfos.calcularRanking([SELECT ElfoAsignado__c FROM Tarea__c]);

        System.assertEquals(2, ranking.size(), 'Debe haber dos elfos en el ranking');
        System.assert(ranking[0].contains(elfo1.Id), 'Elfo 1 debe estar en el primer lugar');
        System.assert(ranking[1].contains(elfo2.Id), 'Elfo 2 debe estar en el segundo lugar');
    }
}
