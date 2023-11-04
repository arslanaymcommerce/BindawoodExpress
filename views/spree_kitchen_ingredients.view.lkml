view: spree_kitchen_ingredients {
  sql_table_name: public.spree_kitchen_ingredients ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: cut_pattern_id {
    type: number
    sql: ${TABLE}."cut_pattern_id" ;;
  }

  dimension: kitchen_recipe_id {
    type: number
    sql: ${TABLE}."kitchen_recipe_id" ;;
  }

  dimension: measurement {
    type: number
    sql: ${TABLE}."measurement" ;;
  }

  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }

  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}."quantity" ;;
  }

  dimension: recommended_product_id {
    type: number
    sql: ${TABLE}."recommended_product_id" ;;
  }

  dimension: taxon_id {
    type: number
    sql: ${TABLE}."taxon_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated_at" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
