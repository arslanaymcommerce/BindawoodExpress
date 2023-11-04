view: spree_transfer_items {
  sql_table_name: public.spree_transfer_items ;;
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
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: expected_quantity {
    type: number
    sql: ${TABLE}."expected_quantity" ;;
  }
  dimension: received_quantity {
    type: number
    sql: ${TABLE}."received_quantity" ;;
  }
  dimension: stock_transfer_id {
    type: number
    sql: ${TABLE}."stock_transfer_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
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
