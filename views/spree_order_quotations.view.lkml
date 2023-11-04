view: spree_order_quotations {
  sql_table_name: public.spree_order_quotations ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_at" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension_group: sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."sent_at" ;;
  }
  dimension: token {
    type: string
    sql: ${TABLE}."token" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
