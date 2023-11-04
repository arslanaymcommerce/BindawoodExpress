view: spree_drift_device_locations {
  sql_table_name: public.spree_drift_device_locations ;;
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
  dimension: latitude {
    type: number
    sql: ${TABLE}."latitude" ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}."longitude" ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}."order_number" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: uuid {
    type: string
    sql: ${TABLE}."uuid" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
