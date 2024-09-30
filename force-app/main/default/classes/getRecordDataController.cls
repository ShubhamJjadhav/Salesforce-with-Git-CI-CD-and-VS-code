public with sharing class getRecordDataController {
 //@AuraEnabled is annotation enables LWC to access below apex method
 //(cacheable=true) is for caching the data on client side storage without 
//   waiting for server trips. Which imporves the performance
 @AuraEnabled(cacheable=true)
  public static List <Car__c> getAccounts() {
  return [SELECT Id, Name, Car_Image__c ,Engine__c , Fuel_Type__c ,Mileage__c ,Seating_Capacity__c , 
          Transmission_Type__c ,Total_Cost__c FROM Car__c];
  }
}