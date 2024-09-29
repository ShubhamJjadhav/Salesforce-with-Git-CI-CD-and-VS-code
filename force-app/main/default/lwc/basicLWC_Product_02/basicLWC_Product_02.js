import { LightningElement , wire , track} from 'lwc';
import getMyClass from '@salesforce/apex/DemoProductLWC.addProduct';
import  showProduct from '@salesforce/apex/DemoProductLWC.showProduct';
import { deleteRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class BasicLWC_Product_02 extends LightningElement {

   
    

    get myOpt() {
        return [
            { label: 'Select', value: '' },
            { label: 'Electronics', value: 'Elec' },
            { label: 'Stationary', value: 'stat' },
            { label: 'Grocery', value: 'groc' },

        ];
    }

    get getMyRadio(){
        return [
            { label: 'Yes', value: 'Y' },
            { label: 'No', value: 'N' },
        ];
    }

    prodId;
    prodName;
    prodPrice;
    prodType;
    prodOnline;
    prodImage;

    idChange(event){
        this.prodId = event.target.value;
    }

    nameChange(event){
        this.prodName = event.target.value;

    }

    priceChange(event){
        this.prodPrice = event.target.value;

    }

    typeChange(event){
        this.prodType = event.target.value;

    }

    onlineChange(event){
        this.prodOnline = event.target.value;

    }

    imageChange(event){
        this.prodImage = event.target.value;

    }

    addData()
    {
        /*alert(this.prodId + " " + 
        this.prodName + " "+ 
        this.prodPrice + " "+
        this.prodType + " "+
        this.prodOnline );   --> added this because to check data is coming or not*/


        getMyClass({pid: this.prodId , pname : this.prodName , pprice: this.prodPrice , ponline : this.prodOnline,
                    ptype : this.prodType, pimage : this.prodImage})
        
        .then((res)=>{
            alert('Data Added');
            console.log(res);
        })           
        
        .catch((err)=>{
            console.log(err);
        })
    }



    showList = []; //created variable to show on html
    dataShow(){
        showMyData()
        .then((res)=>{
            //console.log(res) --> this confirm when you click on button in browser console data is showing or not
            this.showList = res;
        })
    
        .catch((err)=>{
           // console.log(err)
        }) 
    }

    /***************** Assignment*********************/

    /*inputPrice;
    demoPrice(event){  
       this.inputPrice = event.target.value;
    }*/

 
    
    dltList = []; //created variable to dlt data

    deltedData(event){
        showMyData()
        .then((res)=>{
            //console.log(res) --> this confirm when you click on button in browser console data is showing or not
            this.dltList = res;
        })
    
        var deleteData = event.target.value;
        this.dltList.splice(deleteData,1);
    }

    

}