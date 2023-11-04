view: spree_store_translations {
  sql_table_name: public.spree_store_translations ;;
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
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
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
  dimension: seo_title {
    type: string
    sql: ${TABLE}."seo_title" ;;
  }
  dimension: spree_store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."spree_store_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_stores.id, spree_stores.name]
  }
}
