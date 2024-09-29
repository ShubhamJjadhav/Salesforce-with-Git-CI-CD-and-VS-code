public class DisplayCompany {
    @AuraEnabled
    public static List<Company__c> getCompanyDetails()
    {
        List<Company__c> listComp = [SELECT Revenue__c , Name , Location__c FROM Company__c];
        return listComp;
    }

}