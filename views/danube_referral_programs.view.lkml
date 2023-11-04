view: danube_referral_programs {
  sql_table_name: public.danube_referral_programs ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: banner_content_ar {
    type: string
    sql: ${TABLE}."banner_content_ar" ;;
  }
  dimension: banner_content_en {
    type: string
    sql: ${TABLE}."banner_content_en" ;;
  }
  dimension: banner_image_ar_content_type {
    type: string
    sql: ${TABLE}."banner_image_ar_content_type" ;;
  }
  dimension: banner_image_ar_file_name {
    type: string
    sql: ${TABLE}."banner_image_ar_file_name" ;;
  }
  dimension: banner_image_ar_file_size {
    type: number
    sql: ${TABLE}."banner_image_ar_file_size" ;;
  }
  dimension_group: banner_image_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."banner_image_ar_updated_at" ;;
  }
  dimension: banner_image_en_content_type {
    type: string
    sql: ${TABLE}."banner_image_en_content_type" ;;
  }
  dimension: banner_image_en_file_name {
    type: string
    sql: ${TABLE}."banner_image_en_file_name" ;;
  }
  dimension: banner_image_en_file_size {
    type: number
    sql: ${TABLE}."banner_image_en_file_size" ;;
  }
  dimension_group: banner_image_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."banner_image_en_updated_at" ;;
  }
  dimension: banner_title_ar {
    type: string
    sql: ${TABLE}."banner_title_ar" ;;
  }
  dimension: banner_title_en {
    type: string
    sql: ${TABLE}."banner_title_en" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension: max_referee_count {
    type: number
    sql: ${TABLE}."max_referee_count" ;;
  }
  dimension: max_referral_earnings_limit {
    type: number
    sql: ${TABLE}."max_referral_earnings_limit" ;;
  }
  dimension: recipients_to {
    type: string
    sql: ${TABLE}."recipients_to" ;;
  }
  dimension: referee_credit_amount {
    type: number
    sql: ${TABLE}."referee_credit_amount" ;;
  }
  dimension: referee_credit_expiry_days {
    type: number
    sql: ${TABLE}."referee_credit_expiry_days" ;;
  }
  dimension: referrer_credit_amount {
    type: number
    sql: ${TABLE}."referrer_credit_amount" ;;
  }
  dimension: referrer_credit_expiry_days {
    type: number
    sql: ${TABLE}."referrer_credit_expiry_days" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, banner_image_en_file_name, banner_image_ar_file_name]
  }
}
