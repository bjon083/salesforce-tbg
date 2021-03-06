public class ConnectionHelper {

    public static Id getConnectionId(String connectionName) {
    
        List<PartnerNetworkConnection> partnerNetConList =
           [Select id from PartnerNetworkConnection where connectionName = :connectionName];
        
        if ( partnerNetConList.size() != 0 ) {
            return partnerNetConList.get(0).Id;
        }
        
        return null;
    }
    
    public static Id getConnectionOwnerId(String connectionName) {
    
        List<PartnerNetworkConnection> partnerNetConList = 
          [Select createdById from PartnerNetworkConnection where connectionName = :connectionName];
        
        if ( partnerNetConList.size() != 0 ) {
            return partnerNetConList.get(0).createdById;
        }
        
        return null;
    }
}