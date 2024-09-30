public class ContactListController {
    @AuraEnabled
    public static list<Contact> getRelatedList(Id recordId)
    {
        return  [Select id, name, firstname, lastname from Contact];
	}
}