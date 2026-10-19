@IsTest
private class APFG15_JsonConsumer {
    @IsTest static void verifyDto() {
        String raw = '{"customerName":"John","age":25}';
        APFG06_JsonDTO dto = (APFG06_JsonDTO) JSON.deserialize(raw, APFG06_JsonDTO.class);
        System.assertEquals('John', dto.customerName);
        System.assertEquals(25, dto.age);
        Map<String,Object> out = (Map<String,Object>) JSON.deserializeUntyped(JSON.serialize(dto));
        System.assertEquals('John', out.get('customerName'));
        System.assert(out.containsKey('age'));
    }
    @IsTest static void verifyCollections() {
        APFG07_JsonNested dto = new APFG07_JsonNested();
        dto.tags.add('QA'); dto.scores.put('score', 2);
        String jsonText = JSON.serialize(dto);
        Map<String,Object> out = (Map<String,Object>) JSON.deserializeUntyped(jsonText);
        System.assert(out.containsKey('tags'));
        System.assert(out.containsKey('scores'));
    }
    @IsTest static void verifyNullAndBoolean() {
        APFG08_JsonNull dto = (APFG08_JsonNull) JSON.deserialize('{"optionalValue":null,"enabled":true}', APFG08_JsonNull.class);
        System.assertEquals(true, dto.enabled);
        System.assertEquals(null, dto.optionalValue);
    }
}
