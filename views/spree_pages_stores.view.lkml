view: spree_pages_stores {
  sql_table_name: public.spree_pages_stores ;;

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: page_id {
    type: number
    sql: ${TABLE}."page_id" ;;
  }
  dimension: store_id {
    type: number
    sql: ${TABLE}."store_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
  }
}
