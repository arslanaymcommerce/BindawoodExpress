view: spree_reimbursement_credits {
  sql_table_name: public.spree_reimbursement_credits ;;
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
  dimension: creditable_id {
    type: number
    sql: ${TABLE}."creditable_id" ;;
  }
  dimension: creditable_type {
    type: string
    sql: ${TABLE}."creditable_type" ;;
  }
  dimension: reimbursement_id {
    type: number
    sql: ${TABLE}."reimbursement_id" ;;
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
