view: spree_shipping_rates {
  sql_table_name: public.spree_shipping_rates ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
  dimension: selected {
    type: yesno
    sql: ${TABLE}."selected" ;;
  }
  dimension: shipment_id {
    type: number
    sql: ${TABLE}."shipment_id" ;;
  }
  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}."shipping_method_id" ;;
  }
  dimension: tax_rate_id {
    type: number
    sql: ${TABLE}."tax_rate_id" ;;
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
