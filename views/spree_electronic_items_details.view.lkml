view: spree_electronic_items_details {
  sql_table_name: public.spree_electronic_items_details ;;
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
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  dimension: serial_number {
    type: string
    sql: ${TABLE}."serial_number" ;;
  }
  dimension: spree_product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_product_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, spree_products.name, spree_products.id]
  }
}
