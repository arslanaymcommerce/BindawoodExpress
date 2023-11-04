view: spree_store_payment_methods {
  sql_table_name: public.spree_store_payment_methods ;;
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
  dimension: payment_method_id {
    type: number
    sql: ${TABLE}."payment_method_id" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
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
