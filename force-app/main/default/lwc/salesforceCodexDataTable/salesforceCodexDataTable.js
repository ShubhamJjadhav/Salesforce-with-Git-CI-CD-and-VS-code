import LightningDatatable from 'lightning/datatable';
import imageTableControl from './imageTableControl.html';

export default class salesforceCodexDataTable extends LightningDatatable  {
    static customTypes = {
        image: {
            template: imageTableControl
        }
    };
}