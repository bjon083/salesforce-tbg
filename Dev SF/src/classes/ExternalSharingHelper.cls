public class ExternalSharingHelper {
    
    @future
    public static void linkCase(Map<Id,String> caseIdMap) {
        List<String> accountIds = caseIdMap.values();
        List<Account> accountList = [SELECT id, Unique_Account_Id_del__c 
                                     FROM Account 
                                     WHERE Unique_Account_Id_del__c in :accountIds];
        
        Set<Id> caseIds = caseIdMap.keySet();
        List<Case> caseList = [SELECT id, Unique_Case_Account_ID__c 
                               FROM Case 
                               WHERE id in :caseIds];
        
        // Initialize and populate map of unique Account ids to Account sObjects
        Map<String, Account> accountMap = new Map<String, Account>();
        for (Account a: accountList) {
            accountMap.put(a.Unique_Account_Id_del__c, a);
        }       
        
        // Populate Account field of each case
        for (Case c: caseList) {
            c.put('AccountId', accountMap.get(c.Unique_Case_Account_ID__c).id);
        }
        
        database.update(caseList);
    }   
}