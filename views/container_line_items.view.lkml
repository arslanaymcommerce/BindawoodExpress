view: container_line_items {
  sql_table_name: public.container_line_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: container_id {
    type: number
    sql: ${TABLE}."container_id" ;;
  }
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
