view: spree_shipping_method_zones {
  sql_table_name: public.spree_shipping_method_zones ;;
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
  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}."shipping_method_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: zone_id {
    type: number
    sql: ${TABLE}."zone_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
