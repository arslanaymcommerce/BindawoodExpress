view: spree_content_brochures {
  sql_table_name: public.spree_content_brochures ;;
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
  dimension: display_image_content_type {
    type: string
    sql: ${TABLE}."display_image_content_type" ;;
  }
  dimension: display_image_file_name {
    type: string
    sql: ${TABLE}."display_image_file_name" ;;
  }
  dimension: display_image_file_size {
    type: number
    sql: ${TABLE}."display_image_file_size" ;;
  }
  dimension_group: display_image_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."display_image_updated_at" ;;
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
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: show_pdf {
    type: yesno
    sql: ${TABLE}."show_pdf" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, document_file_name, display_image_file_name, spree_content_brochure_translations.count]
  }
}
