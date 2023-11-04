view: pg_stat_statements_info {
  sql_table_name: public.pg_stat_statements_info ;;

  dimension: dealloc {
    type: number
    sql: ${TABLE}."dealloc" ;;
  }
  dimension_group: stats_reset {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."stats_reset" ;;
  }
  measure: count {
    type: count
  }
}
