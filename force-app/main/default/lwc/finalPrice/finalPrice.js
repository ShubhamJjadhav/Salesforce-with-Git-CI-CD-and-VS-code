import { LightningElement } from 'lwc';

export default class FinalPrice extends LightningElement {
    PriceForColours;
    PriceForHeadlight;
    PriceForTransmission;
    totalPrice;
  
    handleNumberOneChange(event) {
        this.PriceForColours = parseInt(event.target.value);
    }
    handleNumberTwoChange(event) {
        this.PriceForHeadlight = parseInt(event.target.value);
    }
    handleNumberThreeChange(event) {
        this.PriceForTransmission = parseInt(event.target.value);
    }
    addition() {
        this.totalPrice = parseInt(this.PriceForColours) + parseInt(this.PriceForHeadlight) + parseInt(this.PriceForTransmission)   ;
    }
}