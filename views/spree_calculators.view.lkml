view: spree_calculators {
  sql_table_name: public.spree_calculators ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: calculable_id {
    type: number
    sql: ${TABLE}."calculable_id" ;;
  }
  dimension: calculable_type {
    type: string
    sql: ${TABLE}."calculable_type" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: preferences {
    type: string
    sql: ${TABLE}."preferences" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
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
