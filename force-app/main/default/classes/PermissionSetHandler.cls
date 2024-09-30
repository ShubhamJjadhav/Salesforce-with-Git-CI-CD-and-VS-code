public class PermissionSetHandler {
    public static void removePermissionSets(List<User> newUsers, Map<Id, User> oldUsersMap) {
        List<PermissionSetAssignment> assignmentsToRemove = new List<PermissionSetAssignment>();

        // Get the field token for the custom checkbox
        Schema.SObjectType userType = Schema.getGlobalDescribe().get('User');
        Schema.SObjectField removePermissionsField = userType.getDescribe().fields.getMap().get('Remove_Permissions__c');

        // Check if the field exists
        if (removePermissionsField == null) {
            System.debug('Field Remove_Permissions__c does not exist on User object.');
            return; // Exit if the field does not exist
        }

        // Iterate through the users being updated
        for (User user : newUsers) {
            User oldUser = oldUsersMap.get(user.Id);
            if (oldUser != null) {
                // Check if the checkbox was unchecked
                Boolean newCheckboxValue = (Boolean) user.get(removePermissionsField);
                Boolean oldCheckboxValue = (Boolean) oldUser.get(removePermissionsField);

                // Default null values to false
                newCheckboxValue = (newCheckboxValue == null) ? false : newCheckboxValue;
                oldCheckboxValue = (oldCheckboxValue == null) ? false : oldCheckboxValue;

                // Proceed if the new checkbox is false and the old checkbox was true
                if (!newCheckboxValue && oldCheckboxValue) {
                    // Query existing permission set assignments for this user
                    List<PermissionSetAssignment> userAssignments = [
                        SELECT Id 
                        FROM PermissionSetAssignment 
                        WHERE AssigneeId = :user.Id
                    ];

                    // Add the assignments to the list to be deleted
                    if (userAssignments.size() > 0) {
                        assignmentsToRemove.addAll(userAssignments);
                    }
                }
            } else {
                System.debug('Old user not found for User ID: ' + user.Id);
            }
        }

        // Delete the permission set assignments if there are any to remove
        if (!assignmentsToRemove.isEmpty()) {
            try {
                delete assignmentsToRemove;
                System.debug('Deleted Permission Set Assignments: ' + assignmentsToRemove.size());
            } catch (DmlException e) {
                System.debug('Error deleting permission set assignments: ' + e.getMessage());
            }
        }
    }
}