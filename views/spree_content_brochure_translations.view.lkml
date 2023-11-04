view: spree_content_brochure_translations {
  sql_table_name: public.spree_content_brochure_translations ;;
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
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: spree_content_brochure_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_content_brochure_id" ;;
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
    drill_fields: [id, spree_content_brochures.id, spree_content_brochures.document_file_name, spree_content_brochures.display_image_file_name]
  }
}
