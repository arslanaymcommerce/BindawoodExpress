view: spree_orders_free_samples {
  sql_table_name: public.spree_orders_free_samples ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: adjustment_id {
    type: number
    sql: ${TABLE}."adjustment_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: free_sample_id {
    type: number
    sql: ${TABLE}."free_sample_id" ;;
  }
  dimension: free_sample_quantity {
    type: number
    sql: ${TABLE}."free_sample_quantity" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
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
