@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface CDS UM: CUSTOMER'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZDZ_I_CUSTOMER_UM as select from zdz_dt_cust
{
    key cust_id as CustId,
    name as Name,
    company_name as CompanyName,
    country as Country,
    city as City,
    mobile as Mobile,
    local_last_changed as LocalLastChanged,
    last_changed as LastChanged,
    local_changed_by as LocalChangedBy,
    last_changed_by as LastChangedBy
}
