view: spree_sale_prices {
  sql_table_name: public.spree_sale_prices ;;
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
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end_at" ;;
  }
  dimension: price_id {
    type: number
    sql: ${TABLE}."price_id" ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start_at" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}."value" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
