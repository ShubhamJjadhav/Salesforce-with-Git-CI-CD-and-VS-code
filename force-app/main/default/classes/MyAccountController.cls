public class MyAccountController {
    //method 1 : 
    public List <Account> accountList {get;set;} //getter and setter is used when you dont want to manipulate data while fetching. 
    public MyAccountController(){
        accountList = [select id , Name from Account limit 10 ];
    }
    
    
      //method 2 : 
        //public List<Account> accountList;
        //public List<Account> accountList(){
        //    return accountList;
        //}
        
        // public void setAccountList(List<Account> accList){
       //     this.accountList = accList;
      //}


}