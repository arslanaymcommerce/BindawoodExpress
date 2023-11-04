view: spree_last_minute_buy_products {
  sql_table_name: public.spree_last_minute_buy_products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: last_minute_buy_rule_id {
    type: number
    sql: ${TABLE}."last_minute_buy_rule_id" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
