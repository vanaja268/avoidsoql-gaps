public class APFG02_InvocableRequired {
    @InvocableVariable(required=true)
    public String requestId;
    @InvocableVariable
    public Integer retryCount;
    @InvocableMethod(label='Inspect Required Input')
    public static void inspect(List<APFG02_InvocableRequired> inputs) {
        for (APFG02_InvocableRequired item : inputs) System.debug(item.requestId);
    }
}
