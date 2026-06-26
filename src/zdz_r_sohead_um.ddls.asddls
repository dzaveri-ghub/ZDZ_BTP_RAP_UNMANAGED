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
    key soid as Soid,
    buyer as Buyer,
    sales_person as SalesPerson,
    sales_timestamp as SalesTimestamp,
    sales_manager as SalesManager,
    approval_timestamp as ApprovalTimestamp,
    created_by as CreatedBy,
    created_on as CreatedOn,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    url as Url,
    _soitem, // Make association public
    _cust
}
