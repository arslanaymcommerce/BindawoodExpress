view: spree_variants {
  sql_table_name: public.spree_variants ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: cost_currency {
    type: string
    sql: ${TABLE}."cost_currency" ;;
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
  dimension: default_weight_count {
    type: number
    sql: ${TABLE}."default_weight_count" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: depth {
    type: number
    sql: ${TABLE}."depth" ;;
  }
  dimension: excluded_from_vat {
    type: yesno
    sql: ${TABLE}."excluded_from_vat" ;;
  }
  dimension: height {
    type: number
    sql: ${TABLE}."height" ;;
  }
  dimension: is_master {
    type: yesno
    sql: ${TABLE}."is_master" ;;
  }
  dimension: max_weight_per_order {
    type: number
    sql: ${TABLE}."max_weight_per_order" ;;
  }
  dimension: perform_liquid_weight_check {
    type: yesno
    sql: ${TABLE}."perform_liquid_weight_check" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}."sku" ;;
  }
  dimension: tax_category_id {
    type: number
    sql: ${TABLE}."tax_category_id" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  dimension: to_be_cased {
    type: yesno
    sql: ${TABLE}."to_be_cased" ;;
  }
  dimension: track_inventory {
    type: yesno
    sql: ${TABLE}."track_inventory" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}."weight" ;;
  }
  dimension: weight_increment {
    type: number
    sql: ${TABLE}."weight_increment" ;;
  }
  dimension: width {
    type: number
    sql: ${TABLE}."width" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
