public class Controller {
    
      @AuraEnabled( cacheable=true )  
     public static List < Car_Booking__c > GetValues() {
        
         return [ SELECT Id , Choose_Color__c ,Price_For_Color__c , Projector_Type__c , Price_For_Headlight__c ,Need_Any_Customisations__c  FROM Car_Booking__c ];
        
     
				}

}