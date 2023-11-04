view: spree_invoices {
  sql_table_name: public.spree_invoices ;;
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
  dimension: is_pdf_generated {
    type: yesno
    sql: ${TABLE}."is_pdf_generated" ;;
  }
  dimension: is_qr_generated {
    type: yesno
    sql: ${TABLE}."is_qr_generated" ;;
  }
  dimension: job_id {
    type: string
    sql: ${TABLE}."job_id" ;;
  }
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: pdf_content_type {
    type: string
    sql: ${TABLE}."pdf_content_type" ;;
  }
  dimension: pdf_file_name {
    type: string
    sql: ${TABLE}."pdf_file_name" ;;
  }
  dimension: pdf_file_size {
    type: number
    sql: ${TABLE}."pdf_file_size" ;;
  }
  dimension_group: pdf_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."pdf_updated_at" ;;
  }
  dimension: public_id {
    type: string
    sql: ${TABLE}."public_id" ;;
  }
  dimension: qr_content_type {
    type: string
    sql: ${TABLE}."qr_content_type" ;;
  }
  dimension: qr_data {
    type: string
    sql: ${TABLE}."qr_data" ;;
  }
  dimension: qr_file_name {
    type: string
    sql: ${TABLE}."qr_file_name" ;;
  }
  dimension: qr_file_size {
    type: number
    sql: ${TABLE}."qr_file_size" ;;
  }
  dimension_group: qr_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."qr_updated_at" ;;
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
  measure: count {
    type: count
    drill_fields: [id, pdf_file_name, qr_file_name]
  }
}
