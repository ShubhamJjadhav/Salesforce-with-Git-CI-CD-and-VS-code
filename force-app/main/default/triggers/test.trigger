trigger test on Account (before insert)
{
   for(Account obj: Trigger.old)
   {
     if(obj.Archived__c) 
     {
        obj.addError('You can not create this record');
     }
   }
}