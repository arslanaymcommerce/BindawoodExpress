view: spree_wished_products {
  sql_table_name: public.spree_wished_products ;;
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
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: remark {
    type: string
    sql: ${TABLE}."remark" ;;
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
  dimension: wishlist_id {
    type: number
    sql: ${TABLE}."wishlist_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
