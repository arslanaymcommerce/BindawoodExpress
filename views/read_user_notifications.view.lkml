view: read_user_notifications {
  sql_table_name: public.read_user_notifications ;;

  dimension: notification_id {
    type: number
    sql: ${TABLE}."notification_id" ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
  }
}
