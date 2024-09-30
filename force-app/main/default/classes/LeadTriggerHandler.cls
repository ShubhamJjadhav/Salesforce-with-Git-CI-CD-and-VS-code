public class LeadTriggerHandler {
    
	//1. Whenever the Lead is updated, set the Lead status to Working-Contracted
    public static void isHandleBeforeUpdate(List <Lead>newLead ){
    	for (Lead recLead : newLead)
        {
            recLead.Status = 'Working - Contacted';
        }	        
    }
    //2. When the lead is created, create a task for the Lead owner to Follow up with customer
    // New things (Created instance whoId and whatID)
    
    public static void isAfterInsert(List <Lead> newLeadRec)
    {
        List <Task> newTaskRec = new List <Task>();
        
        for (Lead recList: newLeadRec){
            Task taskRec = new Task();
            taskRec.OwnerId = recList.OwnerId;
            taskRec.Description = 'Follow up with the customer';
            taskRec.Status = 'Not Started';
			taskRec.Subject = 'Follow up on Task';
            taskRec.WhoId = recList.Id ; // Here you are referencing task ID with the Lead ID
            newTaskRec.add(taskRec);           
        }
        
        if(!newTaskRec.isEmpty()){
            insert newTaskRec ;
        }
    }
}