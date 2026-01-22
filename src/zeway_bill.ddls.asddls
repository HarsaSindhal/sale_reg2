@AbapCatalog.sqlViewName: 'ZEWAYBILL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Eway Bill Details'
@Metadata.ignorePropagatedAnnotations: true
define view ZEWAY_BILL as select from YJ1IG_EWAYBILLDD
{
    key Ebillno,
    key Docno,
    Vdtodate ,
    Vdfmdate
}
  where Status = 'A'
