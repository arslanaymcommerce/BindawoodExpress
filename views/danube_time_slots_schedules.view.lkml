view: danube_time_slots_schedules {
  sql_table_name: public.danube_time_slots_schedules ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: batch_creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."batch_creation_time" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: danube_slot_to_orders_count {
    type: number
    sql: ${TABLE}."danube_slot_to_orders_count" ;;
  }
  dimension: day_of_week {
    type: number
    sql: ${TABLE}."day_of_week" ;;
  }
  dimension: delivery_capacity {
    type: number
    sql: ${TABLE}."delivery_capacity" ;;
  }
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension: is_subscription {
    type: yesno
    sql: ${TABLE}."is_subscription" ;;
  }
  dimension: spree_shipping_method_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_shipping_method_id" ;;
  }
  dimension: time_slot_id {
    type: number
    sql: ${TABLE}."time_slot_id" ;;
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
    drill_fields: [id, spree_shipping_methods.admin_name, spree_shipping_methods.name, spree_shipping_methods.id]
  }
}
