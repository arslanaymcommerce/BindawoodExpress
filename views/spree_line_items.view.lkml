view: spree_line_items {
  sql_table_name: public.spree_line_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: added_after_purchase {
    type: yesno
    sql: ${TABLE}."added_after_purchase" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: adjustment_total {
    type: number
    sql: ${TABLE}."adjustment_total" ;;
  }
  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
  }
  dimension: cost_price {
    type: number
    sql: ${TABLE}."cost_price" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: free_sample {
    type: yesno
    sql: ${TABLE}."free_sample" ;;
  }
  dimension: in_stock {
    type: yesno
    sql: ${TABLE}."in_stock" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: inventory_stock_used {
    type: number
    sql: ${TABLE}."inventory_stock_used" ;;
  }
  dimension: offline_price {
    type: number
    sql: ${TABLE}."offline_price" ;;
  }
  dimension: on_sale {
    type: yesno
    sql: ${TABLE}."on_sale" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }
  dimension: promo_total {
    type: number
    sql: ${TABLE}."promo_total" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
  }
  dimension: removed_after_purchase {
    type: yesno
    sql: ${TABLE}."removed_after_purchase" ;;
  }
  dimension: replaced {
    type: yesno
    sql: ${TABLE}."replaced" ;;
  }
  dimension: replacement {
    type: yesno
    sql: ${TABLE}."replacement" ;;
  }
  dimension: requested_quantity {
    type: number
    sql: ${TABLE}."requested_quantity" ;;
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
  dimension: variant_id {
    type: number
    sql: ${TABLE}."variant_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
