view: spree_quality_checker_results {
  sql_table_name: public.spree_quality_checker_results ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}."comment" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: reported_by_id {
    type: number
    sql: ${TABLE}."reported_by_id" ;;
  }
  dimension: reported_by_type {
    type: string
    sql: ${TABLE}."reported_by_type" ;;
  }
  dimension: resolved {
    type: yesno
    sql: ${TABLE}."resolved" ;;
  }
  dimension: resultable_id {
    type: number
    sql: ${TABLE}."resultable_id" ;;
  }
  dimension: resultable_type {
    type: string
    sql: ${TABLE}."resultable_type" ;;
  }
  dimension: scanned_barcode {
    type: string
    sql: ${TABLE}."scanned_barcode" ;;
  }
  dimension: solution_type {
    type: string
    sql: ${TABLE}."solution_type" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: valid_product {
    type: yesno
    sql: ${TABLE}."valid_product" ;;
  }
  dimension_group: verified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."verified_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
