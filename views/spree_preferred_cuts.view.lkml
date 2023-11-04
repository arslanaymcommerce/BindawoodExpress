view: spree_preferred_cuts {
  sql_table_name: public.spree_preferred_cuts ;;
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
  dimension: cut_type {
    type: string
    sql: ${TABLE}."cut_type" ;;
  }
  dimension: important_text_ar {
    type: string
    sql: ${TABLE}."important_text_ar" ;;
  }
  dimension: important_text_en {
    type: string
    sql: ${TABLE}."important_text_en" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
