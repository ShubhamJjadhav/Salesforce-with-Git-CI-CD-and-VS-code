trigger LeadTrigger on Lead (before insert, before update, after insert) {
    
    //1. Whenever the Lead is updated, set the Lead status to Working-Contracted
    if(Trigger.isBefore && Trigger.isUpdate){
        LeadTriggerHandler.isHandleBeforeUpdate(Trigger.New);
    }
    
    //2. When the lead is created, create a task for the Lead owner to Follow up with customer
    if(Trigger.isAfter && Trigger.isInsert)
    {
        LeadTriggerHandler.isAfterInsert(Trigger.new);
    }

}