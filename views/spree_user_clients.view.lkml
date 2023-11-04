view: spree_user_clients {
  sql_table_name: public.spree_user_clients ;;
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
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}."platform" ;;
  }
  dimension: push_notification_token {
    type: string
    sql: ${TABLE}."push_notification_token" ;;
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
  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
