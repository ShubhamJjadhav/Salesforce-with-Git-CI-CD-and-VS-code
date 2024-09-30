public class SampleController {
    
    @AuraEnabled( cacheable=true )  
    public static List < Color__mdt > fetchSampleRecs() {
        
        return [ SELECT Id , Headlight_Type__c FROM Color__mdt ];
        
    }

}