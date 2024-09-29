public class AccountHandler {
   public static void insertAccount (Integer numNewAccounts)
   {
     List <Account> addAccounts = new List <Account>();
       Integer counter = 0;
       while (counter <= numNewAccounts){
           Account a = new Account();
           a.Name = 'Acme Inc' + counter;
           a.AccountNumber = 'A000' + counter ;
           addAccounts.add(a);
           counter++;
           System.debug('Hello');
       }
       Delete addAccounts;
   }
        

}