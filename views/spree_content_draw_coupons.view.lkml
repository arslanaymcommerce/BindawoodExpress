view: spree_content_draw_coupons {
  sql_table_name: public.spree_content_draw_coupons ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}."category" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: qualifier {
    type: string
    sql: ${TABLE}."qualifier" ;;
  }
  dimension: submission_id {
    type: number
    sql: ${TABLE}."submission_id" ;;
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
