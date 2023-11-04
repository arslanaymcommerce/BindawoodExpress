view: spree_custom_products {
  sql_table_name: public.spree_custom_products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: barcodes {
    type: string
    sql: ${TABLE}."barcodes" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
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
  dimension: height {
    type: number
    sql: ${TABLE}."height" ;;
  }
  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }
  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}."sku" ;;
  }
  dimension: to_be_cased {
    type: yesno
    sql: ${TABLE}."to_be_cased" ;;
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
  dimension: width {
    type: number
    sql: ${TABLE}."width" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
