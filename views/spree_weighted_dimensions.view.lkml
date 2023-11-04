view: spree_weighted_dimensions {
  sql_table_name: public.spree_weighted_dimensions ;;
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
  dimension: depth {
    type: number
    sql: ${TABLE}."depth" ;;
  }
  dimension: height {
    type: number
    sql: ${TABLE}."height" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}."weight" ;;
  }
  dimension: width {
    type: number
    sql: ${TABLE}."width" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
