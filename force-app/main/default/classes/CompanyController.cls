public class CompanyController {
@AuraEnabled
   
    public static List<company__c> Getcompany(){
      return [Select Salary__c , OwnerId FROM company__c];  
    }
    
}