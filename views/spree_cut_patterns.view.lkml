view: spree_cut_patterns {
  sql_table_name: public.spree_cut_patterns ;;
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
  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
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
  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }
  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }
  dimension: preferred_cut_id {
    type: number
    sql: ${TABLE}."preferred_cut_id" ;;
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
    drill_fields: [id, display_image_file_name]
  }
}
