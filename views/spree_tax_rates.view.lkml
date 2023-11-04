view: spree_tax_rates {
  sql_table_name: public.spree_tax_rates ;;
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
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: included_in_price {
    type: yesno
    sql: ${TABLE}."included_in_price" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: show_rate_in_label {
    type: yesno
    sql: ${TABLE}."show_rate_in_label" ;;
  }
  dimension: tax_category_id {
    type: number
    sql: ${TABLE}."tax_category_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: zone_id {
    type: number
    sql: ${TABLE}."zone_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
