@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gl Code'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZGL_CODE2 as select distinct from I_GLAccountLineItemSemTag
{
    key AccountingDocument ,
    key CompanyCode,
    key FiscalYear,
    key Material,
    GLAccount
} where Ledger = '0L' and GLAccount like '0003%'

group by 
AccountingDocument ,
    CompanyCode,
    FiscalYear,
    Material,
    GLAccount
