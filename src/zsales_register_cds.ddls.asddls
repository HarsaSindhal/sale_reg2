@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZSALES_REGISTER_CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{ 
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSALES_REGISTER_CDS  as select distinct from I_BillingDocumentBasic as A
 inner join I_BillingDocumentItem as B on ( B.BillingDocument = A.BillingDocument )
 left outer join I_BillingDocumentItemBasic as a1 on ( a1.BillingDocument = B.BillingDocument and a1.BillingDocumentItem = B.BillingDocumentItem )
 left outer join I_CustomerGroupText as b1 on a1.SalesOrderCustomerGroup = b1.CustomerGroup and b1.Language = 'E'
 left outer join I_CalendarMonthText as aa on aa.CalendarMonth = substring( A.BillingDocumentDate,5,2) and aa.Language = 'E' 
 left outer join I_UnitOfMeasureText as unit on unit.UnitOfMeasure = B.BillingQuantityUnit and unit.Language = 'E'
 left outer join I_PaymentTermsText  as pay on pay.PaymentTerms = A.CustomerPaymentTerms and pay.Language = 'E'
  left outer join I_IncotermsClassificationText as inco on ( inco.IncotermsClassification = A.IncotermsClassification and inco.Language = 'E')
 left outer join ZPORT as prt on ( prt.BILL = A.BillingDocument )
 left outer join zpregen_exim as port on ( port.docno = prt.BillingDocument and port.doctype = 'PO' )
 left outer join yexim_calculat as con on ( con.docno = prt.BillingDocument and con.doctype = 'PO')
 left outer join ZSD_SR_BilltoParty as BILL on ( BILL.BillingDocument = A.BillingDocument )
 left outer join ZSD_SR_ShipToParty as SHIP on ( SHIP.BillingDocument = A.BillingDocument )
 left outer join ZSD_SR_soldtoParty as SOLD on ( SOLD.BillingDocument = A.BillingDocument )

 left outer join I_BillingDocumentPartner     as transporterPARTNR           on  A.BillingDocument              = transporterPARTNR.BillingDocument
                                                                               and transporterPARTNR.PartnerFunction = 'SP'
 left outer join I_Supplier                  as transporterPARTNRADDRESS on transporterPARTNR.Supplier = transporterPARTNRADDRESS.Supplier
 left outer join I_Supplier                  as trans on trans.Supplier = A.YY1_Transporter_BDH   
                                                                            
 left outer join ZSD_SR_Transporter as TRNS on ( TRNS.BillingDocument = A.BillingDocument )
 left outer join ZBILL_PRICE_CONDITION as pr on ( pr.BillingDocument = B.BillingDocument and pr.BillingDocumentItem = B.BillingDocumentItem  )
 left outer join I_Customer as P on ( P.Customer = A.PayerParty  )
 left outer join I_AddressEmailAddress_2 as mail on ( mail.AddressID = P.AddressID  )
 left outer join ZSD_SODATA as SO on ( SO.SalesDocument = B.SalesDocument and SO.SalesDocumentItem = B.SalesDocumentItem )
 left outer join ZDEL_DATA as DEL on ( DEL.DeliveryDocument = B.ReferenceSDDocument and DEL.DeliveryDocumentItem = B.ReferenceSDDocumentItem )
 left outer join I_ProductPlantBasic as HSN on ( HSN.Product = B.Material and HSN.Plant = B.Plant )
 left outer join I_Product as pm on ( pm.Product = B.Material )
 left outer join I_Plant as PL on ( PL.Plant = B.Plant  )
 left outer join ZIRN_DATA  as irn on ( irn.BillingDocument = A.BillingDocument )
 left outer join ZEWAY_BILL as ewy on ( ewy.Docno = A.BillingDocument  )
 left outer join ZBILL_GLACCOUNT as gl on ( gl.BillingDocument = A.BillingDocument and  gl.TaxItemAcctgDocItemRef = B.BillingDocumentItem  )
 left outer join ZBILL_ACC_DOC as Adoc on ( Adoc.BillingDocument = A.BillingDocument and Adoc.CompanyCode = A.CompanyCode and  Adoc.FiscalYear = A.FiscalYear )
// left outer join ZGL_CODE2 as gl on Adoc.AccountingDocument = gl.AccountingDocument and  gl.CompanyCode = Adoc.CompanyCode and 
//                                              gl.FiscalYear = Adoc.FiscalYear and gl.Material = B.Material
 left outer join I_BillingDocumentTypeText as L on ( L.BillingDocumentType = A.BillingDocumentType and L.Language = 'E' )
 left outer join I_SalesOrganizationText as M on ( M.SalesOrganization = A.SalesOrganization and M.Language = 'E' )
 left outer join I_DistributionChannelText as N on ( N.DistributionChannel = A.DistributionChannel and N.Language = 'E' )
 left outer join I_DivisionText as O on ( O.Division = pm.Division and O.Language = 'E' )
 left outer join I_ProductDescription_2 as MAT on ( MAT.Product = B.Material and MAT.Language = 'E' )
 left outer join I_ProductUnitsOfMeasure as AL on ( AL.Product = B.Material and  ( AL.AlternativeUnit = 'CS' or AL.AlternativeUnit = 'BAG' ))
 left outer join I_MatlAccountAssignmentGroupT as ACC on ( ACC.MatlAccountAssignmentGroup = B.MatlAccountAssignmentGroup and ACC.Language = 'E' )
 left outer join I_AdditionalMaterialGroup1Text as mat1 on B.AdditionalMaterialGroup1= mat1.AdditionalMaterialGroup1 and mat1.Language = 'E'
 left outer join I_AdditionalMaterialGroup2Text as mat2 on B.AdditionalMaterialGroup2 = mat2.AdditionalMaterialGroup2 and mat2.Language = 'E'
 left outer join I_AdditionalMaterialGroup3Text as mat3 on B.AdditionalMaterialGroup3 = mat3.AdditionalMaterialGroup3 and mat3.Language = 'E'
 left outer join I_AdditionalMaterialGroup4Text as mat4 on B.AdditionalMaterialGroup4 = mat4.AdditionalMaterialGroup4 and mat4.Language = 'E'
 left outer join I_AdditionalMaterialGroup5Text as mat5 on B.AdditionalMaterialGroup5 = mat5.AdditionalMaterialGroup5 and mat5.Language = 'E'
                                               
{
  key A.BillingDocument ,
  key B.BillingDocumentItem ,
      A.FiscalYear ,
      A.CompanyCode ,
      B.Plant ,
      a1.SalesOrderCustomerGroup,
      b1.CustomerGroupName,
      a1.BaseUnit,
      a1.BillingToBaseQuantityNmrtr as SKU,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'      
      a1.MRPRequiredQuantityInBaseUnit as Total_quantity_in_SKU,
      B.Country ,
      PL.PlantName ,
      B.ShippingPoint ,
      A.SalesOrganization ,
      M.SalesOrganizationName ,
      N.DistributionChannelName ,
      O.DivisionName ,
      A.IncotermsClassification ,
      inco.IncotermsClassificationName,
      A.YY1_VehicleNo_BDH,
      A.YY1_LRNO1_BDH,
      A.IncotermsLocation1 ,
      A.CustomerPaymentTerms ,
      pay.PaymentTermsName,
      A.BillingDocumentType ,
      L.BillingDocumentTypeName ,
      A.AccountingTransferStatus ,
      A.SDDocumentCategory ,
      A.PayerParty ,
      P.CustomerName ,
      P.TelephoneNumber1 as mob_no,
      mail.EmailAddress,
      port.portofloading,
      port.portofdischarge,
      port.final_destination,
      Adoc.AccountingDocument ,
      case when B.BillingQuantityUnit = 'NO' or B.BillingQuantityUnit = 'PAK'
           then division( cast(B.BillingQuantity as abap.dec( 13, 3 )) , cast(AL.QuantityNumerator as abap.dec( 13, 3) ) , 3 ) 
           else null end as Case_bag ,
    //  AL.AlternativeUnit,     

      B.StorageLocation ,
      B.BillingQuantityUnit ,
      case when A.BillingDocumentIsCancelled = 'X'  or A.BillingDocumentType = 'CBRE' or A.BillingDocumentType = 'G2'
         then cast('-1'  as abap.dec( 2, 0 ) )
         else cast('1' as abap.dec( 2, 0 ) ) end as Negamt ,
      
      
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
      B.BillingQuantityInBaseUnit ,
      unit.UnitOfMeasureLongName as UnitOfMeasureName,
        
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
       B.BillingQuantity ,
      
      B.BillingDocumentItemText ,
      B.TransactionCurrency ,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
       B.NetAmount ,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
       B.TaxAmount  ,
      
      
      case when pr.tot_dis < 0 then pr.tot_dis * -1 else pr.tot_dis end as tot_dis,
      
//    ( coalesce( pr.ZF01_AMT, 0 ) + coalesce( pr.ZI01_AMT, 0 ) + coalesce( pr.ZP01_AMT, 0 ) + coalesce( pr.ZBAS_AMT, 0 ) +
//     coalesce( pr.ZP02_AMT, 0 ) + coalesce( pr.ZPOS_AMT, 0 ) + coalesce( pr.ZC01_AMT, 0 ) )   as TotalTaxableAmount ,
      
    ( cast (  cast(B.TaxAmount as abap.dec( 15, 3 ) ) +   
    coalesce( pr.ZSHE_AMT, 0 ) + coalesce( pr.ZDQT_amt, 0 ) + coalesce( pr.ZDIS_AMT, 0 ) + coalesce( pr.ZCDE_amt, 0 ) + coalesce( pr.ZR00_AMT, 0 ) + 
    coalesce( pr.ZROF_AMT, 0 ) + coalesce( pr.ZD01_AMT , 0 ) + coalesce( pr.ZFES_AMT, 0 )  as abap.dec( 20, 2 ) ) )   as TotalInvocieAmount ,

      
      B.ItemWeightUnit ,
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
       B.ItemNetWeight ,
      @Semantics.quantity.unitOfMeasure: 'ItemWeightUnit'
       B.ItemGrossWeight   ,
//      B.PriceDetnExchangeRate ,
      A.AccountingExchangeRate as PriceDetnExchangeRate ,
      B.Division as materialdevision ,
      A.BillingDocumentDate ,
      aa.CalendarMonthName,
      SO.RequestedDeliveryDate ,
      
      case when SO.RequestedDeliveryDate is not initial 
      then dats_days_between( SO.RequestedDeliveryDate , A.BillingDocumentDate ) 
       else 0 end as  zDays ,
      
      B.ReferenceSDDocument ,
      B.ReferenceSDDocumentItem ,
      
      B.SalesDocument ,
      B.SalesDocumentItem ,
      SO.SalesDocumentDate ,
      SO.SalesDocumentType ,
      SO.PurchaseOrderByCustomer as SO_poref ,
      SO.CustomerPurchaseOrderDate ,
      SO.Quatation ,
      
      case when DEL.MaterialByCustomer is not initial
       then DEL.MaterialByCustomer
       else SO.MaterialByCustomer end as MaterialByCustomer  ,
       
       SO.PurchaseOrderByCustomer   as PurchaseOrderByCustomer  ,
      
      B.Material ,
      HSN.ConsumptionTaxCtrlCode as HSN ,
      B.BillingDocumentItemText as ProductDescription ,
//      MAT.ProductDescription ,
      B.MaterialGroup ,
     
      ACC.MatlAccountAssignmentGroupName ,
      B.AdditionalMaterialGroup1 ,
      mat1.AdditionalMaterialGroup1Name,
      B.AdditionalMaterialGroup2 ,
      mat2.AdditionalMaterialGroup2Name,
      B.AdditionalMaterialGroup3 ,
      mat3.AdditionalMaterialGroup3Name,      
      B.AdditionalMaterialGroup4 ,
      mat4.AdditionalMaterialGroup4Name,      
      B.AdditionalMaterialGroup5 ,
      mat5.AdditionalMaterialGroup5Name,      
      
      B.TaxCode,
   cast( (   coalesce( pr.ZSHE_AMT, 0 ) + coalesce( pr.ZCDE_amt, 0 ) +  coalesce( pr.ZD01_AMT , 0 ) + coalesce( pr.ZFES_AMT, 0 ) +
     coalesce( pr.ZDQT_amt, 0 ) + coalesce( pr.ZDIS_AMT, 0 ) + coalesce( pr.ZR00_AMT, 0 ) ) as abap.dec( 16, 3 ))   as Taxablevalue ,
      
      
      SHIP.Customer    as SHIPCUSTOMER,
      SHIP.ShipToParty as ShipToPartyname,
      SHIP.Region      as shipRegion,
      SHIP.CityName   as shipCityName,
      SHIP.PostalCode as shipPostalCode,
      SHIP.TaxNumber3 as shipTaxNumber3,
      SHIP.RegionName as shipRegionName ,
      SHIP.ShipToadd as ShipToadd ,
      
      BILL.Customer   as BILLCustomer,
      BILL.BillToName,
      BILL.Region     as BillRegion,
      BILL.CityName   as billCityName,
      BILL.PostalCode as billPostalCode,
      BILL.TaxNumber3 as billTaxNumber3,
      BILL.RegionName as billRegionName  ,
      BILL.billToadd as billToadd  ,
      
      SOLD.Customer   as SOLDCustomer,
      SOLD.SOLDToParty,
      SOLD.Region     as SOLDRegion,
      SOLD.CityName   as SOLDCityName,
      SOLD.PostalCode as SOLDPostalCode,
      SOLD.TaxNumber3 as SOLDTaxNumber3,
      SOLD.RegionName as SOLDRegionName  ,
      
   //   TRNS.Customer   as TRNSCustomer,  hbnin
 case when trans.Supplier <> ''
      then trans.Supplier else  
      transporterPARTNRADDRESS.Supplier
      end as TRNSCustomer,
      
 case when trans.SupplierName <> ''
      then trans.SupplierName else  
      transporterPARTNRADDRESS.SupplierName 
      end as TransporterName,
      
//    TRNS.TransporterName,
      TRNS.Region     as TRNSRegion,
      TRNS.CityName   as TRNSCityName,
      TRNS.PostalCode as TRNSPostalCode,
      TRNS.TaxNumber3 as TRNSTaxNumber3,
      TRNS.RegionName as TRNSRegionName  ,
      
      
      case 
      when A.BillingDocumentType <> 'F8'
      then case when A.BillingDocumentIsCancelled = 'X' 
      then 'YES' else 'NO' end 
      when A.BillingDocumentType = 'F8' 
      then case when A.AccountingTransferStatus = 'E' 
      then 'YES' else 'NO' end
      else '' end as BillingDocumentIsCancelled  ,
      
      
      A.CancelledBillingDocument ,
      pm.ExternalProductGroup ,
      pm._ExtProdGrpText[ Language = 'E' ].ExternalProductGroupName as ExternalProductGroupName ,
      
      irn.AckNo ,
      irn.AckDate ,
      irn.Irn ,
      ewy.Ebillno ,
      ewy.Vdfmdate ,
      ewy.Vdtodate ,
      
       pr.ZR00_AMT  ,
       pr.ZD01_AMT  ,
       pr.ZF01_AMT  , 
       pr.ZFES_AMT,
       pr.JOCG_AMT  ,
       pr.JOSG_AMT  ,
       pr.JOIG_AMT   ,
       pr.ZTCS_AMT   ,
       pr.ZROF_AMT   ,
      /////////
      pr.ZR00_RATE ,
      pr.JOCG_RATE ,
      pr.JOSG_RATE ,
      pr.JOIG_RATE ,
      pr.ZSHE_RATE ,
      pr.ZSHE_AMT,
      pr.ZDIS_RATE ,
      pr.ZDIS_AMT,
      pr.ZCDE_amt,
      pr.ZDQT_RATE ,
      pr.ZTCS_RATE ,
      
      
      
      gl.GLAccount as GLAccount_M ,
      A.DistributionChannel ,
      pm.Division ,
      B.MatlAccountAssignmentGroup ,
      gl.GLAccount
      
} 

 where
        A.BillingDocumentType <> 'S1'
   and  A.BillingDocumentType <> 'S2'
   and  A.BillingDocumentType <> 'S3'
// and  A.BillingDocumentType <> 'JSN'
// and  A.BillingDocumentType <> 'JSP'
// and  A.BillingDocumentType <> 'JVR'
// and  A.AccountingTransferStatus <> 'E'
// and  A.BillingDocumentIsCancelled <> 'X'
 
 
 
