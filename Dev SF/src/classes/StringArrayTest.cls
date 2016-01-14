public class StringArrayTest {
    
    public static String[] generateStringArray (integer length) {
        String[] result = new String[]{};
            String resultEntry;
        
        for (integer i = 0; i < length; i++) {
            resultEntry = 'Test ' + i;
            result.add(resultEntry);
        }
        
        return result;
    }
    
}