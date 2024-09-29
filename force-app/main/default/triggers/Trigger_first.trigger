Trigger Trigger_first on Account (before insert, after insert , before Update, after update) {
// 1. Write a trigger on Account object if checkbox (Archived__c) is true and Industry is not null then update account number 1234    
    if (Trigger.isInsert && Trigger.isBefore)
    {	
        AccountTriggerHandler.handleBeforeInsert(Trigger.new);              
    }
    

//2. Create a contact on the insertion of Account Record    
    if (Trigger.isInsert && Trigger.isAfter)
    {
        AccountTriggerHandler.handleAfterInsert(Trigger.new);
    }
    
 //3. Write a trigger on Account object if Industry is updated and isAvailable = true, update descrption update descrption as based on Industry old and new value
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        AccountTriggerHandler.handleBeforeUpdate(Trigger.oldMap,Trigger.new);
    }
    
 //4. Write a trigger on Account object if Rating field = 'Hot' and Phone field is Updated then update same phone number on
 //   its related contact.
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            AccountTriggerHandler.handleAfterUpdate( Trigger.oldMap ,Trigger.new);
        }
    }
 
    //5. If account is updated and Ownership is set to Private then do not allow user to save the record
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.isBeforeUpdate(Trigger.oldMap, Trigger.New);
    }
     
    //6. Evrytime whenever the account website is updated then update the website on its child contact records.
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        AccountTriggerHandler.isAfterUpdate(Trigger.oldMap,Trigger.new);
    }
   
     // 7. Whenever on Account if Phone is Updated then update the Web Phone on its related Case
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.isAfterUpdateContact(Trigger.oldMap, Trigger.new);
    }
    
    //8. Create Contact records based on Create N Contacts field on the Account record
    if(Trigger.isInsert ){
        if(Trigger.isAfter){
        	AccountTriggerHandler.isAfterInsertContact(Trigger.New);
		}           
    }
    
    // Update Contact records based on Create N Contacts field on the Account record
    if(Trigger.isAfter && trigger.isUpdate){
         AccountTriggerHandler.isAfterUpdateInsertContact(Trigger.oldMap, trigger.new);      
    }
    
    // If Account Industry is not null then update and having value equals 'Media' then update rating as Hot
   
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.isAccBeforeUpdate(Trigger.new);
    }
    	
     //10. Create related Opportunity when account is inserted.
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.isAccAfterInsert(Trigger.new);
    }
    
    //11. If account phone is updated then put update message in desciption as Account has been updated.
    
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.isAccBeforeUpdate(Trigger.oldMap , Trigger.new);
    }
    
    //12. If account phone is updated, then update the phone on its related opportunity
	if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.isAccOppAfterUpdate(Trigger.oldMap , Trigger.new);
    }
       
    
}