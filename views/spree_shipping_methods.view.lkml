view: spree_shipping_methods {
  sql_table_name: public.spree_shipping_methods ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: admin_name {
    type: string
    sql: ${TABLE}."admin_name" ;;
  }
  dimension: available_to_all {
    type: yesno
    sql: ${TABLE}."available_to_all" ;;
  }
  dimension: available_to_users {
    type: yesno
    sql: ${TABLE}."available_to_users" ;;
  }
  dimension: carrier {
    type: string
    sql: ${TABLE}."carrier" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: service_level {
    type: string
    sql: ${TABLE}."service_level" ;;
  }
  dimension: tax_category_id {
    type: number
    sql: ${TABLE}."tax_category_id" ;;
  }
  dimension: time_offset {
    type: number
    sql: ${TABLE}."time_offset" ;;
  }
  dimension: tracking_url {
    type: string
    sql: ${TABLE}."tracking_url" ;;
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
	admin_name,
	name,
	danube_slot_to_orders.count,
	danube_time_slots_schedules.count,
	spree_shipping_method_translations.count
	]
  }

}
