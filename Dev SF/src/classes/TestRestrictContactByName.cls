@isTest
public class TestRestrictContactByName {

    @isTest static void testInvalidNameContact() {
        List<Contact> contacts = new List<Contact>();
        for (integer i = 0; i < 200; i++) {
            Contact c = new Contact(lastName = 'INVALIDNAME');
            contacts.add(c);
        }
        
        Test.startTest();
        
        try {
            insert contacts;
        } catch(DMLException ex) {
        }
        
        Test.stopTest();
    }
    
}