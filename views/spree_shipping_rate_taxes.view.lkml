view: spree_shipping_rate_taxes {
  sql_table_name: public.spree_shipping_rate_taxes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: shipping_rate_id {
    type: number
    sql: ${TABLE}."shipping_rate_id" ;;
  }
  dimension: tax_rate_id {
    type: number
    sql: ${TABLE}."tax_rate_id" ;;
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
