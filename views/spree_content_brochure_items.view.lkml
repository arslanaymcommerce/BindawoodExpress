view: spree_content_brochure_items {
  sql_table_name: public.spree_content_brochure_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: android_deeplink {
    type: string
    sql: ${TABLE}."android_deeplink" ;;
  }
  dimension: brochure_id {
    type: number
    sql: ${TABLE}."brochure_id" ;;
  }
  dimension: ios_deeplink {
    type: string
    sql: ${TABLE}."ios_deeplink" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
