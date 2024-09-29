public class CollectionList {
    public static void ListMethod()
    {
        List <Integer> newList_1 = new List<Integer>();
        newList_1.add(2);
        newList_1.add(3);
        newList_1.add(4);
        
        System.debug(newList_1.size());
        System.debug(newList_1);
        
        
       
		Integer i = newList_1.get(2); 
      
        System.debug(i);   
        
        
    }

}