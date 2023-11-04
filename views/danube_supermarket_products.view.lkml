view: danube_supermarket_products {
  sql_table_name: public.danube_supermarket_products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
