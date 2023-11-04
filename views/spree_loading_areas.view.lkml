view: spree_loading_areas {
  sql_table_name: public.spree_loading_areas ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: area {
    type: string
    sql: ${TABLE}."area" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: load_number {
    type: number
    sql: ${TABLE}."load_number" ;;
  }
  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}."shipping_method_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
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
  dimension: van_number {
    type: number
    sql: ${TABLE}."van_number" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
