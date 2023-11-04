view: spree_assets {
  sql_table_name: public.spree_assets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: alt {
    type: string
    sql: ${TABLE}."alt" ;;
  }
  dimension: attachment_content_type {
    type: string
    sql: ${TABLE}."attachment_content_type" ;;
  }
  dimension: attachment_file_name {
    type: string
    sql: ${TABLE}."attachment_file_name" ;;
  }
  dimension: attachment_file_size {
    type: number
    sql: ${TABLE}."attachment_file_size" ;;
  }
  dimension: attachment_height {
    type: number
    sql: ${TABLE}."attachment_height" ;;
  }
  dimension_group: attachment_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."attachment_updated_at" ;;
  }
  dimension: attachment_width {
    type: number
    sql: ${TABLE}."attachment_width" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: viewable_id {
    type: number
    sql: ${TABLE}."viewable_id" ;;
  }
  dimension: viewable_type {
    type: string
    sql: ${TABLE}."viewable_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attachment_file_name]
  }
}
