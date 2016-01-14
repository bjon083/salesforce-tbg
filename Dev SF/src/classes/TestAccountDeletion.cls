@isTest
private class TestAccountDeletion {

    @isTest static void TestDeleteAccountWithOneOpportunity() {
        // Test data setup
		// Create one account with one opportunity by calling a utility method
		Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false); // False means it does not allow partial success
        Test.stopTest();
        
        // Verify
        // In this case, the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.',
                           result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestDeleteAccountWithNoOpportunities() {
        // Test data setup
		// Create one account with no opportunities by calling a utility method
		Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false); // False means it does not allow partial success
        Test.stopTest();
        
        // Verify that the deletion was sucessful
        System.assert(result.isSuccess());
    }
    
    @isTest static void TestDeleteBulkAccountsWithOneOpportunity() {
        // Test data setup
		// Create many accounts with one opportunity each by calling a utility method
		Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false); // False means it does not allow partial success
        Test.stopTest();
        
        // Verify for each record.
        // In this case, the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        for (Database.DeleteResult dr : results) {
            System.assert(!dr.isSuccess());
        	System.assert(dr.getErrors().size() > 0);
        	System.assertEquals('Cannot delete account with related opportunities.', 
                                dr.getErrors()[0].getMessage());
        } 
    }
    
    @isTest static void TestDeleteBulkAccountsWithNoOpportunities() {
        // Test data setup
        // Create many accounts with no opportunities by calling a utility method
        Account[] accts = TestDataFactory.createAccountsWithOpps(200, 0);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false); // False means it does not allow partial success
        Test.stopTest();
        
        // Verify for each record that deletion was successful
        for (Database.DeleteResult dr : results) {
            System.assert(dr.isSuccess());
        }
    }
}