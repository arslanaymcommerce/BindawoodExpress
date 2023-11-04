view: spree_inventory_units {
  sql_table_name: public.spree_inventory_units ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: carton_id {
    type: number
    sql: ${TABLE}."carton_id" ;;
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
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: pending {
    type: yesno
    sql: ${TABLE}."pending" ;;
  }
  dimension: shipment_id {
    type: number
    sql: ${TABLE}."shipment_id" ;;
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
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
