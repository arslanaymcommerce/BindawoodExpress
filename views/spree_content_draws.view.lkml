view: spree_content_draws {
  sql_table_name: public.spree_content_draws ;;
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
  dimension: display_image_ar_content_type {
    type: string
    sql: ${TABLE}."display_image_ar_content_type" ;;
  }
  dimension: display_image_ar_file_name {
    type: string
    sql: ${TABLE}."display_image_ar_file_name" ;;
  }
  dimension: display_image_ar_file_size {
    type: number
    sql: ${TABLE}."display_image_ar_file_size" ;;
  }
  dimension_group: display_image_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."display_image_ar_updated_at" ;;
  }
  dimension: display_image_en_content_type {
    type: string
    sql: ${TABLE}."display_image_en_content_type" ;;
  }
  dimension: display_image_en_file_name {
    type: string
    sql: ${TABLE}."display_image_en_file_name" ;;
  }
  dimension: display_image_en_file_size {
    type: number
    sql: ${TABLE}."display_image_en_file_size" ;;
  }
  dimension_group: display_image_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."display_image_en_updated_at" ;;
  }
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end_time" ;;
  }
  dimension: free_entry_eligible {
    type: yesno
    sql: ${TABLE}."free_entry_eligible" ;;
  }
  dimension: in_store_order_eligible {
    type: yesno
    sql: ${TABLE}."in_store_order_eligible" ;;
  }
  dimension: online_order_eligible {
    type: yesno
    sql: ${TABLE}."online_order_eligible" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_time" ;;
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
  measure: count {
    type: count
    drill_fields: [id, display_image_en_file_name, display_image_ar_file_name, spree_content_draw_translations.count]
  }
}
