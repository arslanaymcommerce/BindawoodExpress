view: danube_supermarket_containers {
  sql_table_name: public.danube_supermarket_containers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: barcode {
    type: string
    sql: ${TABLE}."barcode" ;;
  }
  dimension: name_ar {
    type: string
    sql: ${TABLE}."name_ar" ;;
  }
  dimension: name_en {
    type: string
    sql: ${TABLE}."name_en" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
