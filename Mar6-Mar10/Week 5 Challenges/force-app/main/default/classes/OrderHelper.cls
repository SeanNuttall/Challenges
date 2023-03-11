public class OrderHelper {
    public static void AddPortableInstallation(List<Order> ordersToAddTo){
        List<OrderItem> installsToInsert = new List<OrderItem>();
        for(Order ord : ordersToAddTo){
            if(!InstallationMissing(ord)){
                OrderItem newInstall = new OrderItem(
                	OrderId = ord.Id,
                    UnitPrice = 5000,
                    Quantity = 1,
                    PricebookEntryId = '01u8b00000NSYpmAAH'
                	);
                installsToInsert.add(newInstall);
            }
        }
        insert installsToInsert;
    }
    
    public static boolean InstallationMissing(Order ord){
        List<OrderItem> ordersWithInstalls = [
            SELECT OrderId FROM OrderItem WHERE Product2Id = '01t8b00000DEVZJAA5' AND CreatedDate = LAST_N_DAYS:1
        ];
        List<String> ordWithInstallIds = new List<String>();
        for(OrderItem ordItem : ordersWithInstalls){
            ordWithInstallIds.add(ordItem.OrderId);
        }
        String orderId = ord.Id;
        boolean needsNoInstall = ordWithInstallIds.contains(orderId);
        return needsNoInstall;
    }
    
    public static void AddDefaultPricebook(List<Order> ordersForPricebooks){
        for(Order ord : ordersForPricebooks){
            ord.Pricebook2Id = '01u8b00000NSYpmAAH';
        }
    }

}