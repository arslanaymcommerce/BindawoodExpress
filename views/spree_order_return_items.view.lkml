view: spree_order_return_items {
  sql_table_name: public.spree_order_return_items ;;
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
  dimension: custom_line_item_id {
    type: number
    sql: ${TABLE}."custom_line_item_id" ;;
  }
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
  }
  dimension: returned_after_delivery {
    type: yesno
    sql: ${TABLE}."returned_after_delivery" ;;
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
