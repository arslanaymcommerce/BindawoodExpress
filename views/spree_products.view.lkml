view: spree_products {
  sql_table_name: public.spree_products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: availability_type {
    type: number
    sql: ${TABLE}."availability_type" ;;
  }
  dimension_group: available {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."available_on" ;;
  }
  dimension: avg_rating {
    type: number
    sql: ${TABLE}."avg_rating" ;;
  }
  dimension: bin_category_id {
    type: number
    sql: ${TABLE}."bin_category_id" ;;
  }
  dimension: bundled {
    type: yesno
    sql: ${TABLE}."bundled" ;;
  }
  dimension: cod_enabled {
    type: yesno
    sql: ${TABLE}."cod_enabled" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: crushable {
    type: yesno
    sql: ${TABLE}."crushable" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: depend_only_inventory_details {
    type: yesno
    sql: ${TABLE}."depend_only_inventory_details" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: electronic_product_code {
    type: string
    sql: ${TABLE}."electronic_product_code" ;;
  }
  dimension: express {
    type: yesno
    sql: ${TABLE}."express" ;;
  }
  dimension: in_stock {
    type: yesno
    sql: ${TABLE}."in_stock" ;;
  }
  dimension: is_loyalty_reward {
    type: yesno
    sql: ${TABLE}."is_loyalty_reward" ;;
  }
  dimension: loyalty_point {
    type: number
    sql: ${TABLE}."loyalty_point" ;;
  }
  dimension: loyalty_reward_cost {
    type: number
    sql: ${TABLE}."loyalty_reward_cost" ;;
  }
  dimension: loyalty_sync_key {
    type: string
    sql: ${TABLE}."loyalty_sync_key" ;;
  }
  dimension_group: loyalty_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."loyalty_synced_at" ;;
  }
  dimension: magerecord_product_entity_id {
    type: number
    sql: ${TABLE}."magerecord_product_entity_id" ;;
  }
  dimension: magerecord_product_id {
    type: number
    sql: ${TABLE}."magerecord_product_id" ;;
  }
  dimension: meta_description {
    type: string
    sql: ${TABLE}."meta_description" ;;
  }
  dimension: meta_keywords {
    type: string
    sql: ${TABLE}."meta_keywords" ;;
  }
  dimension: meta_title {
    type: string
    sql: ${TABLE}."meta_title" ;;
  }
  dimension: moq_limit {
    type: number
    sql: ${TABLE}."moq_limit" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: promotionable {
    type: yesno
    sql: ${TABLE}."promotionable" ;;
  }
  dimension: purchases_last_7_days {
    type: number
    sql: ${TABLE}."purchases_last_7_days" ;;
  }
  dimension_group: purchases_last_7_days_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."purchases_last_7_days_updated_at" ;;
  }
  dimension: refundable {
    type: yesno
    sql: ${TABLE}."refundable" ;;
  }
  dimension: reviews_count {
    type: number
    sql: ${TABLE}."reviews_count" ;;
  }
  dimension: shipping_category_id {
    type: number
    sql: ${TABLE}."shipping_category_id" ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
  }
  dimension: subscription_only {
    type: yesno
    sql: ${TABLE}."subscription_only" ;;
  }
  dimension: tax_category_id {
    type: number
    sql: ${TABLE}."tax_category_id" ;;
  }
  dimension_group: updated_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_electronic_items_details.count, spree_product_translations.count]
  }
}
