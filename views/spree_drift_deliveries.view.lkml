view: spree_drift_deliveries {
  sql_table_name: public.spree_drift_deliveries ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: carrier_reference_id {
    type: string
    sql: ${TABLE}."carrier_reference_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: delivery_batch_id {
    type: number
    sql: ${TABLE}."delivery_batch_id" ;;
  }
  dimension: distance_on_arrival {
    type: number
    sql: ${TABLE}."distance_on_arrival" ;;
  }
  dimension: latitude_on_arrival {
    type: number
    sql: ${TABLE}."latitude_on_arrival" ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}."location" ;;
  }
  dimension: longitude_on_arrival {
    type: number
    sql: ${TABLE}."longitude_on_arrival" ;;
  }
  dimension: not_in_radius_attempt_count {
    type: number
    sql: ${TABLE}."not_in_radius_attempt_count" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: sort_order {
    type: number
    sql: ${TABLE}."sort_order" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
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
    drill_fields: [id]
  }
}
