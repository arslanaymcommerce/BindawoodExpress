view: spree_drift_tickets {
  sql_table_name: public.spree_drift_tickets ;;
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
  dimension: details {
    type: string
    sql: ${TABLE}."details" ;;
  }
  dimension: resolved {
    type: yesno
    sql: ${TABLE}."resolved" ;;
  }
  dimension: ticketable_id {
    type: number
    sql: ${TABLE}."ticketable_id" ;;
  }
  dimension: ticketable_type {
    type: string
    sql: ${TABLE}."ticketable_type" ;;
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
