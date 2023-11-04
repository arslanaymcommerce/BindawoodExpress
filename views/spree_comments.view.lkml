view: spree_comments {
  sql_table_name: public.spree_comments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}."comment" ;;
  }
  dimension: comment_type_id {
    type: number
    sql: ${TABLE}."comment_type_id" ;;
  }
  dimension: commentable_id {
    type: number
    sql: ${TABLE}."commentable_id" ;;
  }
  dimension: commentable_type {
    type: string
    sql: ${TABLE}."commentable_type" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: customer_notified {
    type: yesno
    sql: ${TABLE}."customer_notified" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
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
