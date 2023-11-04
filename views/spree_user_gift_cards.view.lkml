view: spree_user_gift_cards {
  sql_table_name: public.spree_user_gift_cards ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: activated {
    type: yesno
    sql: ${TABLE}."activated" ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension: barcode {
    type: string
    sql: ${TABLE}."barcode" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: purchased_by_id {
    type: number
    sql: ${TABLE}."purchased_by_id" ;;
  }
  dimension: transaction_id {
    type: string
    sql: ${TABLE}."transaction_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: used_by_id {
    type: number
    sql: ${TABLE}."used_by_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
