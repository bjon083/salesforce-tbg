public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(String s) {
        List<List<sObject>> result = [FIND :s IN NAME FIELDS RETURNING Contact,Lead];
        
        return result;
    }
    
}