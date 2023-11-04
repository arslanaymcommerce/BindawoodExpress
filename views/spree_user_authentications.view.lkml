view: spree_user_authentications {
  sql_table_name: public.spree_user_authentications ;;
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
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension: provider {
    type: string
    sql: ${TABLE}."provider" ;;
  }
  dimension: uid {
    type: string
    sql: ${TABLE}."uid" ;;
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
