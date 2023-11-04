view: friendly_id_slugs {
  sql_table_name: public.friendly_id_slugs ;;
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
  dimension: scope {
    type: string
    sql: ${TABLE}."scope" ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
  }
  dimension: sluggable_id {
    type: number
    sql: ${TABLE}."sluggable_id" ;;
  }
  dimension: sluggable_type {
    type: string
    sql: ${TABLE}."sluggable_type" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
