view: spree_content_draw_submissions {
  sql_table_name: public.spree_content_draw_submissions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: decline_reason {
    type: string
    sql: ${TABLE}."decline_reason" ;;
  }
  dimension: draw_id {
    type: number
    sql: ${TABLE}."draw_id" ;;
  }
  dimension: in_store_code {
    type: string
    sql: ${TABLE}."in_store_code" ;;
  }
  dimension: in_store_order_number {
    type: string
    sql: ${TABLE}."in_store_order_number" ;;
  }
  dimension: in_store_order_total {
    type: number
    sql: ${TABLE}."in_store_order_total" ;;
  }
  dimension_group: in_store_purchase {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."in_store_purchase_date" ;;
  }
  dimension: online_order_id {
    type: number
    sql: ${TABLE}."online_order_id" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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
