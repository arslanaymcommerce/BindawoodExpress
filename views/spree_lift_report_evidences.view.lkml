view: spree_lift_report_evidences {
  sql_table_name: public.spree_lift_report_evidences ;;
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
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: picker_id {
    type: number
    sql: ${TABLE}."picker_id" ;;
  }
  dimension: reasons {
    type: string
    sql: ${TABLE}."reasons" ;;
  }
  dimension: review_id {
    type: number
    sql: ${TABLE}."review_id" ;;
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
