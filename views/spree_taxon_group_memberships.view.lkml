view: spree_taxon_group_memberships {
  sql_table_name: public.spree_taxon_group_memberships ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: taxon_group_id {
    type: number
    sql: ${TABLE}."taxon_group_id" ;;
  }
  dimension: taxon_id {
    type: number
    sql: ${TABLE}."taxon_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
