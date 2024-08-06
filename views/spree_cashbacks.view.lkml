view: spree_cashbacks {
  sql_table_name: public.spree_cashbacks ;;
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
  dimension: credit_expiry_offset {
    type: number
    sql: ${TABLE}."credit_expiry_offset" ;;
  }
  dimension: eligible {
    type: yesno
    sql: ${TABLE}."eligible" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: label {
    type: string
    sql: ${TABLE}."label" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: promotion_action_id {
    type: number
    sql: ${TABLE}."promotion_action_id" ;;
  }
  dimension: promotion_code_id {
    type: number
    sql: ${TABLE}."promotion_code_id" ;;
  }
  dimension: store_credit_id {
    type: number
    sql: ${TABLE}."store_credit_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: TotalCashback_amount {
    type: sum
    sql: ${amount} ;;
    value_format: "#,##0.00 \" SAR\""
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
