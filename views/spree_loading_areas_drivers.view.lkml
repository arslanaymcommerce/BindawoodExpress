view: spree_loading_areas_drivers {
  sql_table_name: public.spree_loading_areas_drivers ;;
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
  dimension: driver_id {
    type: number
    sql: ${TABLE}."driver_id" ;;
  }
  dimension: loading_area_id {
    type: number
    sql: ${TABLE}."loading_area_id" ;;
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
