view: spree_subscription_plan_supermarkets {
  sql_table_name: public.spree_subscription_plan_supermarkets ;;
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
  dimension: plan_id {
    type: number
    sql: ${TABLE}."plan_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
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
