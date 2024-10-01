public class AccountTriggerHandler {
    
    //1.  Update Description when Archived on Account is true and Rating = Hot
	public static void handleBeforeInsert(List<Account> newAccList)
    {
        for (Account acc: newAccList)
        {
            if(acc.Archived__c == True && acc.Rating == 'Hot')
            {
                System.debug('Trigger called before the record inserted : '+ newAccList);
                acc.Description = 'First Trigger on Account created successfully!!' ;
                system.debug('Hello');
            }
        }
    }
      
    //2. Create Related Contact after Account is inserted
    public static void handleAfterInsert(List<Account>newAccList)
    {
        System.debug ('Trigger called after the record inserted :' + newAccList);
        
        List <Contact> conList = new List<Contact> ();
        for (Account acc : newAccList)
        {
            contact conObj = new contact();
            conObj.AccountId = acc.id;
            conObj.LastName = acc.Name ;
            conList.add(conObj);
        }
        
        if(!conList.isEmpty()) 
        {
            system.debug('Contact details are : ' + conList);
            insert conList;
        }
    }
    
    //3. ***Write a trigger on Account object if Industry is updated and Active = yes, update descrption as based on Industry old and new value
    public static void handleBeforeUpdate(Map<Id,Account> oldMapList,List <Account> newAcc)
    {
        for (Account acc: newAcc)
        {
            System.debug('Old Map List : '+ oldMapList);
            if (oldMapList != null && acc.Industry != oldMapList.get(acc.Id).Industry && acc.Active__c == 'Yes' )
            {
                acc.Description = ( 'Industry has been updated from '+ ' ' +oldMapList.get(acc.id).Industry + ' ' + 'to' + ' ' + acc.Industry );
            }
        }
    }
    
    //4. Write a trigger on Account object if Rating field = 'Hot' and Phone field is Updated then update same phone number on
    //   its related contact. And if there is not related contact the update shipping to Contact not found
    //   (New things - Map and Put method and KeySet) 
    
	public static void handleAfterUpdate(Map<Id,Account>oldMapList ,List <Account> newAccountList)
    {
        List<Contact> contactsToUpdate = new List <Contact>();
        List <Account> accountsToUpdate = new List <Account>();
        for (Account acc: newAccountList)
        {        
            if(acc.Rating == 'Hot')
            {
                if(oldMapList != null && acc.Phone != oldMapList.get(acc.id).Phone)
                {
                    List<Contact> relatedContacts = [SELECT Id, Phone FROM Contact WHERE AccountId = :acc.Id];
                    if(!relatedContacts.isEmpty())
                    {
						for(Contact conList: relatedContacts)
                    	{
                        	conList.Phone = acc.Phone;
                        	contactsToUpdate.add(conList);
                    	}                        
                	}
                    else {
                    // Update the ShippingCity field on the account if no related contacts are found
                    Account accountToUpdate = new Account(Id = acc.Id ,ShippingCity = 'Contact not found');
                        
                    	accountsToUpdate.add(accountToUpdate);
                	}
                
            }        
        }
        	// Perform the update on the collected contacts
            if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
            }
            
            // Perform the update on the accounts with no related contacts found
        		if (!accountsToUpdate.isEmpty()) {
            		update accountsToUpdate;
        		}
    	}
    }
    
	//5. If account is updated and Ownership is set to Private then do not allow user to save the record
    public static void isBeforeUpdate(Map <Id, Account>oldMapList ,List <Account> accList){
        
        for (Account acc : accList){
            if(acc.Industry == 'Agriculture' && acc.Type == 'Prospect' && acc.Ownership == 'Private'){
                if(oldMapList.get(acc.Id).Ownership != acc.Ownership)
                {
                    acc.addError('Ownership cannot be modified');
                }
                
        	}
        }        
    }
    
    //6. Evrytime whenever the account website is updated then update the website on its child contact records.
    public static void isAfterUpdate(Map<Id,Account>oldMapList,List <Account>accRec)
    {
        // Created map to store the account id's and website where website is modified
        Map <Id, String> accWithWebsite = new Map<Id,String>();
        for (Account acc: accRec){
            if(acc.Website != oldMapList.get(acc.id).website){  // we have used put method to insert acc id , website to Map
                accWithWebsite.put(acc.Id, acc.Website);              
            }
        }
         
        if(accWithWebsite.KeySet().size() > 0){
            List <Contact> addConWebsite = new List <Contact>();
            List <Contact> conList = [Select id , AccountId , Website__c from Contact where AccountId IN :accWithWebsite.KeySet()];
            
            for (Contact con : conList){
                con.Website__c = accWithWebsite.get(con.AccountId) ; 
                // because of Map in con.accountId we are getting the value of wesite which we defined on line 115
                addConWebsite.add(con);
            }
            
          	if(addConWebsite.size() > 0){
            update addConWebsite;
        	}
        }        
    }
    
    // 7. Whenever on Account if Phone is Updated then update the Mobile on its related Case
    public static void isAfterUpdateContact(Map <Id, Account>oldMapList, List <Account> accList){
        
        Map <Id, String> accUpdatePhone = new Map<Id , String>();
        for(Account acc: accList){
            if(acc.Phone != oldMapList.get(acc.id).Phone){
                accUpdatePhone.put(acc.id , acc.Phone);
            }
        }
        
        if(accUpdatePhone.KeySet().Size() > 0){
            List <Case> caseRec = [Select id ,SuppliedPhone, AccountId from Case where AccountId IN :accUpdatePhone.keySet() ];
            List <Case> casePhoneRec = new List <Case>();
                for (Case caseList : CaseRec){
                    caseList.SuppliedPhone = accUpdatePhone.get(caseList.AccountId);
                    casePhoneRec.add(caseList);
                }
            if (casePhoneRec.Size() > 0){
                update CasePhoneRec;
            }
        }
        
    }
    
    //8. Create Contact records based on Create N Contacts field on the Account record
    public static void isAfterInsertContact(List <Account> newAccList){
        
        List <Contact> conList = new List<Contact>();
        for (Account acc: newAccList){
            For(integer i = 0 ; i < acc.Create_N_Contacts__c ; i++){
                //Create an instance for contact
                contact con = new contact();
                
                //Here assigning values to new Contact
                con.AccountId = acc.Id;
                con.LastName= acc.Name + i;
                con.FirstName = acc.name;
                conList.add(con);
                 
            }
            
            if(!conList.isEmpty()){
                insert conList;
            }
        }     
    }
 // 8.2 Update Contact records based on Create N Contacts field on the Account record
    public static void isAfterUpdateInsertContact(Map <id , Account>oldMapList , List <Account>accList){        
        Map <Id , Decimal> newCreate_N_Contracts = new Map <id, Decimal>();
        
        // Collect accounts with updated Create_N_Contacts__c
        for (Account acc: accList){             
            if(acc.Create_N_Contacts__c != oldMapList.get(acc.id).Create_N_Contacts__c){
                newCreate_N_Contracts.put(acc.id , acc.Create_N_Contacts__c);                
            } 
        }         
        // Create new Contact records based on Create_N_Contacts__c
            if(!newCreate_N_Contracts.isEmpty()){
                List <Contact> conList = new List <Contact>();               
                    for (Account acc : accList){
                        for (Decimal i = 1 ; i < newCreate_N_Contracts.get(acc.id) ; i++){
                            Contact newCon = new Contact();
                                newCon.AccountId = acc.Id;
                                newCon.LastName= acc.Name + i;
                                newCon.FirstName = acc.name;
                            conList.add(newCon);
                        }              
                	}   
                 //If conList is empty, there's no point in trying to insert anything. 
                 //The check prevents unnecessary operations.

                    if (!conList.isEmpty()) {
                        insert conList;
                    }
        	}
     
    }
    
    //9. If Account Industry is not null then update and having value equals 'Media' then update rating as Hot
    	
    public static void isAccBeforeUpdate(List<Account>newAcc){
        for (Account acc: newAcc){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }        
    }
    
    //10. Create related Opportunity when account is inserted.
    
    public static void isAccAfterInsert(List <Account>newAcc){
        
        List <Opportunity> oppList = new List <Opportunity>();
        
        for (Account acc: newAcc){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.id ;
            opp.Name = acc.Name ;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospect';
            
            
            oppList.add(opp);
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    
    //11. If account is updated then put update message in desciption as Account has been updated.
    
    public static void isAccBeforeUpdate(Map <Id , Account> oldMapList , List <Account>newAcc){
       
        for(Account acc: newAcc){
            if(acc.Phone != null && acc.phone != oldMapList.get(acc.id).phone){
                acc.Description = 'Account has been updated';
            } 
        }
    }
    
    //12. If account phone is updated, then update the phone on its related opportunity
    //*** New thing - In order to update on related records first store the data in collection(Map , List)
    public static void isAccOppAfterUpdate(map <ID , Account>oldMapList, List <Account>newAcc){
        
        List <Opportunity>opptyToUpdate = new List <Opportunity>();
        for (Account acc: newAcc){
            if( oldMapList.get(acc.Id).Phone != acc.Phone && oldMapList != null ){
                List <Opportunity> relOppRec = [Select id , Phone__c from Opportunity Where AccountId = :acc.id];                
                for (Opportunity oppList : relOppRec){
                    oppList.Phone__c = acc.Phone;
                    opptyToUpdate.add(oppList);                   
                }
            }
            
            if(!opptyToUpdate.isEmpty()){
                update opptyToUpdate ;
            }
        }
        
    }
        
    //13.Update Description on Account when Account is Inserted then Update Description as 'Account has been inserted'
    public static void isAccountInserted (List <Account> accList) {
        for (Account acc : accList){
            acc.Description = 'Account has been inserted';
        }
        
    }
           
}