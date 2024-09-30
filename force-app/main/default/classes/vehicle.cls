//This class is going to be extended in other classes i.e classTruck so use 'virtual'
public virtual class vehicle {
    
    public void model(){
        system.debug('Model method of vehicle class');
    }
    
    //In order to override using method from another class make this method as virtual too.
    public virtual void  speed(){
        system.debug('Speed of a car depends on the type of the vehicle');
    }

}

/*
To execute:
Vehicle v1 = new vehicle();
classTruck v2 = new classTruck();

v1.speed();
v2.model();
v2.speed();


*/