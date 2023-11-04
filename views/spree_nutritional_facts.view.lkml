view: spree_nutritional_facts {
  sql_table_name: public.spree_nutritional_facts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: comments_ar {
    type: string
    sql: ${TABLE}."comments_ar" ;;
  }
  dimension: comments_en {
    type: string
    sql: ${TABLE}."comments_en" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: nutrients {
    type: string
    sql: ${TABLE}."nutrients" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }
  dimension: quantity_ar {
    type: string
    sql: ${TABLE}."quantity_ar" ;;
  }
  dimension: quantity_en {
    type: string
    sql: ${TABLE}."quantity_en" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
