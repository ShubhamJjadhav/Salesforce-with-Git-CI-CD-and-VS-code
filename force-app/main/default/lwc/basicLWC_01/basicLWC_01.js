import { LightningElement } from 'lwc';


export default class BasicLWC_01 extends LightningElement 
{
    //BL or Connect with Apex
    //attribute
    
   
   
    /**************************************************************/
    prodList = [

        //array of object
        {
            "prodId": 1001,
            "prodName": "1. Mobile",
            "prodPrice": 9999.77
        },

        {
            "prodId": 1002,
            "prodName": "2. TV",
            "prodPrice": 98999.77
        },

        {
            "prodId": 1003,
            "prodName": "3. Pen",
            "prodPrice": 9.77
        },

        
        {
            "prodId": 1004,
            "prodName": "4. WM",
            "prodPrice": 19999.77
        },

        
        {
            "prodId": 1005,
            "prodName": "5. Rice",
            "prodPrice": 99.77
        }

    ];
    /*
    Template looping
    1. For: Each
    2. iterator
    */



/***********************addition of two numbers***************************************/
    numOne = 10;
    numTwo = 20;
    get addNumber() {    //if we dont use get then method will print on the window
                         // Get --> it will return the not the entire method

        return this.numOne + this.numTwo;

    }
/*************************Print the array data *************************************/
    myarray = ['Shubham', 'Akash', 'Sumit'];
    get demoGetData() {

        return this.myarray[1];

    }

/*************************Print output based on input*************************************/
    prodId;
    pidChange(event) {

        //console.log(event.target.value);

        this.prodId = event.target.value;  // target --> whichever is firing the event i.e lightning input  
            

    }

    /**************************************************************/
    Name;

    nameChange(event){
        this.Name = event.target.value;
    }

    /****************Adding button to the component****************/    
    prodName;
    prodPrice;

    pnameChange(event){
    this.pnameChange = event.target.value;
    }

    ppriceChange(event){
    this.ppriceChange = event.target.value;
    }

    demoAdd()
    {
        this.prodList.push = [...this.prodList,{"prodId":this.prodId , "prodName": this.prodName, "prodPrice": this.prodPrice}];
    }

    demoDelete(event)
    {
   // alert(event.target.value);

   var deleteData = event.target.value;
   this.prodList.splice(deleteData,1);

    }
 

}