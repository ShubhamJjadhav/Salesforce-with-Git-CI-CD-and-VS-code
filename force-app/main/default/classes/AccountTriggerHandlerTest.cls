@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    public static void updateCountryOnRelatedContacts()
    {
        //create account sample data 
        List<Account> accList = new List <Account>();
        List <Contact> conList = new List <Contact>();
      
        for (Integer i=1 ; i<=5 ;i++)
        {
            Account acc = new Account();
            acc.Name = 'TestData' + i;
            acc.SJ_Asgn_Office_Country__c = 'testDescription';
            accList.add(acc);
        }
        //new governer limits will be available for this particular test method
    	test.startTest();
        insert accList;
        
        for(Account acc: accList)
   		 {
        	Contact con = new Contact(LastName = acc.Name );
        	con.AccountId = acc.Id;
        	conList.add(con);
   		 }
		insert conList;
    
        
        for (Account acc : accList){
            acc.SJ_Asgn_Office_Country__c = 'Hello Shubham';
        }
        
        update accList;
    	//new governer limits will be available this particular test method
    	test.stopTest();
        
        List <Contact> updatedContactList = [Select id , SJ_Asgn_Office_Country__c From Contact
                                            where Id =: conList[0].Id];
        System.assertEquals('Hello Shubham', updatedContactList[0].SJ_Asgn_Office_Country__c);
        
        
        
            
    }
   
}