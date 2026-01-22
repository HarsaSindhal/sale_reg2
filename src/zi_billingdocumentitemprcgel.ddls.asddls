@AbapCatalog.sqlViewName: 'YCDSPRBI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds Billing Summary'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_BillingDocumentItemPrcgEl as select from I_BillingDocumentItemPrcgElmnt
{
    key BillingDocument,
    key BillingDocumentItem,
    sum( ConditionAmount ) as ConditionAmount,
    ConditionRateValue,
    ConditionInactiveReason,
    ConditionType,
    ConditionRateRatio,
    ConditionRateAmount
} 
 where ConditionInactiveReason <> 'X'
group by 
      BillingDocument,
      BillingDocumentItem,
      ConditionRateValue,
      ConditionInactiveReason,
      ConditionType,
      ConditionRateRatio,
      ConditionRateAmount
