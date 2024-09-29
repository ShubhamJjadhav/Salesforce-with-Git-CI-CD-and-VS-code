import { LightningElement , wire } from 'lwc';
import getAccounts from '@salesforce/apex/tableController.getAccounts'

const COLUMNS = [
     {label : ' Car Name ' , fieldName :  'Name'},
     // {label : ' Car Image ' , fieldName :  'Car_Image__c', type : 'image'} ,
     {label : ' Engine (CC) ' , fieldName :  'Engine__c', type : 'number'},
     {label : ' Fuel Type ' , fieldName :  'Fuel_Type__c' , type : 'text'},
     {label : ' Seating Capacity ' , fieldName :  'Seating_Capacity__c', type : 'number'},
     {label : ' Mileage ' , fieldName :  'Mileage__c' , type:'number'},
     {label : ' Transmission Type ' , fieldName :  'Transmission_Type__c' , type:'text'},
     {label : ' Cost' , fieldName :  'Total_Cost__c' , type:'currency'}
     

]

export default class GetDataDisplayData extends LightningElement {
     tableData
     columns = COLUMNS 

     @wire(getAccounts)
     accountHandler({data, error})
     {
          if(data){
               console.log(data);
               this.tableData = data
          }
          if(error)
          {
               console.log(error);
          }
     }
}