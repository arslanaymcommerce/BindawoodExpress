view: spree_search_recommendations {
  sql_table_name: public.spree_search_recommendations ;;
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
  dimension: deeplink_android {
    type: string
    sql: ${TABLE}."deeplink_android" ;;
  }
  dimension: deeplink_ios {
    type: string
    sql: ${TABLE}."deeplink_ios" ;;
  }
  dimension: enabled {
    type: yesno
    sql: ${TABLE}."enabled" ;;
  }
  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }
  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
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
