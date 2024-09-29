//to extend the class you have to make parent class 'virtual'
public class classTruck extends vehicle {

    // You already have method 'Speed' in vehicle class and you are overiding based on truck class so use 'Override'
    public override void speed(){
        System.debug('Truck has speed of 20 m/hr');
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