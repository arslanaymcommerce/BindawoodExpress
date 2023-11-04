view: geography_columns {
  sql_table_name: public.geography_columns ;;

  dimension: coord_dimension {
    type: number
    sql: ${TABLE}."coord_dimension" ;;
  }
  dimension: f_geography_column {
    type: string
    sql: ${TABLE}."f_geography_column" ;;
  }
  dimension: f_table_catalog {
    type: string
    sql: ${TABLE}."f_table_catalog" ;;
  }
  dimension: f_table_name {
    type: string
    sql: ${TABLE}."f_table_name" ;;
  }
  dimension: f_table_schema {
    type: string
    sql: ${TABLE}."f_table_schema" ;;
  }
  dimension: srid {
    type: number
    value_format_name: id
    sql: ${TABLE}."srid" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  measure: count {
    type: count
    drill_fields: [f_table_name]
  }
}
