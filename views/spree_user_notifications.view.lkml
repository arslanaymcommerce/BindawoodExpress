view: spree_user_notifications {
  sql_table_name: public.spree_user_notifications ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: action_target {
    type: string
    sql: ${TABLE}."action_target" ;;
  }
  dimension: action_type {
    type: string
    sql: ${TABLE}."action_type" ;;
  }
  dimension: content_ar {
    type: string
    sql: ${TABLE}."content_ar" ;;
  }
  dimension: content_en {
    type: string
    sql: ${TABLE}."content_en" ;;
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
  dimension: global {
    type: yesno
    sql: ${TABLE}."global" ;;
  }
  dimension: icon_type {
    type: string
    sql: ${TABLE}."icon_type" ;;
  }
  dimension: title_ar {
    type: string
    sql: ${TABLE}."title_ar" ;;
  }
  dimension: title_en {
    type: string
    sql: ${TABLE}."title_en" ;;
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
