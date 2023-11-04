view: spree_order_containers {
  sql_table_name: public.spree_order_containers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: bin_category_id {
    type: number
    sql: ${TABLE}."bin_category_id" ;;
  }
  dimension: depth {
    type: number
    sql: ${TABLE}."depth" ;;
  }
  dimension: height {
    type: number
    sql: ${TABLE}."height" ;;
  }
  dimension: max_weight {
    type: number
    sql: ${TABLE}."max_weight" ;;
  }
  dimension: shipping_cost {
    type: number
    sql: ${TABLE}."shipping_cost" ;;
  }
  dimension: width {
    type: number
    sql: ${TABLE}."width" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
