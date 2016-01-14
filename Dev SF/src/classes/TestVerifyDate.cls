@isTest
public class TestVerifyDate {

    /* Test dates being within 30 days of each other. */
    @isTest static void testDateWithin30Days() {
        Date date1 = Date.newInstance(1991, 10, 13);
        Date date2 = Date.newInstance(1991, 10, 31);
        testResult(date1, date2);
    }
    
    /* Test dates not being within 30 days of each other. */
    @isTest static void testDateOutside30Days() {
        Date date1 = Date.newInstance(2015, 3, 18);
        Date date2 = Date.newInstance(2015, 5, 13);
        testResult(date1, date2);
    }
    
    /* Test second date being in the past. */
    @isTest static void testDate2InPast() {
        Date date1 = Date.newInstance(2015, 5, 18);
        Date date2 = Date.newInstance(2015, 5, 13);
        testResult(date1, date2);
    }
    
    /* Utility method for asserting equals. */
    static void testResult(Date date1, Date date2) {
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);
    }
    
}