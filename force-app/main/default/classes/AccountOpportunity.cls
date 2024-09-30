public class AccountOpportunity {
	@AuraEnabled
    public static list<account> getAllAccounts(){
          list<account> accOppoName =[SELECT id,name,phone,(SELECT AccountId FROM Opportunities) FROM Account ];

     return accOppoName;
    }
}