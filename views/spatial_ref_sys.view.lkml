view: spatial_ref_sys {
  sql_table_name: public.spatial_ref_sys ;;

  dimension: auth_name {
    type: string
    sql: ${TABLE}."auth_name" ;;
  }
  dimension: auth_srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."auth_srid" ;;
  }
  dimension: proj4text {
    type: string
    sql: ${TABLE}."proj4text" ;;
  }
  dimension: srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."srid" ;;
  }
  dimension: srtext {
    type: string
    sql: ${TABLE}."srtext" ;;
  }
  measure: count {
    type: count
    drill_fields: [auth_name]
  }
}
