({
	saveAccount : function(component, event, helper) {
		var name= component.find("name").get("v.value");
        var phone= component.find("phone").get("v.value");
        var accountNumber = component.find("accountNumber").get("v.value");
        var billingCity = component.find("billingCity").get("v.value");
       
        
        console.log("::Account Name::"+name);
        console.log("::Phone::"+phone);
        
        var action=component.get("c.createAccountRecord");
        
        action.setParams({
            "name":name,
            "phone":phone,
            "accNumber":accountNumber,
            "billCity":billingCity
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            alert("::state::"+state);
            
            var accId=response.getReturnValue();
            window.open("/"+accId);
        });
        $A.enqueueAction(action);
	}
})