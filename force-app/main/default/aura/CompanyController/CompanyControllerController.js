({
	companydetails: function(component ,event,helper) {
        var action=component.get("c.getcompanydetails");
        action.setCallback(this,function(comp){
            var cmplist=comp.getReturnValue();
            
        component.set("v.listcompany",cmplist);
            var listcompany=component.get("v.listcompany");
            console.log(":: listcomp::"+JSON.stringify(listcompany));
        });
        $A.enqueueAction(action);
		
	}
})