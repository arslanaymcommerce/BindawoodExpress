view: spree_stock_movements {
  sql_table_name: public.spree_stock_movements ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: action {
    type: string
    sql: ${TABLE}."action" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: originator_id {
    type: number
    sql: ${TABLE}."originator_id" ;;
  }
  dimension: originator_type {
    type: string
    sql: ${TABLE}."originator_type" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: stock_item_id {
    type: number
    sql: ${TABLE}."stock_item_id" ;;
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
