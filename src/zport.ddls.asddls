@AbapCatalog.sqlViewName: 'ZZPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Port of loading data'
@Metadata.ignorePropagatedAnnotations: true
define view ZPORT as select from I_BillingDocumentBasic 
{   key BillingDocument as BILL,
    key ltrim(BillingDocument , '0' ) as BillingDocument
}
group by BillingDocument
