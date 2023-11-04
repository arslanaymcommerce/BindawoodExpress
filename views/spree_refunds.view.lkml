view: spree_refunds {
  sql_table_name: public.spree_refunds ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
  dimension: payment_id {
    type: number
    sql: ${TABLE}."payment_id" ;;
  }
  dimension: refund_reason_id {
    type: number
    sql: ${TABLE}."refund_reason_id" ;;
  }
  dimension: reimbursement_id {
    type: number
    sql: ${TABLE}."reimbursement_id" ;;
  }
  dimension: response_code {
    type: string
    sql: ${TABLE}."response_code" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension: transaction_id {
    type: string
    sql: ${TABLE}."transaction_id" ;;
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
