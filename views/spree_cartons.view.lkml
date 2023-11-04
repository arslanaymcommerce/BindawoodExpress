view: spree_cartons {
  sql_table_name: public.spree_cartons ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: address_id {
    type: number
    sql: ${TABLE}."address_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: external_number {
    type: string
    sql: ${TABLE}."external_number" ;;
  }
  dimension: imported_from_shipment_id {
    type: number
    sql: ${TABLE}."imported_from_shipment_id" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."shipped_at" ;;
  }
  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}."shipping_method_id" ;;
  }
  dimension: stock_location_id {
    type: number
    sql: ${TABLE}."stock_location_id" ;;
  }
  dimension: tracking {
    type: string
    sql: ${TABLE}."tracking" ;;
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
