view: spree_pages {
  sql_table_name: public.spree_pages ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: body {
    type: string
    sql: ${TABLE}."body" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: foreign_link {
    type: string
    sql: ${TABLE}."foreign_link" ;;
  }
  dimension: layout {
    type: string
    sql: ${TABLE}."layout" ;;
  }
  dimension: meta_description {
    type: string
    sql: ${TABLE}."meta_description" ;;
  }
  dimension: meta_keywords {
    type: string
    sql: ${TABLE}."meta_keywords" ;;
  }
  dimension: meta_title {
    type: string
    sql: ${TABLE}."meta_title" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: render_layout_as_partial {
    type: yesno
    sql: ${TABLE}."render_layout_as_partial" ;;
  }
  dimension: show_in_footer {
    type: yesno
    sql: ${TABLE}."show_in_footer" ;;
  }
  dimension: show_in_header {
    type: yesno
    sql: ${TABLE}."show_in_header" ;;
  }
  dimension: show_in_sidebar {
    type: yesno
    sql: ${TABLE}."show_in_sidebar" ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
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
  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
