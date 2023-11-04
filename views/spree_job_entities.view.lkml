view: spree_job_entities {
  sql_table_name: public.spree_job_entities ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: class_name {
    type: string
    sql: ${TABLE}."class_name" ;;
  }
  dimension_group: completed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."completed_at" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: input {
    type: string
    sql: ${TABLE}."input" ;;
  }
  dimension: output {
    type: string
    sql: ${TABLE}."output" ;;
  }
  dimension_group: started {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."started_at" ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }
  dimension: status_message {
    type: string
    sql: ${TABLE}."status_message" ;;
  }
  dimension: tenant_id {
    type: number
    sql: ${TABLE}."tenant_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, class_name]
  }
}
