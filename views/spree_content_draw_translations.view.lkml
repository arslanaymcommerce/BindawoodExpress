view: spree_content_draw_translations {
  sql_table_name: public.spree_content_draw_translations ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: how_it_works {
    type: string
    sql: ${TABLE}."how_it_works" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: spree_content_draw_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_content_draw_id" ;;
  }
  dimension: terms_and_conditions {
    type: string
    sql: ${TABLE}."terms_and_conditions" ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, spree_content_draws.display_image_en_file_name, spree_content_draws.display_image_ar_file_name, spree_content_draws.id]
  }
}
