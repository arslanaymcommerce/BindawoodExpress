view: danube_express_supermarkets {
  sql_table_name: public.danube_express_supermarkets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: center {
    type: string
    sql: ${TABLE}."center" ;;
  }
  dimension: coverage {
    type: string
    sql: ${TABLE}."coverage" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  dimension: logo_content_type {
    type: string
    sql: ${TABLE}."logo_content_type" ;;
  }
  dimension: logo_file_name {
    type: string
    sql: ${TABLE}."logo_file_name" ;;
  }
  dimension: logo_file_size {
    type: number
    sql: ${TABLE}."logo_file_size" ;;
  }
  dimension_group: logo_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."logo_updated_at" ;;
  }
  dimension: slot_capacity_per_hour {
    type: number
    sql: ${TABLE}."slot_capacity_per_hour" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension: time_slot_buffer {
    type: number
    sql: ${TABLE}."time_slot_buffer" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, logo_file_name]
  }
}
