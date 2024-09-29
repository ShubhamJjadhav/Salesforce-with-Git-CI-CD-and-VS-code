// This class is belongs to colletion:
public class classCollection {
    //1.List
    ////methods used --> .add();
    public void classList(){
        List <String> objList = new List<String>();
        objList.add('Shubham');
        objList.add('Akash');
        objList.add('Abhishek');
         objList.add('Abhishek');
        System.debug('Your list is : ' + objList);
    }

    //2.Set
    //methods used --> .add();
    public static void classSet (){
        Set <String> objSet = new Set<String>();
         objSet.add('Shubham');
         objSet.add('Akash');
         objSet.add('Yash');
         objSet.add('Yash');
        System.debug('Your set list is:' + objSet);
        
    }
    
    
    //3.Sorting - 
    //methods used --> .sort();
    public  void classSort(){
        List <Integer> objSort = new List <Integer>{ 55 , 432 , 1 ,6};
        System.debug('Number at 0 index : ' + objSort.get(0));   
		System.debug('Number at 1 index : ' + objSort.get(1));  
        System.debug('Number at 2 index : ' + objSort.get(2));         
        System.debug('Number at 3 index : ' + objSort.get(3)); 
        objSort.sort();
        System.debug('Sorting List : ' + objSort);
        System.debug('Size of list is: ' + objSort.size());
        
    }
    
    //4.Map : 
    //- Use key value
    //use declare a map :type of the key , type for the value
    //methods used -->  .get(value), .put(value)
    public void classMap(){
       		Map <Integer , String> objMap = new Map<Integer , String>{1 =>'Shubham' , 2 =>'Yash'};
            System.debug('map value for key 1: ' + objMap );   
        
       // In case of map in order to add values or items use PUT in other case use add method.
       Map <Integer, String> objMap1 = new Map<Integer,String>();
        objMap1.put(1,'shubham');
        objMap1.put(2,'yash');
        System.debug('value at A: ' + objMap1.get(1));
        System.debug('Size of map is :' + objMap1.size());
    }
    
    
}


/*To execute:
 * methods in apex -->
 	* List = objList.add , objList.remove , 
 	* Set  = objSet.set(value1 , value2); --> then value at that respective index will be deleted from items
     										   and new value is added.
			objSet.size(); --> to calculate  the size of set list.
	*  

* List -->

	1. with non static method:
       classCollection objL = new classCollection();
   	   objL.classList();

	2. With static method:
   	   classCollection.classList();	

	Different ways to create list -->
	a. List <Data Type> List_name = new List<Data type>();    									 --> Simple List
	b. Data type [] List_name = new List <Data type>('value1','value2,'value2,'value4')          --> using array
	c. List <Data type> List_name = new List <Data type>{ 'value 1' , 'value 2' , 'value2'}


* Set -->
	classCollection.classSet();
	

* Map -->

*Sorting -->
	classCollection objSort = new classCollection();
	objSort.classSort();





*/