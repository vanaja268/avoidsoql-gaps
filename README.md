# sf:AvoidPublicFields — gap validation suite

15 Apex classes in an SFDX project, with a CSV test matrix. Run a baseline CodeScan analysis BEFORE generating fixes. Counts depend on the installed rule version, rule parameters, and exemptions; do not assume every annotated field is a violation.

## Execution
1. Deploy classes to a disposable Salesforce sandbox/scratch org; correct any org-specific compile errors before scanning.
2. Run CodeScan with `sf:AvoidPublicFields` enabled; record violation keys and AI Fix availability.
3. Test APFG01/02/14 invocable annotated fields: check detection, eligibility, and whether any generated code compiles and preserves Flow use.
4. Test APFG03/04/05: `@AuraEnabled` field exemptions vs ordinary field. `@AuraEnabled(cacheable=true)` belongs to methods, not field declarations.
5. For APFG06/07/08, save `JSON.serialize` outputs and run APFG15 tests before and after applying fixes. Compare exact keys, values, and deserialization behavior.
6. For APFG09/10, select exactly 2 public and 2 global violations in bulk. According to the stated updated spec, reject entire batch, 0 queued. Verify UI, assignment API, queue API and job list separately.
7. APFG11/12 are control cases for public vs global eligibility. APFG13 can be rescanned with unit-test suppression parameters.

## Important constraints
- `public String a,b;` / `public Integer x=0,y=10;` were not included: confirm syntax with Apex compiler before using these as test data.
- Invocable-variable support is platform-specific; treat any reported violation/fix as requiring Salesforce deployment validation, not as an automatically confirmed bug.
- These sources and expected results are not prevalidated in a Salesforce org or CodeScan environment.
- APFG15 is an Apex test class and may require the DTO classes to be deployed first; execute via Salesforce Apex test runner.
