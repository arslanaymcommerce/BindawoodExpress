view: spree_product_property_translations {
  sql_table_name: public.spree_product_property_translations ;;
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
  dimension: spree_product_property_id {
    type: number
    sql: ${TABLE}."spree_product_property_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}."value" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
