view: spree_shipments {
  sql_table_name: public.spree_shipments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: adjustment_total {
    type: number
    sql: ${TABLE}."adjustment_total" ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}."cost" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: deprecated_address_id {
    type: number
    sql: ${TABLE}."deprecated_address_id" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: promo_total {
    type: number
    sql: ${TABLE}."promo_total" ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."shipped_at" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
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
