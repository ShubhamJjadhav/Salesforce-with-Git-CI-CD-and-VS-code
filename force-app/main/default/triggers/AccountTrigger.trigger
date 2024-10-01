trigger AccountTrigger on Account (before insert) {
    // 1. When Account is Created Update Description as Account has been created
    if(Trigger.isBefore && Trigger.isInsert){
        AccountTriggerHandler.isAccountInserted(Trigger.New);
    }
}