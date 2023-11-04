view: spree_subscription_plan_account_periods {
  sql_table_name: public.spree_subscription_plan_account_periods ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: account_id {
    type: number
    sql: ${TABLE}."account_id" ;;
  }
  dimension_group: activated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."activated_at" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: order_count {
    type: number
    sql: ${TABLE}."order_count" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: plan_settings {
    type: string
    sql: ${TABLE}."plan_settings" ;;
  }
  dimension: renewed {
    type: yesno
    sql: ${TABLE}."renewed" ;;
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
