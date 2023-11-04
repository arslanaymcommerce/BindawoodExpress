view: danube_slot_to_orders {
  sql_table_name: public.danube_slot_to_orders ;;
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
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end_time" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: spree_shipping_method_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_shipping_method_id" ;;
  }
  dimension: spree_zone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_zone_id" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_time" ;;
  }
  dimension_group: time_slot {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."time_slot_date" ;;
  }
  dimension: time_slots_schedule_id {
    type: number
    sql: ${TABLE}."time_slots_schedule_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	spree_shipping_methods.admin_name,
	spree_shipping_methods.name,
	spree_shipping_methods.id,
	spree_zones.id,
	spree_zones.name
	]
  }

}
