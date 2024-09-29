({
	DisplayCompanyController: function(component ,event,helper) {
        var action=component.get("c.getCompanyDetails");
        action.setCallback(this,function(comp){
            var cmplist=comp.getReturnValue();
           
            
        component.set("v.listComp",cmplist);
  		console.log(":: listcomp::"+JSON.stringify(cmplist));
        });
        $A.enqueueAction(action);
		
	}
})