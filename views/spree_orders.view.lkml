view: spree_orders {
  derived_table: {
    sql: select * from public.spree_orders
      where supermarket_id in ( select d.id from public.danube_supermarkets d where d.supermarket_type in ( 'regular_and_express', 'express'));;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: adjustment_total {
    type: number
    sql: ${TABLE}."adjustment_total" ;;
  }
  dimension_group: approved {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."approved_at" ;;
  }
  dimension: approver_id {
    type: number
    sql: ${TABLE}."approver_id" ;;
  }
  dimension: approver_name {
    type: string
    sql: ${TABLE}."approver_name" ;;
  }
  dimension: auto_approved {
    type: yesno
    sql: ${TABLE}."auto_approved" ;;
  }
  dimension: bill_address_id {
    type: number
    sql: ${TABLE}."bill_address_id" ;;
  }
  dimension_group: canceled {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."canceled_at" ;;
  }
  dimension: canceler_id {
    type: number
    sql: ${TABLE}."canceler_id" ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}."channel" ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."completed_at" ;;
  }
  dimension: confirmation_delivered {
    type: yesno
    sql: ${TABLE}."confirmation_delivered" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: created_by_id {
    type: number
    sql: ${TABLE}."created_by_id" ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }
  dimension: delivery_method {
    type: string
    sql: ${TABLE}."delivery_method" ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }
  dimension: frontend_viewable {
    type: yesno
    sql: ${TABLE}."frontend_viewable" ;;
  }
  dimension: guest_token {
    type: string
    sql: ${TABLE}."guest_token" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: is_cartonization_enabled {
    type: yesno
    sql: ${TABLE}."is_cartonization_enabled" ;;
  }
  dimension: is_subscription {
    type: yesno
    sql: ${TABLE}."is_subscription" ;;
  }
  dimension: item_count {
    type: number
    sql: ${TABLE}."item_count" ;;
  }
  dimension: item_total {
    type: number
    sql: ${TABLE}."item_total" ;;
  }
  dimension: last_ip_address {
    type: string
    sql: ${TABLE}."last_ip_address" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: magerecord_order_entity_id {
    type: number
    sql: ${TABLE}."magerecord_order_entity_id" ;;
  }
  dimension: meta {
    type: string
    sql: ${TABLE}."meta" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: offline_invoice_number {
    type: string
    sql: ${TABLE}."offline_invoice_number" ;;
  }
  dimension: order_type {
    type: string
    sql: ${TABLE}."order_type" ;;
  }
  dimension: parent_id {
    type: number
    sql: ${TABLE}."parent_id" ;;
  }
  dimension: payment_amount_received {
    type: number
    sql: ${TABLE}."payment_amount_received" ;;
  }
  dimension: payment_state {
    type: string
    sql: ${TABLE}."payment_state" ;;
  }
  dimension: payment_total {
    type: number
    sql: ${TABLE}."payment_total" ;;
  }
  dimension: promo_total {
    type: number
    sql: ${TABLE}."promo_total" ;;
  }
  dimension: replace_product {
    type: yesno
    sql: ${TABLE}."replace_product" ;;
  }
  dimension: rescheduled {
    type: yesno
    sql: ${TABLE}."rescheduled" ;;
  }
  dimension: ship_address_id {
    type: number
    sql: ${TABLE}."ship_address_id" ;;
  }
  dimension: shipment_state {
    type: string
    sql: ${TABLE}."shipment_state" ;;
  }
  dimension: shipment_total {
    type: number
    sql: ${TABLE}."shipment_total" ;;
  }
  dimension: special_instructions {
    type: string
    sql: ${TABLE}."special_instructions" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}."total" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  dimension: vat_percentage {
    type: number
    sql: ${TABLE}."vat_percentage" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, approver_name]
  }
}
