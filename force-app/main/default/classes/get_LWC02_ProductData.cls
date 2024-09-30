public with sharing class get_LWC02_ProductData {  
//in this class we are aligning the static data which will provided by the used to the field of respective object
@AuraEnabled
    public static string addProduct(Integer pId , String pName , Decimal pPrice , String pType ,
                                    String pOnline , String pImage)
    {
        //Object Name
        Demo_Product__c prod = new Demo_Product__c (    Product_ID__c = pid , 
                                                        Product_Name__c = pName,
                                                        Product_Image__c = pImage,
                                                        Product_Online__c = pOnline,
                                                        Product_Price__c = pPrice,
                                                        Product_Type__c = pType
                                                    );

        insert prod ;                                               
        return 'Data Added';

    }
}