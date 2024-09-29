import { LightningElement, wire } from 'lwc';
import GetValues from '@salesforce/apex/SampleController_1.GetValues';


const COLUMNS = [

    { label: 'Colour ', fieldName: 'Colour__c' },
    { label: 'Price For Colour', fieldName: 'Price_For_Colour__c' },
    { label: 'Headlight Type', fieldName: 'Headlight_Type__c' },
    { label: 'Price For Headlight', fieldName: 'Price_For_Headlight__c' },
    { label: 'Transmission Type', fieldName: 'Transmission_Type__c' },
    { label: 'Price For Transmission', fieldName: 'Price_for_Transmission__c' }

];


export default class MetaDataRecord extends LightningElement {

    records;
    wiredRecords;
    error;
    columns = COLUMNS;
    draftValues = [];

    @wire( GetValues )  
    wiredRecs( value ) {

        this.wiredRecords = value;
        const { data, error } = value;

        if ( data ) {
                        
            this.records = data;
            this.error = undefined;

        } else if ( error ) {

            this.error = error;
            this.records = undefined;

        }

    }  

}