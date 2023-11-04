view: spree_shelf_reviews {
  sql_table_name: public.spree_shelf_reviews ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: aisle_name {
    type: string
    sql: ${TABLE}."aisle_name" ;;
  }
  dimension: aisle_name_at_pickingtime {
    type: string
    sql: ${TABLE}."aisle_name_at_pickingtime" ;;
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
  dimension_group: in_stock {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."in_stock_at" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension_group: out_of_stock {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."out_of_stock_at" ;;
  }
  dimension: picker_id {
    type: number
    sql: ${TABLE}."picker_id" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension_group: snoozed_until {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."snoozed_until" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, aisle_name]
  }
}
