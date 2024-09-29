import { LightningElement } from 'lwc';

export default class CustomeCar extends LightningElement {
    selectedLevelFourValues = []
    pickListLevelFourDetails=[
    {apiName : ' Need_Any_Customisations__c' , label : 'Need Any Customisations' , selectedValue:' '},
        
        {apiName : ' Choose_Color__c' , label : 'Select Colour' , selectedValue:' '},
        
        {apiName : ' Price_For_Color__c' , label : 'Price For Colour' , selectedValue:' '},
        
        {apiName : ' Projector_Type__c' , label : 'Headlight Type' , selectedValue:' '},
        
        {apiName : ' Price_For_Headlight__c' , label : 'Price For Headlight' , selectedValue:' '}

                                                                                                            
    ]       


    pickListLevelFourHandler(event){

        console.log("called")
        console.log(event.detail)
        this.selectedLevelFourValues = event.detail  
               

    }


}