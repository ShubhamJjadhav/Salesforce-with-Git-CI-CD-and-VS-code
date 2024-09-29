trigger test1 on Analyses__c (before insert)
{
   for(Analyses__c obj: Trigger.old)
   {
     if(obj.Archived__c== true) 
     {
        obj.addError('You can not create this record');
     }
   }
}