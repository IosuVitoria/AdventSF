// => Objeto Contact:
// - Es un objeto estándar en Salesforce, por lo que no necesitas crearlo.
// - Usado para representar a las personas (niños en este caso).

// => Objeto personalizado Pedido__c:

// Este objeto debe crearse en Salesforce. Representa los pedidos de regalos asignados a un contacto.

// Campos necesarios:
// - Contacto__c (Lookup hacia Contact): Relación entre el pedido y el niño que recibe el regalo.
// - Cantidad_Regalos__c (Number): Cantidad de regalos asignados en este pedido.


@isTest
public class RegalosUtilsTest {
    @isTest
    static void testCalcularRegalosPorContacto() {

        Contact contacto1 = new Contact(FirstName = 'Laura', LastName = 'Martinez');
        Contact contacto2 = new Contact(FirstName = 'Pedro', LastName = 'Sanchez');
        insert new List<Contact>{contacto1, contacto2};

        Pedido__c pedido1 = new Pedido__c(Contacto__c = contacto1.Id, Cantidad_Regalos__c = 3);
        Pedido__c pedido2 = new Pedido__c(Contacto__c = contacto1.Id, Cantidad_Regalos__c = 2);
        Pedido__c pedido3 = new Pedido__c(Contacto__c = contacto2.Id, Cantidad_Regalos__c = 5);
        insert new List<Pedido__c>{pedido1, pedido2, pedido3};

        Map<Id, Decimal> resultado = RegalosUtils.calcularRegalosPorContacto(
            [SELECT Contacto__c, Cantidad_Regalos__c FROM Pedido__c]
        );

        System.assertEquals(5, resultado.get(contacto1.Id), 'El total de regalos para contacto1 debería ser 5.');
        System.assertEquals(5, resultado.get(contacto2.Id), 'El total de regalos para contacto2 debería ser 5.');
        System.assertEquals(2, resultado.size(), 'El mapa debería contener dos contactos.');
    }
}
