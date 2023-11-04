view: spree_ingredient_products {
  sql_table_name: public.spree_ingredient_products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: kitchen_ingredient_id {
    type: number
    sql: ${TABLE}."kitchen_ingredient_id" ;;
  }
  dimension: recommended_product_id {
    type: number
    sql: ${TABLE}."recommended_product_id" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
