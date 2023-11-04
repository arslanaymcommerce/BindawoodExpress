view: spree_picked_items {
  sql_table_name: public.spree_picked_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: assignment_id {
    type: number
    sql: ${TABLE}."assignment_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: pickable_id {
    type: number
    sql: ${TABLE}."pickable_id" ;;
  }
  dimension: pickable_type {
    type: string
    sql: ${TABLE}."pickable_type" ;;
  }
  dimension_group: picked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."picked_at" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
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
