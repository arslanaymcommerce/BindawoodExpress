view: danube_express_contracts {
  sql_table_name: public.danube_express_contracts ;;
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
  dimension: document_content_type {
    type: string
    sql: ${TABLE}."document_content_type" ;;
  }
  dimension: document_file_name {
    type: string
    sql: ${TABLE}."document_file_name" ;;
  }
  dimension: document_file_size {
    type: number
    sql: ${TABLE}."document_file_size" ;;
  }
  dimension_group: document_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."document_updated_at" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, document_file_name]
  }
}
