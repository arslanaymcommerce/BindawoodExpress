view: danube_picker_waves_time_slots {
  sql_table_name: public.danube_picker_waves_time_slots ;;

  dimension: picker_wave_id {
    type: number
    sql: ${TABLE}."picker_wave_id" ;;
  }
  dimension: time_slot_id {
    type: number
    sql: ${TABLE}."time_slot_id" ;;
  }
  measure: count {
    type: count
  }
}
