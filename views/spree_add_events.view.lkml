view: spree_add_events {
  sql_table_name: public.spree_add_events ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: add_event_id {
    type: number
    sql: ${TABLE}."add_event_id" ;;
  }
  dimension: add_event_unique_key {
    type: string
    sql: ${TABLE}."add_event_unique_key" ;;
  }
  dimension: add_event_url {
    type: string
    sql: ${TABLE}."add_event_url" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
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
