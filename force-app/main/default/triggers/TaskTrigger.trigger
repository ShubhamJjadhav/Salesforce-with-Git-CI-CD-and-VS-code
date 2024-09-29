trigger TaskTrigger on Task (before insert) {
	//1. Whenever the task is created, set priority to High
    if(Trigger.isInsert && Trigger.isBefore){
        TaskTriggerHandler.isHandleBeforeTask(Trigger.new);
    }
}