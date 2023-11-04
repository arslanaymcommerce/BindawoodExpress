view: spree_store_credit_events {
  sql_table_name: public.spree_store_credit_events ;;
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
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension: authorization_code {
    type: string
    sql: ${TABLE}."authorization_code" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: originator_id {
    type: number
    sql: ${TABLE}."originator_id" ;;
  }
  dimension: originator_type {
    type: string
    sql: ${TABLE}."originator_type" ;;
  }
  dimension: store_credit_id {
    type: number
    sql: ${TABLE}."store_credit_id" ;;
  }
  dimension: update_reason_id {
    type: number
    sql: ${TABLE}."update_reason_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_total_amount {
    type: number
    sql: ${TABLE}."user_total_amount" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
