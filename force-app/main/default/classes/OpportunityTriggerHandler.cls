public class OpportunityTriggerHandler {

	//1. Whenevr th opportunity is closed won, create a task for the opportunity owner to split the revenue amongst team
	public static void isAfterUpdate(List <Opportunity> newOppList)
    {
        for (Opportunity oppList: newOppList)
        {
            List <Task> insertTask = new List <Task>(); // It will store the new task record list
            if (oppList.StageName == 'Closed won')
            {
                Task taskRec = new Task();
                taskRec.WhatId = oppList.Id;
                taskRec.OwnerId = oppList.OwnerId;
                taskrec.Description = 'Split the revenue amongst the team';
                taskRec.Status = 'Not Started';
                taskRec.Subject = 'Split Revenue';
                
                insertTask.add(taskRec);
            }
            
            if(!insertTask.isEmpty())
            {
                insert insertTask;
            }
           
        }       
    }

    //3. If Opportunity Stage is Modified, update Opportunity Amount
		public static void isHandleBeforeUpdate(Map<Id,Opportunity> oldMaplist,List <Opportunity>newOppList)
        {
            for(Opportunity opp: newOppList){
                if(oldMapList !=null && opp.StageName != oldMaplist.get(opp.Id).StageName )
                {
                    opp.Amount = opp.Probability * opp.ExpectedRevenue ;
                    System.debug('Amount is : '+ opp.Amount);
                    System.debug('Probability Entered ' + opp.Probability);
                    System.debug('Expected Revenue' + opp.ExpectedRevenue);
                }
            }
        } 
    //3. Whenever the Opportunity is deleted, assign the task to its opportunity's account owner.
   /* public static void isAfterDelete(List <Opportunity> oldOppRecords){
        
        // From Oppty --> Account Id's --> Owner Id
        
        // In order to get the opportunities owner account, first fetch the accounts from Oppty       
        set <id> accountIds = new Set <Id>();  
        map <id, id> oppVsAccountMap = new Map<Id,Id>();
        map <id,id> accIdvsOwnerId = new Map <id,id>();
        
        For (Opportunity opp : oldOppRecords)
        {
			accountIds.add(opp.AccountId);
            oppVsAccountMap.put(opp.Id, opp.AccountId); // mapped oppty id and related oppty's account id
        }
        
        // here we queried Owner of those Accounts
        List <Account> accountRecords = [Select id, ownerId from Account where ID IN :accountIds];
        
        for (Account acc : accountRecords){
            accIdvsOwnerId.put(acc.Id, acc.OwnerId);
        }
     
        List <Task> taskRecList = new List <Task>();
        for (Opportunity oppRec : oldOppRecords){
            Task taskRec = new Task();
            taskRec.Description = 'Investigate why the opportunity has been deleted';
            taskRec.Priority = 'High';
            taskRec.Subject = 'Why Opportunity Deleted?';
            taskRec.Status = 'Not Started';
            taskRec.Ownerid =  accIdvsOwnerId.get(oppVsAccountMap.get(oppRec.Id));           
            taskRecList.add(taskRec);
        }
        
        if(!taskRecList.isEmpty()){
            
            	insert taskRecList;			
        }
        
    }*/
    
    public static void isAfterDelete(List<Opportunity>oldOppRecords){
        
    // Queried accountID's form Old Oppty Records
        Set <id> accountIds = new Set<ID>();
        Map <Id,Id> oppIdvsAccId = new Map <Id, Id>();
        for (Opportunity opp: oldOppRecords){
            accountIds.add(opp.AccountId);  
            oppIdvsAccId.put(opp.Id,opp.AccountId);
        }
        
        List <Account> accOwnerID = [Select Id , OwnerId from Account Where ID IN:accountIds ];
        
        map <Id,id>oppOwnerVsAccOwnerId = new Map <Id,Id>();
        For (Account acc: accOwnerID ){
            oppOwnerVsAccOwnerId.put(acc.Id, acc.OwnerId);
        }
        
        
        List <Task> insertTaskList = new List <Task>();
        for (Opportunity opp: oldOppRecords){
            Task taskRec = new Task();
            taskRec.Subject = 'Opportunity is deleted ??'; 
            taskRec.Priority = 'High';
            taskRec.Status = 'Not Started';
            taskRec.Description = 'Shubham - Investigate why the opportunity has been deleted';
            taskRec.OwnerId = oppOwnerVsAccOwnerId.get(oppIdvsAccId.get(opp.Id));
            insertTaskList.add(taskRec);
        }
        
        if(!insertTaskList.isEmpty()){
            insert insertTaskList;
        }
    }
    
    
    
}