view: spree_kitchen_cuisines {
  sql_table_name: public.spree_kitchen_cuisines ;;
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
  dimension: icon_thumbnail_ar_content_type {
    type: string
    sql: ${TABLE}."icon_thumbnail_ar_content_type" ;;
  }
  dimension: icon_thumbnail_ar_file_name {
    type: string
    sql: ${TABLE}."icon_thumbnail_ar_file_name" ;;
  }
  dimension: icon_thumbnail_ar_file_size {
    type: number
    sql: ${TABLE}."icon_thumbnail_ar_file_size" ;;
  }
  dimension_group: icon_thumbnail_ar_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_thumbnail_ar_updated_at" ;;
  }
  dimension: icon_thumbnail_en_content_type {
    type: string
    sql: ${TABLE}."icon_thumbnail_en_content_type" ;;
  }
  dimension: icon_thumbnail_en_file_name {
    type: string
    sql: ${TABLE}."icon_thumbnail_en_file_name" ;;
  }
  dimension: icon_thumbnail_en_file_size {
    type: number
    sql: ${TABLE}."icon_thumbnail_en_file_size" ;;
  }
  dimension_group: icon_thumbnail_en_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."icon_thumbnail_en_updated_at" ;;
  }
  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }
  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }
  dimension: sort_order {
    type: number
    sql: ${TABLE}."sort_order" ;;
  }
  dimension: tag {
    type: string
    sql: ${TABLE}."tag" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, icon_thumbnail_ar_file_name, icon_thumbnail_en_file_name]
  }
}
