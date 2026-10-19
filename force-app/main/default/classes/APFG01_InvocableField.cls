public class APFG01_InvocableField {
    @InvocableVariable(label='Account Name')
    public String accountName;
    @InvocableMethod(label='Inspect Flow Input')
    public static void inspect(List<APFG01_InvocableField> inputs) {
        for (APFG01_InvocableField item : inputs) System.debug(item.accountName);
    }
}
