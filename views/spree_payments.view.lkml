view: spree_payments {
  sql_table_name: public.spree_payments ;;
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
  dimension: avs_response {
    type: string
    sql: ${TABLE}."avs_response" ;;
  }
  dimension: child_order_id {
    type: number
    sql: ${TABLE}."child_order_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: cvv_response_code {
    type: string
    sql: ${TABLE}."cvv_response_code" ;;
  }
  dimension: cvv_response_message {
    type: string
    sql: ${TABLE}."cvv_response_message" ;;
  }
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: payment_method_id {
    type: number
    sql: ${TABLE}."payment_method_id" ;;
  }
  dimension: response_code {
    type: string
    sql: ${TABLE}."response_code" ;;
  }
  dimension: source_id {
    type: number
    sql: ${TABLE}."source_id" ;;
  }
  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }


  dimension: loyalty_redeemed_total {
    type: number
    sql: case when ${TABLE}.payment_method_id = 7 then ${TABLE}.amount else 0 end ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.amount ;;
  }


  measure: total_amount{
    type: sum
    sql: ${total} ;;
    value_format: "#,##0.00 \" SAR\""
  }

  measure: total_loyalty_redeemed_amount{
    type: sum
    sql: ${loyalty_redeemed_total} ;;
    value_format: "#,##0.00 \" SAR\""
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
