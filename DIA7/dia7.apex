// 7. **Control de inventario de regalos**: *Crea un método que, dado un producto y la cantidad solicitada, 
// verifique si hay suficiente stock disponible y reduzca el inventario si es posible.*

// **7. Control de inventario de regalos**

// Pista:
// - Consulta los registros de inventario (objeto Producto__c o similar).
// - Usa un método que reciba un Id de producto y la cantidad solicitada.
// - Si hay suficiente stock, reduce la cantidad. Si no, lanza una excepción.


public class InventoryManager {
    public static void verificarYReducirStock(Id productId, Integer quantity) {
        if (quantity <= 0) {
            throw new InventoryException('La cantidad solicitada debe ser mayor que cero.');
        }

        Producto__c producto = [
            SELECT Id, Name, StockDisponible__c
            FROM Producto__c
            WHERE Id = :productId
            LIMIT 1
        ];

        if (producto.StockDisponible__c < quantity) {
            throw new InventoryException(
                'No hay suficiente stock disponible para el producto: ' + producto.Name +
                '. Disponible: ' + producto.StockDisponible__c +
                ', Solicitado: ' + quantity
            );
        }

        producto.StockDisponible__c -= quantity;
        update producto;
    }


    public class InventoryException extends Exception {}
}
