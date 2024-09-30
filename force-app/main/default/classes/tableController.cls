public with sharing class tableController{
    @AuraEnabled(cacheable = true)
   public static List <Car__c> getAccounts(){
       return[ SELECT ID , Name, Engine__c ,Photo__c , Fuel_Type__c, Mileage__c , Seating_Capacity__c
       ,Total_Cost__c , Transmission_Type__c from Car__c ];
   }
}

//Car_Image__c