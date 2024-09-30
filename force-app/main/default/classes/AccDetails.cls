public class AccDetails {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Name, Industry  FROM Account ];
    }    
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT  Name, Industry FROM Account WHERE name LIKE :Name];
    }
}