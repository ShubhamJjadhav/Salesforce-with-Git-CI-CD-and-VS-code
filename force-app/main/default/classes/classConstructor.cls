public class classConstructor {
    Private String name ;
    Private Integer age ;
    
    //with parameters --> when user passes values of name and age then that will be visible
    public classConstructor(String n , Integer a){
        name = n;
        age = a;
        
        
    }
    
    // without parameters --> when user does not pass values then by default it will show abhishek and 14.
    public classConstructor(){
        name = 'abhishek' ;
        age = 14;    
    }
    
    public void disp(){
        system.debug('My name is ' + name + ' and age is ' + age);
    }

}

/*
To execute :

--> here you are passing values when 
object is being created with parameters

1. With Parameters
classConstructor p1 = new classConstructor('Shubham',25);  
p1.disp();

--> here you are not passing any values when 
object is being created with parameters

2. Without parameters 
classConstructor p1 = new classConstructor();  
p1.disp();

*/