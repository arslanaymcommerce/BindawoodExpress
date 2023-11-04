view: spree_kitchen_recipes {
  sql_table_name: public.spree_kitchen_recipes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: banner_content_type {
    type: string
    sql: ${TABLE}."banner_content_type" ;;
  }
  dimension: banner_file_name {
    type: string
    sql: ${TABLE}."banner_file_name" ;;
  }
  dimension: banner_file_size {
    type: number
    sql: ${TABLE}."banner_file_size" ;;
  }
  dimension_group: banner_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."banner_updated_at" ;;
  }
  dimension: calories {
    type: number
    sql: ${TABLE}."calories" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: cuisine_id {
    type: number
    sql: ${TABLE}."cuisine_id" ;;
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
  dimension: home_icon_content_type {
    type: string
    sql: ${TABLE}."home_icon_content_type" ;;
  }
  dimension: home_icon_file_name {
    type: string
    sql: ${TABLE}."home_icon_file_name" ;;
  }
  dimension: home_icon_file_size {
    type: number
    sql: ${TABLE}."home_icon_file_size" ;;
  }
  dimension_group: home_icon_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."home_icon_updated_at" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: servings {
    type: string
    sql: ${TABLE}."servings" ;;
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
    drill_fields: [id, banner_file_name, home_icon_file_name, display_image_file_name, spree_kitchen_recipe_translations.count]
  }
}
