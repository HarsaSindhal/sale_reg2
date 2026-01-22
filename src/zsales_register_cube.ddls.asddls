
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSALES_REGISTER_CUBE'
@Metadata.ignorePropagatedAnnotations: true
@UI: { headerInfo: { typeName: 'Report', typeNamePlural: 'Sales Register Report'  } }
define root view entity ZSALES_REGISTER_CUBE
  as select from ZSALES_REGISTER_CDS as A
   left outer join ZGL_CODE2 as gl on A.AccountingDocument = gl.AccountingDocument and  gl.CompanyCode = A.CompanyCode and 
                                              gl.FiscalYear = A.FiscalYear and gl.Material = A.Material
{

         @EndUserText.label       : 'Billing Document' 
         @UI.selectionField       : [{ position: 1 }]
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZBILLDOC_F4', element: 'BillingDocument' } }]
         @UI.lineItem             : [{ position: 1 }]
  key    A.BillingDocument, 
         @UI.lineItem             : [{ position: 1 }]
         @UI.selectionField       : [{ position: 2 }]
         @EndUserText.label       : 'Billing Document Date'
  key    A.BillingDocumentDate,
  
         @UI.lineItem             : [{ position: 1 }]
         @EndUserText.label       : 'Billing Document Month'
  key    A.CalendarMonthName,
  
 //      @UI.lineItem             : [{ position: 11 }]
         @EndUserText.label       : 'Cancelled Invoice No.'
  key    A.CancelledBillingDocument,
         @UI.lineItem             : [{ position: 11 }]
         @EndUserText.label       : 'Billing Item'
  key    A.BillingDocumentItem,
         @UI.lineItem             : [{ position: 11 }]
         @UI.selectionField       : [{ position: 11 }]
         @EndUserText.label       : 'Material'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPRODUCT_F4', element: 'Product' } }]
  key    A.Material,
         @UI.lineItem             : [{ position: 12 }]
         @EndUserText.label       : 'Material Description'
  key    A.ProductDescription,
         @UI.lineItem             : [{ position: 13 }]
         @UI.selectionField       : [{ position: 13 }]
         @EndUserText.label       : 'Plant'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZPLANT_F4', element: 'Plant' } }]
  key    A.Plant,
         @UI.lineItem             : [{ position: 14 }]
         @EndUserText.label       : 'Plant Name'
  key    A.PlantName,
         @UI.lineItem             : [{ position: 61 }]
         @EndUserText.label       : 'Fiscal Year'
  key    A.FiscalYear,
         @UI.lineItem             : [{ position: 21 }]
         @EndUserText.label       : 'Company Code'
  key    A.CompanyCode,
         @UI.lineItem             : [{ position: 5 }]
         @UI.selectionField       : [{ position: 5 }]
         @EndUserText.label       : 'Billing Type'
         @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZBILLTYPE_F4', element: 'BillingDocumentType' } }]
  key    A.BillingDocumentType,
         @UI.lineItem             : [{ position: 5 }]
         @EndUserText.label       : 'Billing Type Name'
  key    A.BillingDocumentTypeName,
         //  key A.PayerParty,

//         @UI.lineItem             : [{ position: 21 }]
 //        @UI.selectionField       : [{ position: 21 }]
         @EndUserText.label       : 'Sales Organization'
  key    A.SalesOrganization,
         @UI.lineItem             : [{ position: 21 }]
         @EndUserText.label       : 'Sales Organization Name'
  key    A.SalesOrganizationName,
         @UI.lineItem             : [{ position: 22 }]
         @UI.selectionField       : [{ position: 22 }]
         @EndUserText.label       : 'Distribution Channel'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'ZDistributionChannel_F4', element: 'DistributionChannel' } }]
  key    A.DistributionChannel,
         @UI.lineItem             : [{ position: 22 }]
         @EndUserText.label       : 'Distribution Channel '
  key    A.DistributionChannelName,
         @UI.lineItem             : [{ position: 23 }]
         @UI.selectionField       : [{ position: 23 }]
         @EndUserText.label       : 'Material Division'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'ZDivision_F4', element: 'Division' } }]
  key    A.Division,
         @UI.lineItem             : [{ position: 23 }]
         @EndUserText.label       : 'Material Division Name'
  key    A.DivisionName,
         @UI.lineItem             : [{ position: 24 }]
         @EndUserText.label       : 'Incoterms'
  key    A.IncotermsClassification,
  
           @UI.lineItem             : [{ position: 25 }]
         @EndUserText.label       : 'Incoterms Text'
  key    A.IncotermsClassificationName,
  
           @UI.lineItem             : [{ position: 26 }]
         @EndUserText.label       : 'Vehicle No'
  key    A.YY1_VehicleNo_BDH,
  
           @UI.lineItem             : [{ position: 27 }]
         @EndUserText.label       : 'LR NO'
  key    A.YY1_LRNO1_BDH,
  
           @UI.lineItem             : [{ position: 28 }]
         @EndUserText.label       : 'Port Of Loading'
  key    A.portofloading,
  
           @UI.lineItem             : [{ position: 29 }]
         @EndUserText.label       : 'Port Of Discharge'
  key    A.portofdischarge,
  
           @UI.lineItem             : [{ position: 31 }]
         @EndUserText.label       : 'Final Destination'
  key    A.final_destination,
  
         @UI.lineItem             : [{ position: 180 }]
         @EndUserText.label       : 'Payment Term'
  key    A.CustomerPaymentTerms,
  
         @UI.lineItem             : [{ position: 181 }]
         @EndUserText.label       : 'Payment Term Text'
  key    A.PaymentTermsName,
  
  
         @UI.lineItem             : [{ position: 201 }]
         @EndUserText.label       : 'UOM'
  key    A.BillingQuantityUnit,

         @UI.lineItem             : [{ position: 202 }]
         @EndUserText.label       : 'Unit Of Measure Name'  
  key    A.UnitOfMeasureName,
  
         @UI.lineItem             : [{ position: 61 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Billing Quantity'

  key    case when A.BillingDocumentType = 'G2' or A.BillingDocumentType = 'L2'
       then 0
       else
   cast( A.BillingQuantity as abap.dec( 25, 3 ) ) * A.Negamt                                end as BillingQuantity,

         @UI.lineItem             : [{ position: 220 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Item Net Weight'
         @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
  key    A.ItemNetWeight * A.Negamt                                                             as ItemNetWeight,
         @UI.lineItem             : [{ position: 230 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Item Gross Weight'
         @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
  key    A.ItemGrossWeight * A.Negamt                                                           as ItemGrossWeight,
         @UI.lineItem             : [{ position: 240 }]
         @EndUserText.label       : 'Price Net Exchange Rate'
  key    A.PriceDetnExchangeRate,
         @UI.lineItem             : [{ position: 250 }]
         @EndUserText.label       : 'Transcation Currency'
  key    A.TransactionCurrency,

   //      @UI.lineItem             : [{ position: 260 }]
         @EndUserText.label       : 'Shipping Point'
  key    A.ShippingPoint,
         @UI.lineItem             : [{ position: 270 }]
         @UI.selectionField       : [{ position: 270 }]
         @EndUserText.label       : 'Sales Document'
  key    A.SalesDocument,
 
            @UI.lineItem             : [{ position: 271 }]
         @UI.selectionField       : [{ position: 271 }]
         @EndUserText.label       : 'SalesOrderCustomerGroup'
  key    A.SalesOrderCustomerGroup,
  
           @UI.lineItem             : [{ position: 272 }]
         @UI.selectionField       : [{ position: 272 }]
         @EndUserText.label       : 'CustomerGroupName'
  key    A.CustomerGroupName,

             @UI.lineItem             : [{ position: 273 }]
         @EndUserText.label       : 'Quantity in Case/Bag'
  key    A.Case_bag,
  
             @UI.lineItem             : [{ position: 273 }]
         @EndUserText.label       : 'SKU'
  key    case when A.BillingDocumentType = 'G2' or A.BillingDocumentType = 'L2'
         then 0
         else A.SKU end as SKU,
  
  
   key      A.BaseUnit,
  
  
             @UI.lineItem             : [{ position: 274 }]
         @UI.selectionField       : [{ position: 274 }]
         @Semantics.quantity.unitOfMeasure: 'BaseUnit' 
         @DefaultAggregation: #SUM       
         @EndUserText.label       : 'Total Quantity In SKU'
  key   case when A.BillingDocumentType = 'G2' or A.BillingDocumentType = 'L2'
        then 0
        else cast( A.Total_quantity_in_SKU  as abap.dec( 23, 3 ) ) end as Total_quantity_in_SKU,
  
         @UI.lineItem             : [{ position: 280 }]
         @EndUserText.label       : 'Material Group'
  key    A.MaterialGroup,
  
           @UI.lineItem             : [{ position: 281 }]
         @EndUserText.label       : 'Material Group 1'
     key A.AdditionalMaterialGroup1 ,
     
           @UI.lineItem             : [{ position: 282 }]
         @EndUserText.label       : 'Material Group 1 Text'
     key A.AdditionalMaterialGroup1Name , 
     
              @UI.lineItem             : [{ position: 283 }]
         @EndUserText.label       : 'Material Group 2'
     key A.AdditionalMaterialGroup2 ,
     
              @UI.lineItem             : [{ position: 284 }]
         @EndUserText.label       : 'Material Group 2 Text'
     key A.AdditionalMaterialGroup2Name ,  
     
              @UI.lineItem             : [{ position: 285 }]
         @EndUserText.label       : 'Material Group 3'
     key A.AdditionalMaterialGroup3 ,
   
              @UI.lineItem             : [{ position: 286 }]
         @EndUserText.label       : 'Material Group 3 Text'
     key A.AdditionalMaterialGroup3Name ,
     
              @UI.lineItem             : [{ position: 287 }]
         @EndUserText.label       : 'Material Group 4'
     key A.AdditionalMaterialGroup4 ,
     
                @UI.lineItem             : [{ position: 288 }]
         @EndUserText.label       : 'Material Group 4 Text'
     key A.AdditionalMaterialGroup4Name ,
     
              @UI.lineItem             : [{ position: 289 }]
         @EndUserText.label       : 'Material Group 5'
     key A.AdditionalMaterialGroup5 ,
     
     
                @UI.lineItem             : [{ position: 290 }]
         @EndUserText.label       : 'Material Group 5 Text'
     key A.AdditionalMaterialGroup5Name,
  
         @UI.lineItem             : [{ position: 291 }]
         @EndUserText.label       : 'Country'
  key    A.Country,
         @UI.lineItem             : [{ position: 300 }]
         @EndUserText.label       : 'Order Date'
  key    A.SalesDocumentDate,
         @UI.lineItem             : [{ position: 301 }]
         @EndUserText.label       : 'Customer Part Code'
  key    A.MaterialByCustomer,
         @UI.lineItem             : [{ position: 310 }]
         @EndUserText.label       : 'Customer Ref'
  key    A.PurchaseOrderByCustomer,
         @UI.lineItem             : [{ position: 320 }]
         @EndUserText.label       : 'Customer Ref Date'
  key    A.CustomerPurchaseOrderDate,
         @UI.lineItem             : [{ position: 330 }]
         @UI.selectionField       : [{ position: 330 }]
         @EndUserText.label       : 'HSN'
  key    A.HSN,
         @UI.lineItem             : [{ position: 340 }]
         @EndUserText.label       : 'Delivey Doc'
  key    A.ReferenceSDDocument,
         @UI.lineItem             : [{ position: 350 }]
         @EndUserText.label       : 'Bill To'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'I_Customer', element: 'Customer' } }]
  key    A.BILLCustomer,
         @UI.lineItem             : [{ position: 360 }]
         @EndUserText.label       : 'Bill To Name'
  key    A.BillToName,
         @UI.lineItem             : [{ position: 370 }]
         @EndUserText.label       : 'Bill To City'
  key    A.billCityName,
         @UI.lineItem             : [{ position: 380 }]
         @EndUserText.label       : 'Bill To GSTIN'
  key    A.billTaxNumber3,
         @UI.lineItem             : [{ position: 390 }]
         @EndUserText.label       : 'Bill To Region'
  key    A.BillRegion,
         @UI.lineItem             : [{ position: 400 }]
         @EndUserText.label       : 'Bill To Region Name'
  key    A.billRegionName,
         @UI.lineItem             : [{ position: 410 }]
         @EndUserText.label       : 'Bill To Postal Code'
  key    A.billPostalCode,
         @UI.lineItem             : [{ position: 411 }]
         @EndUserText.label       : 'Bill To Address'
  key    A.billToadd,

         @UI.lineItem             : [{ position: 420 }]
         @EndUserText.label       : 'ShipTo Customer'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'I_Customer', element: 'Customer' } }]
  key    A.SHIPCUSTOMER,
         @UI.lineItem             : [{ position: 430 }]
         @EndUserText.label       : 'ShipTo Customer Name'
  key    A.ShipToPartyname,
         @UI.lineItem             : [{ position: 440 }]
         @EndUserText.label       : 'ShipTo City'
  key    A.shipCityName,
         @UI.lineItem             : [{ position: 450 }]
         @EndUserText.label       : 'ShipTo Postal Code'
  key    A.shipPostalCode,
         @UI.lineItem             : [{ position: 460 }]
         @EndUserText.label       : 'ShipTo Region'
  key    A.shipRegion,
         @UI.lineItem             : [{ position: 470 }]
         @EndUserText.label       : 'ShipTo Region Name'
  key    A.shipRegionName,
         @UI.lineItem             : [{ position: 480 }]
         @EndUserText.label       : 'ShipTo GSTIN'
  key    A.shipTaxNumber3,
         @UI.lineItem             : [{ position: 481 }]
         @EndUserText.label       : 'ShipTo Address'
  key    A.ShipToadd,

 //        @UI.lineItem             : [{ position: 490 }]
  //       @UI.selectionField       : [{ position: 490 }]
         @EndUserText.label       : 'Sold TO Customer'
         @Consumption.valueHelpDefinition: [ { entity:  { name:  'I_Customer', element: 'Customer' } }]
  key    A.SOLDCustomer,
   //      @UI.lineItem             : [{ position: 500 }]
         @EndUserText.label       : 'Sold TO Customer Name'
  key    A.SOLDToParty,
  //       @UI.lineItem             : [{ position: 510 }]
         @EndUserText.label       : 'Sold TO City'
  key    A.SOLDCityName,
   //      @UI.lineItem             : [{ position: 520 }]
         @EndUserText.label       : 'Sold TO Postal Code'
  key    A.SOLDPostalCode,
    //     @UI.lineItem             : [{ position: 530 }]
         @EndUserText.label       : 'Sold TO Region'
  key    A.SOLDRegion,
    //     @UI.lineItem             : [{ position: 540 }]
         @EndUserText.label       : 'Sold TO Region Name'
  key    A.SOLDRegionName,
    //     @UI.lineItem             : [{ position: 550 }]
         @EndUserText.label       : 'Sold TO GSTIN'
  key    A.SOLDTaxNumber3,


         //"""""""""""""""""""""" AMOUNT FIELDS
         @UI.lineItem             : [{ position: 560 }]
         @EndUserText.label       : 'Rate'
  key    A.ZR00_RATE,
  //       @UI.lineItem             : [{ position: 570 }]
         @DefaultAggregation:  #SUM
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         @EndUserText.label       : 'Amount'
  key    A.ZR00_AMT  * A.Negamt                                                                 as ZR00_AMT,
         @UI.lineItem             : [{ position: 570 }]
         @DefaultAggregation:  #SUM
         @EndUserText.label       : 'Amount INR'
  key    cast( ( cast(A.ZR00_AMT as abap.dec( 16, 2 ) ) *  A.PriceDetnExchangeRate )
   * A.Negamt  as abap.dec( 20, 2 ) )                                                           as ZR00_AMT_inr,

         @UI.lineItem             : [{ position: 580 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Cash Discount (ZCDI)'
  key    A.ZD01_AMT  * A.Negamt                                                                 as ZD01_AMT,
  
           @UI.lineItem             : [{ position: 581 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Festival Discount'
  key    A.ZFES_AMT  * A.Negamt                                                                 as ZFES_AMT,
  
  
//         @UI.lineItem             : [{ position: 600 }]
//         @DefaultAggregation: #SUM
//         @Semantics.amount.currencyCode: 'TransactionCurrency'
//         @EndUserText.label       : 'Total Taxable Amount'
//  key    A.TotalTaxableAmount  * A.Negamt                                                       as TotalTaxableAmount,

//         @UI.lineItem             : [{ position: 600 }]
//         @DefaultAggregation: #SUM
//         @EndUserText.label       : 'Total Taxable Amount INR'
//
//  key    cast( cast(A.TotalTaxableAmount as abap.dec( 16, 2 ) ) * A.Negamt
//  * A.PriceDetnExchangeRate as abap.dec( 20, 2 ) )                                              as TotalTaxableAmount_inr,


         @UI.lineItem             : [{ position: 610 }]
         @EndUserText.label       : 'SGST Rate'
  key    A.JOSG_RATE,
         @UI.lineItem             : [{ position: 620 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'SGST Amount'
  key    A.JOSG_AMT * A.Negamt                                                                  as JOSG_AMT,
         @UI.lineItem             : [{ position: 630 }]
         @EndUserText.label       : 'CGST Rate'
  key    A.JOCG_RATE,
         @UI.lineItem             : [{ position: 640 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'CGST Amount'
  key    A.JOCG_AMT * A.Negamt                                                                  as JOCG_AMT,
         @UI.lineItem             : [{ position: 650 }]
         @EndUserText.label       : 'IGST Rate'
  key    A.JOIG_RATE,

         @UI.lineItem             : [{ position: 651 }]
         @EndUserText.label       : 'GST Rate'  
  key    coalesce( A.JOSG_RATE,0 ) + coalesce( A.JOCG_RATE , 0 ) + coalesce( A.JOIG_RATE , 0 ) as Gstrate,
  
         @UI.lineItem             : [{ position: 660 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'IGST Amount'
  key    A.JOIG_AMT * A.Negamt                                                                  as JOIG_AMT,
         @UI.lineItem             : [{ position: 670 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Total Tax Amount'
  key    cast(A.TaxAmount as abap.dec( 25, 2 ) ) * A.Negamt                                     as TaxAmount,
         @UI.lineItem             : [{ position: 671 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Taxable Value'
  key   cast( A.Taxablevalue * A.Negamt * A.PriceDetnExchangeRate as abap.dec( 23, 2 )) as Taxablevalue,

         @UI.lineItem             : [{ position: 672 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Total Discount'
  key A.tot_dis , 

         @UI.lineItem             : [{ position: 673 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Revenue(Taxable value + Total Discount)'
  key   coalesce( cast( A.Taxablevalue * A.Negamt * A.PriceDetnExchangeRate as abap.dec( 23, 2 )) ,0 ) + coalesce( A.tot_dis ,0 ) as Revenue,

    //     @UI.lineItem             : [{ position: 680 }]
         @DefaultAggregation: #SUM
         @Semantics.amount.currencyCode: 'TransactionCurrency'
         @EndUserText.label       : 'Total Invocie Amount'
  key    A.TotalInvocieAmount * A.Negamt                                                        as TotalInvocieAmount,

         @UI.lineItem             : [{ position: 690 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Total Invocie Amount In INR'
  key    cast( A.TotalInvocieAmount * A.PriceDetnExchangeRate as abap.dec( 20, 2 ) ) * A.Negamt as TotalInvocieAmountINR,

         @UI.lineItem             : [{ position: 691 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'TCS tax(ZTCS)'
  key    A.ZTCS_AMT * A.Negamt                                                                  as ZTCS_AMT,

         @UI.lineItem             : [{ position: 691 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'TCS tax(ZTCS) %'
  key    A.ZTCS_RATE * A.Negamt                                                                  as ZTCS_RATE,
    
         @UI.lineItem             : [{ position: 692 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Scheme (ZSHE) %'
  key    A.ZSHE_RATE * A.Negamt                                                                  as ZSHE_RATE,
  
           @UI.lineItem             : [{ position: 692 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Scheme (ZSHE) Amount'
  key    A.ZSHE_AMT                                                                  as ZSHE_AMT,
  
         @UI.lineItem             : [{ position: 693 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Discount (ZDIS) %'
  key    A.ZDIS_RATE * A.Negamt                                                                  as ZDIS_RATE,
  
         @UI.lineItem             : [{ position: 693 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Discount (ZDIS) Amount'
  key    A.ZDIS_AMT                                                                   as ZDIS_AMT,
  
           @UI.lineItem             : [{ position: 694 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Discount (ZCDE) Amount'
  key    A.ZCDE_amt                                                                   as ZCDE_amt,
  
         @UI.lineItem             : [{ position: 694 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'QTY Discount (ZDQT)'
  key    A.ZDQT_RATE * A.Negamt                                                                  as ZDQT_RATE,
   
//         @UI.lineItem             : [{ position: 695 }]
//         @DefaultAggregation: #SUM
//         @EndUserText.label       : 'Basic Amount'
//  key    A.ZBAS_AMT * A.Negamt                                                                  as ZBAS_AMT,
  
         @UI.lineItem             : [{ position: 696 }]
         @EndUserText.label       : 'GLAccount'
  key    gl.GLAccount,
         @UI.lineItem             : [{ position: 697 }]
         @EndUserText.label       : 'Invoice tax code'
  key    A.TaxCode,



         //"""""""""""""" IRN EWAY Data
         @UI.lineItem             : [{ position: 700 }]
         @EndUserText.label       : 'Ack No'
  key    A.AckNo,
         @UI.lineItem             : [{ position: 710 }]
         @EndUserText.label       : 'Ack Date'
  key    A.AckDate,
         @UI.lineItem             : [{ position: 720 }]
         @EndUserText.label       : 'IRN No'
  key    A.Irn,
         @UI.lineItem             : [{ position: 730 }]
         @EndUserText.label       : 'Eway No'
  key    A.Ebillno,
//         @UI.lineItem             : [{ position: 740 }]
//         @EndUserText.label       : 'Eway Bill ValidOn'
//  key    A.Vdfmdate,
         @UI.lineItem             : [{ position: 750 }]
         @EndUserText.label       : 'Eway Bill ValidTo'
  key    A.Vdtodate,


         // """"""""""""""""" TRANSPORTER DATA
         @UI.lineItem             : [{ position: 760 }]
         @EndUserText.label       : 'Transporter Code'
  key    A.TRNSCustomer,
         @UI.lineItem             : [{ position: 770 }]
         @EndUserText.label       : 'Transporter Name'
  key    A.TransporterName,
         @UI.lineItem             : [{ position: 780 }]
         @EndUserText.label       : 'Transporter GSTIN'
  key    A.TRNSTaxNumber3,
         @UI.lineItem             : [{ position: 790 }]
         @EndUserText.label       : 'Transporter Region'
  key    A.TRNSRegion,
         @UI.lineItem             : [{ position: 800 }]
         @EndUserText.label       : 'Transporter Region Name'
  key    A.TRNSRegionName,
         @UI.lineItem             : [{ position: 810 }]
         @EndUserText.label       : 'Transporter City'
  key    A.TRNSCityName,
         @UI.lineItem             : [{ position: 820 }]
         @EndUserText.label       : 'Transporter Postal Code'
  key    A.TRNSPostalCode,

     
         @Consumption.filter.defaultValue: 'NO'
         @UI.lineItem             : [{ position: 830 }]
         @UI.selectionField       : [{ position: 830 }]
         @EndUserText.label       : 'Cancel'
  key    A.BillingDocumentIsCancelled,
         @UI.lineItem             : [{ position: 850 }]
         @EndUserText.label       : 'Material Account Assignment Group'
  key    A.MatlAccountAssignmentGroupName,

         @UI.lineItem             : [{ position: 860 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Freight Charge (ZPFA)'
  key    A.ZF01_AMT * A.Negamt                                                                  as ZF01_AMT,
         @UI.lineItem             : [{ position: 910 }]
         @DefaultAggregation: #SUM
         @EndUserText.label       : 'Rounding Off (ZDOF)'
  key    A.ZROF_AMT * A.Negamt                                                                  as ZROF_AMT,
 
      
      
         @UI.lineItem             : [{ position: 960 }]
         @EndUserText.label       : 'Accounting Document'
  key    A.AccountingDocument,

//         @UI.lineItem             : [{ position: 5000 }]
//         concat( A.fir_url ,A.sec_url   )                                                       as VF03_URL,
         A.ItemWeightUnit


 
}


