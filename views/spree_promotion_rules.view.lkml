view: spree_promotion_rules {
  sql_table_name: public.spree_promotion_rules ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
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
  dimension: product_group_id {
    type: number
    sql: ${TABLE}."product_group_id" ;;
  }
  dimension: promotion_id {
    type: number
    sql: ${TABLE}."promotion_id" ;;
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
