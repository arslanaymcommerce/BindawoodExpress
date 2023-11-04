view: spree_log_entries {
  sql_table_name: public.spree_log_entries ;;
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
  dimension: details {
    type: string
    sql: ${TABLE}."details" ;;
  }
  dimension: source_id {
    type: number
    sql: ${TABLE}."source_id" ;;
  }
  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
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
