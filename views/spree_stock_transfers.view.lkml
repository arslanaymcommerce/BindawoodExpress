view: spree_stock_transfers {
  sql_table_name: public.spree_stock_transfers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: closed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."closed_at" ;;
  }
  dimension: closed_by_id {
    type: number
    sql: ${TABLE}."closed_by_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: created_by_id {
    type: number
    sql: ${TABLE}."created_by_id" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: destination_location_id {
    type: number
    sql: ${TABLE}."destination_location_id" ;;
  }
  dimension_group: finalized {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."finalized_at" ;;
  }
  dimension: finalized_by_id {
    type: number
    sql: ${TABLE}."finalized_by_id" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."shipped_at" ;;
  }
  dimension: source_location_id {
    type: number
    sql: ${TABLE}."source_location_id" ;;
  }
  dimension: tracking_number {
    type: string
    sql: ${TABLE}."tracking_number" ;;
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
