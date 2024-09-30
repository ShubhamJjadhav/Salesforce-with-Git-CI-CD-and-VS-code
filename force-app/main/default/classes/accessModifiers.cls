public class accessModifiers {

    public string name ;
    private integer size ;
    
    //Created a method and made public where you are using private variable with some conditions to execute.
     public void setSize(integer s){
        if (s<=0){
            system.debug('size can not be less than 0 or equall to 0');
            size = 10;
        }
        else {
            size = s;
        }
        
    }
    
    
    public void disp(){
        system.debug('name is-' + name + '\n and size is ' + size);
    }
 
}

/*
To execute : 

accessModifiers e1 = new accessModifiers();
e1.name = 'shubham';
e1.setSize(0);
e1.disp();

*/