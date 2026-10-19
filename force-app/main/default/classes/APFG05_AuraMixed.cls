public class APFG05_AuraMixed {
    @AuraEnabled public String exposed;
    public String ordinary;
    public void run() { System.debug(ordinary); }
}
