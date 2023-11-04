view: danube_delivery_waves_time_slots {
  sql_table_name: public.danube_delivery_waves_time_slots ;;

  dimension: delivery_wave_id {
    type: number
    sql: ${TABLE}."delivery_wave_id" ;;
  }
  dimension: time_slot_id {
    type: number
    sql: ${TABLE}."time_slot_id" ;;
  }
  measure: count {
    type: count
  }
}
