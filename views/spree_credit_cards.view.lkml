view: spree_credit_cards {
  sql_table_name: public.spree_credit_cards ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }
  dimension: bin {
    type: number
    sql: ${TABLE}."bin" ;;
  }
  dimension: cc_type {
    type: string
    sql: ${TABLE}."cc_type" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
  }
  dimension: gateway_customer_profile_id {
    type: string
    sql: ${TABLE}."gateway_customer_profile_id" ;;
  }
  dimension: gateway_payment_profile_id {
    type: string
    sql: ${TABLE}."gateway_payment_profile_id" ;;
  }
  dimension: last_digits {
    type: string
    sql: ${TABLE}."last_digits" ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}."month" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: payment_method_id {
    type: number
    sql: ${TABLE}."payment_method_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  dimension: year {
    type: string
    sql: ${TABLE}."year" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
