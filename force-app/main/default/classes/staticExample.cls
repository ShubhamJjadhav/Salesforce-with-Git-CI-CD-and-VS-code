public class staticExample {
    public static void method1(){ 
        system.debug('I am static');
    }
    
    // method by default if you have not mentioned anything then it is non static
    public void method2(){ 
        system.debug('I am non static');
    }

}

/*To execute:
staticExample.method1();

staticExample e1 = new staticExample();
e1.method2();


*/