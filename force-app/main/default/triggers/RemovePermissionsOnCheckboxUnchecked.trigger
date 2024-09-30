trigger RemovePermissionsOnCheckboxUnchecked on User (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        PermissionSetHandler.removePermissionSets(Trigger.new, Trigger.oldMap);
    }
}