@AbapCatalog.sqlViewName: 'ZIRNDATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Irn data for sale register'
@Metadata.ignorePropagatedAnnotations: true
define view ZIRN_DATA as select from YEINVOICE_CDSS
{
    key BillingDocument,
    key AckNo,
    AckDate,
    Irn,
    Ebillno
}

group by   BillingDocument,
    AckNo,
    AckDate,
    Irn,
    Ebillno
