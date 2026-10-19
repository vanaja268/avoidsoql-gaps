public class APFG04_AuraProperty {
    @AuraEnabled public String status { get; set; }
    public void updateStatus() { status = 'Ready'; }
}
