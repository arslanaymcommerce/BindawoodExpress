view: spree_tenants_taxons {
  sql_table_name: public.spree_tenants_taxons ;;

  dimension: taxon_id {
    type: number
    sql: ${TABLE}."taxon_id" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  measure: count {
    type: count
  }
}
