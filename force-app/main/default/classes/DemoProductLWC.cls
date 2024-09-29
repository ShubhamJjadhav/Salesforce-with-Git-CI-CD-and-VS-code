public with sharing class DemoProductLWC {

   @AuraEnabled
   public static string addProduct(Integer pid , String pname ,Decimal pprice , String ptype , String ponline , String pimage)
   {
   
        Demo_Product__c prod = new Demo_Product__c (
            Product_ID__c  = pid , 
            Product_Image__c = pimage,
            Product_Name__c = pname,
            Product_Online__c = ponline,
            Product_Price__c = pprice,
            Product_Type__c = ptype
        );

         insert prod ;
        return 'Data Added';

   }

   //Showing data on Component
   @AuraEnabled(cacheable=true)
   public static List<Demo_Product__c> showProduct(){
        List <Demo_Product__c> myList = [ Select  Product_ID__c,Product_Image__c ,Product_Name__c, Product_Online__c ,Product_Price__c ,Product_Type__c
          FROM Demo_Product__c] ;

        return myList;  
   }

   





}