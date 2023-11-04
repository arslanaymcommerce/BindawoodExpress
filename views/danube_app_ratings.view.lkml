view: danube_app_ratings {
  sql_table_name: public.danube_app_ratings ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: build_version {
    type: string
    sql: ${TABLE}."build_version" ;;
  }
  dimension: codepush_version {
    type: string
    sql: ${TABLE}."codepush_version" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}."platform" ;;
  }
  dimension_group: rated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."rated_at" ;;
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
