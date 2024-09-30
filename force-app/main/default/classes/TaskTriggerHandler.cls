public class TaskTriggerHandler {
    //1. Whenever the task is created, set priority to High
	public static void isHandleBeforeTask(List <Task> newRecList)
    {
        for (Task taskRec: newRecList){
            taskRec.Priority = 'High';
        }
    }
        
}