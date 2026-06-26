@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS UM: Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZDZ_I_SOIT_UM 
            as select from zdz_dt_soitem

            association to parent ZDZ_R_SOHEAD_UM as SOHeader
            on  $projection.Soid    =   SOHeader.Soid
            
            association to ZDZ_I_PRODUCT as _prod
            on $projection.Product  =   _prod.ProdId
{
    key soid as Soid,
    key item_id as ItemId,
    product as Product,
    
    @Semantics.amount.currencyCode: 'Currency'
    amount as Amount,
    currency as Currency,
    sales_person as SalesPerson,
    sales_timestamp as SalesTimestamp,
    sales_manager as SalesManager,
    approval_timestamp as ApprovalTimestamp,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    image_item as ImageItem,
    SOHeader,
    _prod
}
