@IsTest
private class APFG13_TestField {
    public String testData;
    public void run() { System.debug(testData); }
    @IsTest static void testMethod() { System.assertEquals(1, 1); }
}
