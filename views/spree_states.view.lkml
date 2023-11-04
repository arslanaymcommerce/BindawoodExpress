view: spree_states {
  sql_table_name: public.spree_states ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: abbr {
    type: string
    sql: ${TABLE}."abbr" ;;
  }
  dimension: background_image_content_type {
    type: string
    sql: ${TABLE}."background_image_content_type" ;;
  }
  dimension: background_image_file_name {
    type: string
    sql: ${TABLE}."background_image_file_name" ;;
  }
  dimension: background_image_file_size {
    type: number
    sql: ${TABLE}."background_image_file_size" ;;
  }
  dimension_group: background_image_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."background_image_updated_at" ;;
  }
  dimension: country_id {
    type: number
    sql: ${TABLE}."country_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: image_content_type {
    type: string
    sql: ${TABLE}."image_content_type" ;;
  }
  dimension: image_file_name {
    type: string
    sql: ${TABLE}."image_file_name" ;;
  }
  dimension: image_file_size {
    type: number
    sql: ${TABLE}."image_file_size" ;;
  }
  dimension_group: image_updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."image_updated_at" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, image_file_name, background_image_file_name, name, spree_state_translations.count]
  }
}
