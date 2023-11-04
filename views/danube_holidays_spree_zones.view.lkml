view: danube_holidays_spree_zones {
  sql_table_name: public.danube_holidays_spree_zones ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: holiday_id {
    type: number
    sql: ${TABLE}."holiday_id" ;;
  }
  dimension: zone_id {
    type: number
    sql: ${TABLE}."zone_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
