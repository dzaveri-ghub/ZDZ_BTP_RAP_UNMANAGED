@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection CDS UM: Sales'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZDZ_CR_SOHEAD_UM 
            
            provider contract transactional_query
            as projection on ZDZ_R_SOHEAD_UM              
{
    key Soid,
    Buyer,
    SalesPerson,
    SalesTimestamp,
    SalesManager,
    ApprovalTimestamp,
    CreatedBy,
    CreatedOn,
    ChangedBy,
    ChangedOn,
    Url,
    /* Associations */
    _cust,
    _soitem: redirected to composition child ZDZ_CI_SOITEM_UM
    
}
