public class DisplayCompanyController {
    @AuraEnabled
    public static List<Company__c> getCompanyDetails(){
        List<Company__c> listComp=[SELECT id, Name ,Email__c ,Start_Date__c, Salary__c FROM Company__c ];
        
        return listComp;
    }

}