view: spree_promotion_audit_logs {
  sql_table_name: public.spree_promotion_audit_logs ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: comments {
    type: string
    sql: ${TABLE}."comments" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: date_of_action {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."date_of_action" ;;
  }
  dimension: event {
    type: string
    sql: ${TABLE}."event" ;;
  }
  dimension: item_id {
    type: number
    sql: ${TABLE}."item_id" ;;
  }
  dimension: item_type {
    type: string
    sql: ${TABLE}."item_type" ;;
  }
  dimension: object {
    type: string
    sql: ${TABLE}."object" ;;
  }
  dimension: object_changes {
    type: string
    sql: ${TABLE}."object_changes" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: whodunnit {
    type: string
    sql: ${TABLE}."whodunnit" ;;
  }
  dimension: whodunnit_type {
    type: string
    sql: ${TABLE}."whodunnit_type" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
