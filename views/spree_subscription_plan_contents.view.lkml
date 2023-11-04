view: spree_subscription_plan_contents {
  sql_table_name: public.spree_subscription_plan_contents ;;
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
  dimension: icon_content_type {
    type: string
    sql: ${TABLE}."icon_content_type" ;;
  }
  dimension: icon_file_name {
    type: string
    sql: ${TABLE}."icon_file_name" ;;
  }
  dimension: icon_file_size {
    type: number
    sql: ${TABLE}."icon_file_size" ;;
  }
  dimension_group: icon_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_updated_at" ;;
  }
  dimension: subscription_plan_id {
    type: number
    sql: ${TABLE}."subscription_plan_id" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, icon_file_name, spree_subscription_plan_content_translations.count]
  }
}
