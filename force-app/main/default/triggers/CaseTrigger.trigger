trigger CaseTrigger on Case (before insert) {
	//1. Whenever the case is created and Case Origin is Phone, set Priority = High, else Priority = Low
    if(Trigger.isBefore && Trigger.isInsert){
        CaseTriggerHandler.isBeforeInsert(Trigger.new);     
    }
}