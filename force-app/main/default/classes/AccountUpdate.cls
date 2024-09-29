public class AccountUpdate implements Queueable {
  public void execute(QueueableContext context) {
       List<Account> accList = [SELECT ID, Name, Site, Description FROM ACCOUNT ORDER by CreatedDate ASC LIMIT 10];     
        
         for(Account acc: accList){
            acc.Site = 'www.groviya.com';
            acc.Description = 'Created for Europe Location';
            
        }
        update accList;
    }
    
     
}