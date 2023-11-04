view: spree_adjustments {
  sql_table_name: public.spree_adjustments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: adjustable_id {
    type: number
    sql: ${TABLE}."adjustable_id" ;;
  }
  dimension: adjustable_type {
    type: string
    sql: ${TABLE}."adjustable_type" ;;
  }
  dimension: adjustment_reason_id {
    type: number
    sql: ${TABLE}."adjustment_reason_id" ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: eligible {
    type: yesno
    sql: ${TABLE}."eligible" ;;
  }
  dimension: finalized {
    type: yesno
    sql: ${TABLE}."finalized" ;;
  }
  dimension: free_sample {
    type: yesno
    sql: ${TABLE}."free_sample" ;;
  }
  dimension: included {
    type: yesno
    sql: ${TABLE}."included" ;;
  }
  dimension: label {
    type: string
    sql: ${TABLE}."label" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: promotion_code_id {
    type: number
    sql: ${TABLE}."promotion_code_id" ;;
  }
  dimension: source_id {
    type: number
    sql: ${TABLE}."source_id" ;;
  }
  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
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
