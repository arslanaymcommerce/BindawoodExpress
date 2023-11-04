view: spree_countries {
  sql_table_name: public.spree_countries ;;
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
  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }
  dimension: currency_precision {
    type: number
    sql: ${TABLE}."currency_precision" ;;
  }
  dimension: default_supermarket_id {
    type: number
    sql: ${TABLE}."default_supermarket_id" ;;
  }
  dimension: flag_image_content_type {
    type: string
    sql: ${TABLE}."flag_image_content_type" ;;
  }
  dimension: flag_image_file_name {
    type: string
    sql: ${TABLE}."flag_image_file_name" ;;
  }
  dimension: flag_image_file_size {
    type: number
    sql: ${TABLE}."flag_image_file_size" ;;
  }
  dimension_group: flag_image_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."flag_image_updated_at" ;;
  }
  dimension: iso {
    type: string
    sql: ${TABLE}."iso" ;;
  }
  dimension: iso3 {
    type: string
    sql: ${TABLE}."iso3" ;;
  }
  dimension: iso_name {
    type: string
    sql: ${TABLE}."iso_name" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: numcode {
    type: number
    sql: ${TABLE}."numcode" ;;
  }
  dimension: states_required {
    type: yesno
    sql: ${TABLE}."states_required" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: vat_percentage {
    type: number
    sql: ${TABLE}."vat_percentage" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, iso_name, flag_image_file_name]
  }
}
