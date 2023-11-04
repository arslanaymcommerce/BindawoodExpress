view: spree_loyalty_rewards {
  sql_table_name: public.spree_loyalty_rewards ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: base_points {
    type: number
    sql: ${TABLE}."base_points" ;;
  }
  dimension: bonus_points {
    type: number
    sql: ${TABLE}."bonus_points" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: location_code {
    type: string
    sql: ${TABLE}."location_code" ;;
  }
  dimension: points_earned {
    type: number
    sql: ${TABLE}."points_earned" ;;
  }
  dimension: points_redeemed {
    type: number
    sql: ${TABLE}."points_redeemed" ;;
  }
  dimension: source_id {
    type: number
    sql: ${TABLE}."source_id" ;;
  }
  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  dimension: transaction_product_list {
    type: string
    sql: ${TABLE}."transaction_product_list" ;;
  }
  dimension: transaction_type_code {
    type: string
    sql: ${TABLE}."transaction_type_code" ;;
  }
  dimension: transaction_unique_reference {
    type: string
    sql: ${TABLE}."transaction_unique_reference" ;;
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
  dimension: value {
    type: number
    sql: ${TABLE}."value" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
