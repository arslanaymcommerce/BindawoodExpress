view: spree_custom_line_items {
  sql_table_name: public.spree_custom_line_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: custom_product_id {
    type: number
    sql: ${TABLE}."custom_product_id" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: replaced {
    type: yesno
    sql: ${TABLE}."replaced" ;;
  }
  dimension: replacement {
    type: yesno
    sql: ${TABLE}."replacement" ;;
  }
  dimension: requested_quantity {
    type: number
    sql: ${TABLE}."requested_quantity" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
