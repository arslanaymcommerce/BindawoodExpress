view: danube_supermarkets {
  sql_table_name: public.danube_supermarkets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: address1 {
    type: string
    sql: ${TABLE}."address1" ;;
  }
  dimension: address2 {
    type: string
    sql: ${TABLE}."address2" ;;
  }
  dimension: alternative_phone {
    type: string
    sql: ${TABLE}."alternative_phone" ;;
  }
  dimension: available_roles {
    type: string
    sql: ${TABLE}."available_roles" ;;
  }
  dimension: call_masking {
    type: yesno
    sql: ${TABLE}."call_masking" ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}."city" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  dimension: country_id {
    type: number
    sql: ${TABLE}."country_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: default_delivery_carrier_id {
    type: number
    sql: ${TABLE}."default_delivery_carrier_id" ;;
  }
  dimension: district_id {
    type: number
    sql: ${TABLE}."district_id" ;;
  }
  dimension: enable_delivery {
    type: yesno
    sql: ${TABLE}."enable_delivery" ;;
  }
  dimension: express_fee {
    type: number
    sql: ${TABLE}."express_fee" ;;
  }
  dimension: express_free_orders {
    type: number
    sql: ${TABLE}."express_free_orders" ;;
  }
  dimension: is_aisle_map_enabled {
    type: yesno
    sql: ${TABLE}."is_aisle_map_enabled" ;;
  }
  dimension: is_cartonization_enabled {
    type: yesno
    sql: ${TABLE}."is_cartonization_enabled" ;;
  }
  dimension: is_fulfilment_center {
    type: yesno
    sql: ${TABLE}."is_fulfilment_center" ;;
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}."latitude" ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}."longitude" ;;
  }
  dimension: min_item_total_for_free_delivery {
    type: number
    sql: ${TABLE}."min_item_total_for_free_delivery" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: parent_id {
    type: number
    sql: ${TABLE}."parent_id" ;;
  }
  dimension: payment_options {
    type: string
    sql: ${TABLE}."payment_options" ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}."phone" ;;
  }
  dimension: printer_id {
    type: number
    sql: ${TABLE}."printer_id" ;;
  }
  dimension: referrer_amount {
    type: number
    sql: ${TABLE}."referrer_amount" ;;
  }
  dimension: state_id {
    type: number
    sql: ${TABLE}."state_id" ;;
  }
  dimension: store_manager_email {
    type: string
    sql: ${TABLE}."store_manager_email" ;;
  }
  dimension: supermarket_type {
    type: string
    sql: ${TABLE}."supermarket_type" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  dimension: time_slots_schedule_time_offset_override {
    type: number
    sql: ${TABLE}."time_slots_schedule_time_offset_override" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }
  dimension: zone_id {
    type: number
    sql: ${TABLE}."zone_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, danube_supermarket_translations.count]
  }
}
