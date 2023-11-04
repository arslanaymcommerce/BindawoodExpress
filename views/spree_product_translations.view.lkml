view: spree_product_translations {
  sql_table_name: public.spree_product_translations ;;
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
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: full_name {
    type: string
    sql: ${TABLE}."full_name" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension: manufacturer {
    type: string
    sql: ${TABLE}."manufacturer" ;;
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
  dimension: pack_size {
    type: string
    sql: ${TABLE}."pack_size" ;;
  }
  dimension: pack_unit {
    type: string
    sql: ${TABLE}."pack_unit" ;;
  }
  dimension: package_description {
    type: string
    sql: ${TABLE}."package_description" ;;
  }
  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
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
  dimension: validity_tag {
    type: string
    sql: ${TABLE}."validity_tag" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, full_name, name, spree_products.name, spree_products.id]
  }
}
