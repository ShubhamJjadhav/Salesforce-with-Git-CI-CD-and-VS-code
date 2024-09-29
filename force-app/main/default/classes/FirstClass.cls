public class FirstClass {
    public String name;
    public Integer age ;
    Date todayDate;
    private boolean married;
    DateTime todayDateTime; 
    String stream ;
    Integer Passout_Year;
    
    //Default Constructor
    public  void FirstClass()
    {
        name = 'Shubham Jadhav';
        age = 23 ;
        married = false ;
        todayDate = System.today();
        todayDateTime = System.now();
        
        System.debug('Default Constructor');
        System.debug('Full name : '+ name);
		System.debug('Your age is : '+age);
        System.debug('Date is : '+ todayDate);
        System.debug(' married status is : '+married);
        System.debug('todayDateTime is : '+ todayDateTime);
    }
    
    //Parameterised Constructor
    public FirstClass( String stream , Integer PassOut_Year)
    {
        System.debug('Your Stream is : ' + stream );
        System.debug('Passout year : ' + PassOut_year);
        
        
    }
    
    

}