view: spree_content_web_banners {
  sql_table_name: public.spree_content_web_banners ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
  dimension: image_desktop_ar_content_type {
    type: string
    sql: ${TABLE}."image_desktop_ar_content_type" ;;
  }
  dimension: image_desktop_ar_file_name {
    type: string
    sql: ${TABLE}."image_desktop_ar_file_name" ;;
  }
  dimension: image_desktop_ar_file_size {
    type: number
    sql: ${TABLE}."image_desktop_ar_file_size" ;;
  }
  dimension_group: image_desktop_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_desktop_ar_updated_at" ;;
  }
  dimension: image_desktop_en_content_type {
    type: string
    sql: ${TABLE}."image_desktop_en_content_type" ;;
  }
  dimension: image_desktop_en_file_name {
    type: string
    sql: ${TABLE}."image_desktop_en_file_name" ;;
  }
  dimension: image_desktop_en_file_size {
    type: number
    sql: ${TABLE}."image_desktop_en_file_size" ;;
  }
  dimension_group: image_desktop_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_desktop_en_updated_at" ;;
  }
  dimension: image_mobile_ar_content_type {
    type: string
    sql: ${TABLE}."image_mobile_ar_content_type" ;;
  }
  dimension: image_mobile_ar_file_name {
    type: string
    sql: ${TABLE}."image_mobile_ar_file_name" ;;
  }
  dimension: image_mobile_ar_file_size {
    type: number
    sql: ${TABLE}."image_mobile_ar_file_size" ;;
  }
  dimension_group: image_mobile_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_mobile_ar_updated_at" ;;
  }
  dimension: image_mobile_en_content_type {
    type: string
    sql: ${TABLE}."image_mobile_en_content_type" ;;
  }
  dimension: image_mobile_en_file_name {
    type: string
    sql: ${TABLE}."image_mobile_en_file_name" ;;
  }
  dimension: image_mobile_en_file_size {
    type: number
    sql: ${TABLE}."image_mobile_en_file_size" ;;
  }
  dimension_group: image_mobile_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_mobile_en_updated_at" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_time" ;;
  }
  dimension: target_url {
    type: string
    sql: ${TABLE}."target_url" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, image_desktop_en_file_name, image_mobile_en_file_name, image_desktop_ar_file_name, image_mobile_ar_file_name]
  }
}
