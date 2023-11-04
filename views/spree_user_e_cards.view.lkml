view: spree_user_e_cards {
  sql_table_name: public.spree_user_e_cards ;;
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
  dimension: batch_id {
    type: string
    sql: ${TABLE}."batch_id" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: custom_id {
    type: string
    sql: ${TABLE}."custom_id" ;;
  }
  dimension_group: expiry {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expiry_date" ;;
  }
  dimension: image_url {
    type: string
    sql: ${TABLE}."image_url" ;;
  }
  dimension: key {
    type: string
    sql: ${TABLE}."key" ;;
  }
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}."number" ;;
  }
  dimension: one_card_secret {
    type: string
    sql: ${TABLE}."one_card_secret" ;;
  }
  dimension: one_card_trx_ref_number {
    type: string
    sql: ${TABLE}."one_card_trx_ref_number" ;;
  }
  dimension: style_image {
    type: string
    sql: ${TABLE}."style_image" ;;
  }
  dimension: trx_ref_number {
    type: string
    sql: ${TABLE}."trx_ref_number" ;;
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
  measure: count {
    type: count
    drill_fields: [id]
  }
}
