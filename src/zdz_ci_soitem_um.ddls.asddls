@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection CDS UM: Sales Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDZ_CI_SOITEM_UM as projection on ZDZ_I_SOIT_UM
{
    key Soid,
    key ItemId,
    Product,
    
    @Semantics.amount.currencyCode: 'Currency'
    Amount,
    Currency,
    SalesPerson,
    SalesTimestamp,
    SalesManager,
    ApprovalTimestamp,
    ChangedBy,
    ChangedOn,
    ImageItem,
    /* Associations */
    SOHeader: redirected to parent ZDZ_CR_SOHEAD_UM,
    _prod
}
