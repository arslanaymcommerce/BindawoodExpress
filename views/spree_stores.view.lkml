view: spree_stores {
  sql_table_name: public.spree_stores ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: app_version_info {
    type: string
    sql: ${TABLE}."app_version_info" ;;
  }
  dimension: cart_tax_country_iso {
    type: string
    sql: ${TABLE}."cart_tax_country_iso" ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}."code" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
  }
  dimension: default_currency {
    type: string
    sql: ${TABLE}."default_currency" ;;
  }
  dimension: gift_card_settings {
    type: string
    sql: ${TABLE}."gift_card_settings" ;;
  }
  dimension: loyalty_settings {
    type: string
    sql: ${TABLE}."loyalty_settings" ;;
  }
  dimension: mail_from_address {
    type: string
    sql: ${TABLE}."mail_from_address" ;;
  }
  dimension: meta_description {
    type: string
    sql: ${TABLE}."meta_description" ;;
  }
  dimension: meta_keywords {
    type: string
    sql: ${TABLE}."meta_keywords" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: preferences {
    type: string
    sql: ${TABLE}."preferences" ;;
  }
  dimension: seo_title {
    type: string
    sql: ${TABLE}."seo_title" ;;
  }
  dimension: subscription_plan_settings {
    type: string
    sql: ${TABLE}."subscription_plan_settings" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: url {
    type: string
    sql: ${TABLE}."url" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_store_translations.count]
  }
}
