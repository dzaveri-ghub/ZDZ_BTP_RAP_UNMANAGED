@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root CDS UM : SO Header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZDZ_R_SOHEAD_UM 

                as select from zdz_dt_so
                
                //composition only with child entity
                composition[1..*] of ZDZ_I_SOIT_UM as _soitem
                
                association to ZDZ_I_CUSTOMER as _cust
                on $projection.Buyer    =   _cust.CustId
                
{
    key zdz_dt_so.soid as Soid,
    zdz_dt_so.buyer as Buyer,
    zdz_dt_so.sales_person as SalesPerson,
    zdz_dt_so.sales_timestamp as SalesTimestamp,
    zdz_dt_so.sales_manager as SalesManager,
    zdz_dt_so.approval_timestamp as ApprovalTimestamp,
    zdz_dt_so.created_by as CreatedBy,
    zdz_dt_so.created_on as CreatedOn,
    zdz_dt_so.changed_by as ChangedBy,
    
    
    //START : ETAG on field 'changedon' of type long timestamp
    @Semantics.systemDateTime.lastChangedAt: true
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    
    zdz_dt_so.changed_on as ChangedOn,
    
    // END
    
    zdz_dt_so.url as Url,
    _soitem, // Make association public
    _cust
}
