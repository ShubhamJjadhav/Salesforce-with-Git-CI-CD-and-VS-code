public class SampleController_1 {
    
        @AuraEnabled( cacheable=true )  
     public static List < Record__mdt > GetValues() {
        
         return [ SELECT Id , Headlight_Type__c ,Price_For_Headlight__c , Colour__c , Price_For_Colour__c ,Transmission_Type__c ,Price_for_Transmission__c FROM Record__mdt ];
        
     }

}