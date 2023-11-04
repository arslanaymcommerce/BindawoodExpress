view: spree_shipping_method_categories {
  sql_table_name: public.spree_shipping_method_categories ;;
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
  dimension: shipping_category_id {
    type: number
    sql: ${TABLE}."shipping_category_id" ;;
  }
  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}."shipping_method_id" ;;
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
