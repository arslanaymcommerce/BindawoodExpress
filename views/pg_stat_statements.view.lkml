view: pg_stat_statements {
  sql_table_name: public.pg_stat_statements ;;

  dimension: blk_read_time {
    type: number
    sql: ${TABLE}."blk_read_time" ;;
  }
  dimension: blk_write_time {
    type: number
    sql: ${TABLE}."blk_write_time" ;;
  }
  dimension: calls {
    type: number
    sql: ${TABLE}."calls" ;;
  }
  dimension: dbid {
    type: string
    sql: ${TABLE}."dbid" ;;
  }
  dimension: local_blks_dirtied {
    type: number
    sql: ${TABLE}."local_blks_dirtied" ;;
  }
  dimension: local_blks_hit {
    type: number
    sql: ${TABLE}."local_blks_hit" ;;
  }
  dimension: local_blks_read {
    type: number
    sql: ${TABLE}."local_blks_read" ;;
  }
  dimension: local_blks_written {
    type: number
    sql: ${TABLE}."local_blks_written" ;;
  }
  dimension: max_exec_time {
    type: number
    sql: ${TABLE}."max_exec_time" ;;
  }
  dimension: max_plan_time {
    type: number
    sql: ${TABLE}."max_plan_time" ;;
  }
  dimension: mean_exec_time {
    type: number
    sql: ${TABLE}."mean_exec_time" ;;
  }
  dimension: mean_plan_time {
    type: number
    sql: ${TABLE}."mean_plan_time" ;;
  }
  dimension: min_exec_time {
    type: number
    sql: ${TABLE}."min_exec_time" ;;
  }
  dimension: min_plan_time {
    type: number
    sql: ${TABLE}."min_plan_time" ;;
  }
  dimension: plans {
    type: number
    sql: ${TABLE}."plans" ;;
  }
  dimension: query {
    type: string
    sql: ${TABLE}."query" ;;
  }
  dimension: queryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."queryid" ;;
  }
  dimension: rows {
    type: number
    sql: ${TABLE}."rows" ;;
  }
  dimension: shared_blks_dirtied {
    type: number
    sql: ${TABLE}."shared_blks_dirtied" ;;
  }
  dimension: shared_blks_hit {
    type: number
    sql: ${TABLE}."shared_blks_hit" ;;
  }
  dimension: shared_blks_read {
    type: number
    sql: ${TABLE}."shared_blks_read" ;;
  }
  dimension: shared_blks_written {
    type: number
    sql: ${TABLE}."shared_blks_written" ;;
  }
  dimension: stddev_exec_time {
    type: number
    sql: ${TABLE}."stddev_exec_time" ;;
  }
  dimension: stddev_plan_time {
    type: number
    sql: ${TABLE}."stddev_plan_time" ;;
  }
  dimension: temp_blks_read {
    type: number
    sql: ${TABLE}."temp_blks_read" ;;
  }
  dimension: temp_blks_written {
    type: number
    sql: ${TABLE}."temp_blks_written" ;;
  }
  dimension: toplevel {
    type: yesno
    sql: ${TABLE}."toplevel" ;;
  }
  dimension: total_exec_time {
    type: number
    sql: ${TABLE}."total_exec_time" ;;
  }
  dimension: total_plan_time {
    type: number
    sql: ${TABLE}."total_plan_time" ;;
  }
  dimension: userid {
    type: string
    sql: ${TABLE}."userid" ;;
  }
  dimension: wal_bytes {
    type: number
    sql: ${TABLE}."wal_bytes" ;;
  }
  dimension: wal_fpi {
    type: number
    sql: ${TABLE}."wal_fpi" ;;
  }
  dimension: wal_records {
    type: number
    sql: ${TABLE}."wal_records" ;;
  }
  measure: count {
    type: count
  }
}
