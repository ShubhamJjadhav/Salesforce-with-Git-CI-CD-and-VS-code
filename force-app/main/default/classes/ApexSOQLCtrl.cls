public class ApexSOQLCtrl {
    
    public ApexSOQLCtrl(){
        List<Account> listAccount = [ SELECT Id, Name, Phone FROM Account];
        System.debug('Account' +listAccount);
    }
    public static void innerSQL(){
        List<Account> listAcc = [SELECT Id, Name, Phone, (SELECT Id, Name FROM Opportunities)FROM Account];
        List<Opportunity> listOpp = new List<Opportunity>();
        for (Account objAc : listAcc){
            listOpp.addAll(objAc.Opportunities);
        }
        System.debug ('ListOpportunities' +listOpp);
            }    

}