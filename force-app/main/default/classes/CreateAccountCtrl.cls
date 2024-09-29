public class CreateAccountCtrl {
  @AuraEnabled
    public static String createAccountRecord(String name , String phone , String accountNumber , String billingAddress ){
      Account objAcc= new Account();
        
        objAcc.name=name;
        objAcc.phone=phone;
        objAcc.AccountNumber= accountNumber;
        objAcc.BillingCity = billingAddress;
        
        insert objAcc; 
        System.debug('::objAcc::'+objAcc);
        return objAcc.Id;
        
        
    }

}