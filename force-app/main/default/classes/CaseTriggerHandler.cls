public class CaseTriggerHandler {
	//1. Whenever the case is created and Case Origin is Phone, set Priority = High, else Priority = Low
	public static void isBeforeInsert(List <Case> newCaseRec)
    {
        
        for (Case caseList : newCaseRec)
        {
            if(caseList.Origin == 'Phone')
            {
                caseList.Priority = 'High';
            }
            else{
                caseList.Priority = 'Low';
            }
        }
    }
    
}