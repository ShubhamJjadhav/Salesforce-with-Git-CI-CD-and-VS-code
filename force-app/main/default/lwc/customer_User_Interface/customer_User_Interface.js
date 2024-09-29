import { LightningElement, wire ,track} from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import Choose_Color__c from '@salesforce/schema/Car_Booking__c.Choose_Color__c';
import Price_For_Color__c from '@salesforce/schema/Car_Booking__c.Price_For_Color__c';


export default class Customer_User_Interface extends LightningElement {

    value ='';
    @track chooseColorValues;
    @track error;
    @track values;
    
    @track priceColourvalues;
    @track priceCvalues;

    selectedValue;


    /* Created Color Picklist  */
    get options() {
        return [
            { label: 'TATA Altroz', value: 'TATA Altroz' },
            { label: 'TATA Nexon', value: 'TATA Nexon' },
            { label: 'TATA Harrier', value: 'TATA Harrier' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }


    /* Called Picklist From SF admin  */  
    @wire(getPicklistValues,{
        recordTypeId:'012000000000000AAA',
        fieldApiName: Choose_Color__c
    }) 
        colorPickListValue({data , error}){
            if(data){
                console.log(' Picklist Values Are  ',data.values);
                this.chooseColorValues = data.values;
                this.error = undefined;
            }
            if(error){
                console.log(error);
                this.error = error;
                this.chooseColorValues = undefined;

            }
        }

    handleChange(){
        
    } 

    /************************************************************************************/
    /*Price for Colour */
    @wire(getPicklistValues, { 
    recordTypeId: '012000000000000AAA', 
    fieldApiName: Price_For_Color__c
     })
        priceForColourValue({data,error})
        {
            if(data){
                console.log('Picklist values are',data.priceCvalues);
                this.priceColourvalues = data.priceCvalues;
                this.error = undefined;
            }


            if(error){
                console.log(error);
                this.error=error;
                this.priceColourvalues=undefined;
            }
        }
        
        handleChange(){
            
        } 
       

    /********************************************************************************/

    // to get the default record type id, if you dont' have any recordtypes then it will get master

    /*@wire(getObjectInfo, { objectApiName: Car_Booking__c })

    accountMetadata;

    // now get the industry picklist values
    @wire(getPicklistValues,

        {

            recordTypeId: '', 

            fieldApiName: Price_For_Color__c

        }

    )

    priceColourPicklist;

    // on select picklist value to show the selected value

     handleChange(event) {

        this.value = event.detail.value;

    }

    */

   

   


}