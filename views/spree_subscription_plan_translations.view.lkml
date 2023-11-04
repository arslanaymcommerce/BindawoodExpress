view: spree_subscription_plan_translations {
  sql_table_name: public.spree_subscription_plan_translations ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: discount_title {
    type: string
    sql: ${TABLE}."discount_title" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: spree_subscription_plan_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_subscription_plan_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_subscription_plans.id, spree_subscription_plans.name]
  }
}
