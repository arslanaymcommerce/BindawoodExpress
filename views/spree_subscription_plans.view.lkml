view: spree_subscription_plans {
  sql_table_name: public.spree_subscription_plans ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: applicable_order_count {
    type: number
    sql: ${TABLE}."applicable_order_count" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: delivery_fee {
    type: number
    sql: ${TABLE}."delivery_fee" ;;
  }
  dimension: editable {
    type: yesno
    sql: ${TABLE}."editable" ;;
  }
  dimension: minimum_order_total {
    type: number
    sql: ${TABLE}."minimum_order_total" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: plan_enabled {
    type: yesno
    sql: ${TABLE}."plan_enabled" ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: valid_for_days {
    type: number
    sql: ${TABLE}."valid_for_days" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_subscription_plan_translations.count]
  }
}
