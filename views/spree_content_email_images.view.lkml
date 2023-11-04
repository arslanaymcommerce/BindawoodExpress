view: spree_content_email_images {
  sql_table_name: public.spree_content_email_images ;;
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
  dimension: email_type {
    type: string
    sql: ${TABLE}."email_type" ;;
  }
  dimension: image_ar_content_type {
    type: string
    sql: ${TABLE}."image_ar_content_type" ;;
  }
  dimension: image_ar_file_name {
    type: string
    sql: ${TABLE}."image_ar_file_name" ;;
  }
  dimension: image_ar_file_size {
    type: number
    sql: ${TABLE}."image_ar_file_size" ;;
  }
  dimension_group: image_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_ar_updated_at" ;;
  }
  dimension: image_en_content_type {
    type: string
    sql: ${TABLE}."image_en_content_type" ;;
  }
  dimension: image_en_file_name {
    type: string
    sql: ${TABLE}."image_en_file_name" ;;
  }
  dimension: image_en_file_size {
    type: number
    sql: ${TABLE}."image_en_file_size" ;;
  }
  dimension_group: image_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_en_updated_at" ;;
  }
  dimension: image_type {
    type: string
    sql: ${TABLE}."image_type" ;;
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
    drill_fields: [id, image_ar_file_name, image_en_file_name]
  }
}
