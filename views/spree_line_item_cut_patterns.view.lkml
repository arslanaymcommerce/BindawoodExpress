view: spree_line_item_cut_patterns {
  sql_table_name: public.spree_line_item_cut_patterns ;;
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
  dimension: cut_pattern_id {
    type: number
    sql: ${TABLE}."cut_pattern_id" ;;
  }
  dimension: line_item_id {
    type: number
    sql: ${TABLE}."line_item_id" ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}."quantity" ;;
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
