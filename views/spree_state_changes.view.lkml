view: spree_state_changes {
  sql_table_name: public.spree_state_changes ;;
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
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: next_state {
    type: string
    sql: ${TABLE}."next_state" ;;
  }
  dimension: previous_state {
    type: string
    sql: ${TABLE}."previous_state" ;;
  }
  dimension: stateful_id {
    type: number
    sql: ${TABLE}."stateful_id" ;;
  }
  dimension: stateful_type {
    type: string
    sql: ${TABLE}."stateful_type" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
