public class classSobject {
    public static void sObject(){
        //List <Sobject> objects = new List <SObject>();
        List <Account> objects = new List <Account>();
        Account acc = new Account(Name = 'ABC Company');
        Opportunity opp = new Opportunity ( Name = 'New Opportunity');
        case cas = new Case (Status = 'New' , Origin = 'Phone' );
        
        
        
		//add the records to the list
		//list of Object        
		objects.add(acc);	
		/*    Commented below two lines because if you use list for single object then you won't be 
			  able to add other object records.
			  To overcome or to add other records we can use sObject.					
		*/      
        //objects.add(opp);   
		//objects.add(cas);
		
		system.debug('elements in the list: '+ objects) ;
        
        
  
    }

}