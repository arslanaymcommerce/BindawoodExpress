view: spree_order_stock_locations {
  sql_table_name: public.spree_order_stock_locations ;;
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
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: shipment_fulfilled {
    type: yesno
    sql: ${TABLE}."shipment_fulfilled" ;;
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
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
