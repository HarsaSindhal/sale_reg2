@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZBILL_PRICE_CONDITION'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBILL_PRICE_CONDITION as select from  I_BillingDocumentItem as a

association [1..*] to ZI_BillingDocumentItemPrcgEl as ZR00 on ( ZR00.BillingDocument = $projection.BillingDocument and ZR00.BillingDocumentItem = $projection.BillingDocumentItem and ZR00.ConditionAmount is not initial and ( ZR00.ConditionType = 'ZR00' or ZR00.ConditionType = 'ZR01' ) and ZR00.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as PCIP on ( PCIP.BillingDocument = $projection.BillingDocument and PCIP.BillingDocumentItem = $projection.BillingDocumentItem and PCIP.ConditionAmount is not initial and ( PCIP.ConditionType = 'PCIP' ) and PCIP.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JOCG on ( JOCG.BillingDocument = $projection.BillingDocument and JOCG.BillingDocumentItem = $projection.BillingDocumentItem and JOCG.ConditionAmount is not initial and JOCG.ConditionType = 'JOCG' and JOCG.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JOSG on ( JOSG.BillingDocument = $projection.BillingDocument and JOSG.BillingDocumentItem = $projection.BillingDocumentItem and JOSG.ConditionAmount is not initial and JOSG.ConditionType = 'JOSG' and JOSG.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JOIG on ( JOIG.BillingDocument = $projection.BillingDocument and JOIG.BillingDocumentItem = $projection.BillingDocumentItem and JOIG.ConditionAmount is not initial and JOIG.ConditionType = 'JOIG' and JOIG.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JOUG on ( JOUG.BillingDocument = $projection.BillingDocument and JOUG.BillingDocumentItem = $projection.BillingDocumentItem and JOUG.ConditionAmount is not initial and JOUG.ConditionType = 'JOUG' and JOUG.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JTC1 on ( JTC1.BillingDocument = $projection.BillingDocument and JTC1.BillingDocumentItem = $projection.BillingDocumentItem and JTC1.ConditionAmount is not initial and JTC1.ConditionType = 'JTC1' and JTC1.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JTC2 on ( JTC2.BillingDocument = $projection.BillingDocument and JTC2.BillingDocumentItem = $projection.BillingDocumentItem and JTC2.ConditionAmount is not initial and JTC2.ConditionType = 'JTC2' and JTC2.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as JTCB on ( JTCB.BillingDocument = $projection.BillingDocument and JTCB.BillingDocumentItem = $projection.BillingDocumentItem and JTCB.ConditionAmount is not initial and JTCB.ConditionType = 'JTCB' and JTCB.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZTCS on ( ZTCS.BillingDocument = $projection.BillingDocument and ZTCS.BillingDocumentItem = $projection.BillingDocumentItem and ZTCS.ConditionAmount is not initial and ZTCS.ConditionType = 'ZTCS' and ZTCS.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZDOF on ( ZDOF.BillingDocument = $projection.BillingDocument and ZDOF.BillingDocumentItem = $projection.BillingDocumentItem and ZDOF.ConditionAmount is not initial and ZDOF.ConditionType = 'ZDOF' and ZDOF.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZCDI on ( ZCDI.BillingDocument = $projection.BillingDocument and ZCDI.BillingDocumentItem = $projection.BillingDocumentItem and ZCDI.ConditionAmount is not initial and ZCDI.ConditionType = 'ZCDI' and ZCDI.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZFES on ( ZFES.BillingDocument = $projection.BillingDocument and ZFES.BillingDocumentItem = $projection.BillingDocumentItem and ZFES.ConditionAmount is not initial and (ZFES.ConditionType = 'ZFO1' or ZFES.ConditionType = 'ZFO2' or ZFES.ConditionType = 'ZFO3') and ZFES.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZPFA on ( ZPFA.BillingDocument = $projection.BillingDocument and ZPFA.BillingDocumentItem = $projection.BillingDocumentItem and ZPFA.ConditionAmount is not initial and ZPFA.ConditionType = 'ZPFA' and ZPFA.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZSHE on ( ZSHE.BillingDocument = $projection.BillingDocument and ZSHE.BillingDocumentItem = $projection.BillingDocumentItem and ZSHE.ConditionAmount is not initial and ZSHE.ConditionType = 'ZSHE' and ZSHE.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZDIS on ( ZDIS.BillingDocument = $projection.BillingDocument and ZDIS.BillingDocumentItem = $projection.BillingDocumentItem and ZDIS.ConditionAmount is not initial and ZDIS.ConditionType = 'ZDIS' and ZDIS.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZDQT on ( ZDQT.BillingDocument = $projection.BillingDocument and ZDQT.BillingDocumentItem = $projection.BillingDocumentItem and ZDQT.ConditionAmount is not initial and ZDQT.ConditionType = 'ZDQT' and ZDQT.ConditionInactiveReason != 'X' )
association [1..*] to ZI_BillingDocumentItemPrcgEl as ZCDE on ( ZCDE.BillingDocument = $projection.BillingDocument and ZCDE.BillingDocumentItem = $projection.BillingDocumentItem and ZCDE.ConditionAmount is not initial and ZCDE.ConditionType = 'ZCDE' and ZCDE.ConditionInactiveReason != 'X' )

{
    
    key a.BillingDocument ,
    key a.BillingDocumentItem , 
    
 case when ZR00.ConditionAmount <> 0 then
      cast(ZR00.ConditionAmount as abap.dec( 25, 2 ) )
      else cast(PCIP.ConditionAmount as abap.dec( 25, 2 ) ) end as ZR00_AMT  ,
      cast(ZCDI.ConditionAmount as abap.dec( 25, 2 ) ) as ZD01_AMT  ,
      cast(ZFES.ConditionAmount as abap.dec( 25, 2 ) ) as ZFES_AMT  ,
      cast(ZPFA.ConditionAmount as abap.dec( 25, 2 ) ) as ZF01_AMT  ,
      cast(JOCG.ConditionAmount as abap.dec( 25, 2 ) ) as JOCG_AMT  ,
      cast(JOSG.ConditionAmount as abap.dec( 25, 2 ) ) as JOSG_AMT  ,
      cast(JOIG.ConditionAmount as abap.dec( 25, 2 ) ) as JOIG_AMT  ,
      cast(JOUG.ConditionAmount as abap.dec( 25, 2 ) ) as JOUG_AMT  ,
      cast(JTC1.ConditionAmount as abap.dec( 25, 2 ) ) as JTC1_AMT  ,
      cast(JTC2.ConditionAmount as abap.dec( 25, 2 ) ) as JTC2_AMT  ,
      cast(JTCB.ConditionAmount as abap.dec( 25, 2 ) ) as JTCB_AMT  ,
      cast(ZDOF.ConditionAmount as abap.dec( 25, 2 ) ) as ZROF_AMT  ,
      cast(ZTCS.ConditionAmount as abap.dec( 25, 2 ) ) as ZTCS_AMT  ,
 
      coalesce( cast(ZCDI.ConditionAmount as abap.dec( 25, 2 ) ) ,0 ) + 
      coalesce( cast(ZCDE.ConditionAmount as abap.dec( 25, 2 ) ) ,0 ) + 
      coalesce( cast(ZFES.ConditionAmount as abap.dec( 25, 2 ) ) ,0 ) as tot_dis ,     
      
 case when ZR00.ConditionRateValue  <> 0 then
      cast(ZR00.ConditionRateValue as abap.dec( 25, 2 ) )
      else cast(PCIP.ConditionRateValue as abap.dec( 25, 2 ) ) end as ZR00_RATE ,
      cast(ZCDI.ConditionRateValue as abap.dec( 25, 2 ) ) as ZD01_RATE  ,
      cast(ZPFA.ConditionRateValue as abap.dec( 25, 2 ) ) as ZF01_RATE  ,
      cast(JOCG.ConditionRateValue as abap.dec( 25, 2 ) ) as JOCG_RATE  ,
      cast(JOSG.ConditionRateValue as abap.dec( 25, 2 ) ) as JOSG_RATE  ,
      cast(JOIG.ConditionRateValue as abap.dec( 25, 2 ) ) as JOIG_RATE  ,
      cast(JOUG.ConditionRateValue as abap.dec( 25, 2 ) ) as JOUG_RATE  ,
      cast(JTC1.ConditionRateValue as abap.dec( 25, 2 ) ) as JTC1_RATE  ,
      cast(JTC2.ConditionRateValue as abap.dec( 25, 2 ) ) as JTC2_RATE  ,
      cast(JTCB.ConditionRateValue as abap.dec( 25, 2 ) ) as JTCB_RATE  ,
      cast(ZDOF.ConditionRateValue as abap.dec( 25, 2 ) ) as ZROF_RATE  ,
      cast(ZTCS.ConditionRateValue as abap.dec( 25, 2 ) ) as ZTCS_RATE  ,
      cast(ZSHE.ConditionRateValue as abap.dec( 25, 2 ) ) as ZSHE_RATE  ,
      cast(ZSHE.ConditionAmount as abap.dec( 25, 2 ) ) as ZSHE_AMT  ,
      cast(ZDQT.ConditionRateValue as abap.dec( 25, 2 ) ) as ZDQT_RATE  ,
      cast(ZDQT.ConditionAmount as abap.dec( 25, 2 ) ) as ZDQT_amt  ,
      cast(ZCDE.ConditionAmount as abap.dec( 25, 2 ) ) as ZCDE_amt  ,
    
      cast(ZDIS.ConditionRateValue as abap.dec( 25, 2 ) ) as ZDIS_RATE,  
      cast(ZDIS.ConditionAmount as abap.dec( 25, 2 ) ) as ZDIS_AMT  
    
    
}

 group by 
 a.BillingDocument ,
 a.BillingDocumentItem,
ZR00.ConditionAmount,
PCIP.ConditionAmount ,
ZCDI.ConditionAmount,
ZCDE.ConditionAmount,
ZFES.ConditionAmount,
ZPFA.ConditionAmount,
JOCG.ConditionAmount,
JOSG.ConditionAmount,
JOIG.ConditionAmount,
JOUG.ConditionAmount,
JTC1.ConditionAmount,
JTC2.ConditionAmount,
JTCB.ConditionAmount,
ZDOF.ConditionAmount,
ZTCS.ConditionAmount,
ZR00.ConditionRateValue,
PCIP.ConditionRateValue,
ZCDI.ConditionRateValue,
ZPFA.ConditionRateValue,
JOCG.ConditionRateValue,
JOSG.ConditionRateValue,
JOIG.ConditionRateValue,
JOUG.ConditionRateValue,
JTC1.ConditionRateValue,
JTC2.ConditionRateValue,
JTCB.ConditionRateValue,
ZDOF.ConditionRateValue,
ZTCS.ConditionRateValue,
ZSHE.ConditionRateValue,
ZSHE.ConditionRateValue,
ZSHE.ConditionAmount ,
ZDQT.ConditionRateValue,
ZDQT.ConditionAmount ,
ZDIS.ConditionRateValue,
ZDIS.ConditionAmount 
  
 