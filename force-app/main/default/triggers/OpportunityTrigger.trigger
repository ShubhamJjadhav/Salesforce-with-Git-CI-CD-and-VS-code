trigger OpportunityTrigger on Opportunity (before insert, after update, before Update , after delete) {
    
	//1. Whenevr th opportunity is closed won, create a task for the opportunity owner to split the revenue amongst team
	if(Trigger.isAfter && Trigger.isUpdate)
    {
        OpportunityTriggerHandler.isAfterUpdate(Trigger.new);
    }
    
    //2. If Opportunity Stage is Modified, update Opportunity Amount
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        OpportunityTriggerHandler.isHandleBeforeUpdate(Trigger.oldMap,Trigger.new);
    }
    
    //3. Whenever the Opportunity is deleted, assign the task to its opportunity's account owner.
    if(Trigger.isAfter && Trigger.isDelete)
    {
        OpportunityTriggerHandler.isAfterDelete(Trigger.old);
    }
    
}