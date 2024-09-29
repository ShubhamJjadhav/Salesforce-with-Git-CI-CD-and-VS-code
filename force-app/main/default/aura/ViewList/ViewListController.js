({
    doInit : function(component, event, helper){
        
        var action = component.get(c.getContacts);
        
        action.setCallback(this, function(response){
         var state = response.getState();
        var listContacts = response.getReturnValue();
        component.set("v.listCon", listContacts);
               });
    
    $A.enqueueAction(action);
    }
})