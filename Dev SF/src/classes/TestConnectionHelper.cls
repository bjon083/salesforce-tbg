@isTest
public class TestConnectionHelper {
    
    @isTest static void testConnection() {
        Id networkId = ConnectionHelper.getConnectionId('Home Use');
        System.debug(networkId);
    }
    
}