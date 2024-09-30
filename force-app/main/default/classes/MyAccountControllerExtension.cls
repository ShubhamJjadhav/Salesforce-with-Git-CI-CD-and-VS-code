public class MyAccountControllerExtension {
    private final Account acct;
    
    
    public MyAccountControllerExtension(ApexPages.standardController stdController){
        this.acct = (Account)stdController.getRecord();
    }
    
    public String getGreeting(){
        return 'Hello' + acct.name + '(' + acct.Id + ')';
    }
    

}