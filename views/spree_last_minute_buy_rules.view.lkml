view: spree_last_minute_buy_rules {
  sql_table_name: public.spree_last_minute_buy_rules ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: last_minute_buy_id {
    type: number
    sql: ${TABLE}."last_minute_buy_id" ;;
  }
  dimension: match_sku_number {
    type: string
    sql: ${TABLE}."match_sku_number" ;;
  }
  dimension: match_taxon_ids {
    type: string
    sql: ${TABLE}."match_taxon_ids" ;;
  }
  dimension: sku_numbers {
    type: string
    sql: ${TABLE}."sku_numbers" ;;
  }
  dimension: taxon_ids {
    type: string
    sql: ${TABLE}."taxon_ids" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
