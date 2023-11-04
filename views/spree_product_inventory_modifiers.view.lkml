view: spree_product_inventory_modifiers {
  sql_table_name: public.spree_product_inventory_modifiers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: action_available {
    type: yesno
    sql: ${TABLE}."action_available" ;;
  }
  dimension: action_in_stock {
    type: yesno
    sql: ${TABLE}."action_in_stock" ;;
  }
  dimension: action_price {
    type: number
    sql: ${TABLE}."action_price" ;;
  }
  dimension_group: action_sale_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."action_sale_end" ;;
  }
  dimension: action_sale_price {
    type: number
    sql: ${TABLE}."action_sale_price" ;;
  }
  dimension_group: action_sale_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."action_sale_start" ;;
  }
  dimension_group: availability_end_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."availability_end_time" ;;
  }
  dimension_group: availability_start_time {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."availability_start_time" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: custom_product_id {
    type: number
    sql: ${TABLE}."custom_product_id" ;;
  }
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension: offline_price {
    type: number
    sql: ${TABLE}."offline_price" ;;
  }
  dimension: price_increment_percentage {
    type: number
    sql: ${TABLE}."price_increment_percentage" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension: representation_key {
    type: string
    sql: ${TABLE}."representation_key" ;;
  }
  dimension: rule_delivery_method {
    type: string
    sql: ${TABLE}."rule_delivery_method" ;;
  }
  dimension: rule_supermarket_id {
    type: number
    sql: ${TABLE}."rule_supermarket_id" ;;
  }
  dimension: stock_bucket_item_id {
    type: number
    sql: ${TABLE}."stock_bucket_item_id" ;;
  }
  dimension: stock_quantity {
    type: number
    sql: ${TABLE}."stock_quantity" ;;
  }
  dimension_group: subscription_availability_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."subscription_availability_end_date" ;;
  }
  dimension_group: subscription_availability_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."subscription_availability_start_date" ;;
  }
  dimension: subscription_price {
    type: number
    sql: ${TABLE}."subscription_price" ;;
  }
  dimension_group: subscription_price_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."subscription_price_end_date" ;;
  }
  dimension_group: subscription_price_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."subscription_price_start_date" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: uploaded_stock_quantity {
    type: number
    sql: ${TABLE}."uploaded_stock_quantity" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
