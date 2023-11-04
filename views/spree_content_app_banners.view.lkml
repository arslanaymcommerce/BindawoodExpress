view: spree_content_app_banners {
  sql_table_name: public.spree_content_app_banners ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: deeplink_android {
    type: string
    sql: ${TABLE}."deeplink_android" ;;
  }
  dimension: deeplink_ios {
    type: string
    sql: ${TABLE}."deeplink_ios" ;;
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
  dimension: express {
    type: yesno
    sql: ${TABLE}."express" ;;
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
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
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
  dimension: title_ar {
    type: string
    sql: ${TABLE}."title_ar" ;;
  }
  dimension: web_url_ar {
    type: string
    sql: ${TABLE}."web_url_ar" ;;
  }
  dimension: web_url_en {
    type: string
    sql: ${TABLE}."web_url_en" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, image_en_file_name, image_ar_file_name]
  }
}
