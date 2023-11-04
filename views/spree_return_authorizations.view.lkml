view: spree_return_authorizations {
  sql_table_name: public.spree_return_authorizations ;;
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
  dimension: memo {
    type: string
    sql: ${TABLE}."memo" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: return_reason_id {
    type: number
    sql: ${TABLE}."return_reason_id" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension: stock_location_id {
    type: number
    sql: ${TABLE}."stock_location_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
