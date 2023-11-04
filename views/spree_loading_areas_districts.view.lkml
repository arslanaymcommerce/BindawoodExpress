view: spree_loading_areas_districts {
  sql_table_name: public.spree_loading_areas_districts ;;
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
  dimension: district_id {
    type: number
    sql: ${TABLE}."district_id" ;;
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
