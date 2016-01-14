public class ContactSearch {
    
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {
        List<Contact> result = new List<Contact>();
        
        for (Contact[] contacts : [SELECT Id 
                                   FROM Contact 
                                   WHERE LastName = :lastName 
                                   AND MailingPostalCode = :mailingPostalCode]) {
                                       result.addAll(contacts);
                                   }
        
        return result;
    }
    
}