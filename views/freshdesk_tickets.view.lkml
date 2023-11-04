view: freshdesk_tickets {
  sql_table_name: public.freshdesk_tickets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: cf_branch {
    type: string
    sql: ${TABLE}."cf_branch" ;;
  }
  dimension: cf_complaint_category {
    type: string
    sql: ${TABLE}."cf_complaint_category" ;;
  }
  dimension: cf_department {
    type: string
    sql: ${TABLE}."cf_department" ;;
  }
  dimension: cf_description {
    type: string
    sql: ${TABLE}."cf_description" ;;
  }
  dimension: cf_offline_complaint {
    type: string
    sql: ${TABLE}."cf_offline_complaint" ;;
  }
  dimension: cf_order_number {
    type: string
    sql: ${TABLE}."cf_order_number" ;;
  }
  dimension: cf_product_name {
    type: string
    sql: ${TABLE}."cf_product_name" ;;
  }
  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: deleted {
    type: yesno
    sql: ${TABLE}."deleted" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: description_text {
    type: string
    sql: ${TABLE}."description_text" ;;
  }
  dimension_group: due_by {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."due_by" ;;
  }
  dimension_group: fd_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."fd_created_at" ;;
  }
  dimension_group: fd_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."fd_updated_at" ;;
  }
  dimension: fr_escalated {
    type: yesno
    sql: ${TABLE}."fr_escalated" ;;
  }
  dimension: group_id {
    type: number
    sql: ${TABLE}."group_id" ;;
  }
  dimension: is_escalated {
    type: yesno
    sql: ${TABLE}."is_escalated" ;;
  }
  dimension: priority {
    type: number
    sql: ${TABLE}."priority" ;;
  }
  dimension: requester_id {
    type: number
    sql: ${TABLE}."requester_id" ;;
  }
  dimension: responder_id {
    type: number
    sql: ${TABLE}."responder_id" ;;
  }
  dimension: source {
    type: number
    sql: ${TABLE}."source" ;;
  }
  dimension: spam {
    type: yesno
    sql: ${TABLE}."spam" ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }
  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
  }
  dimension: ticket_id {
    type: number
    sql: ${TABLE}."ticket_id" ;;
  }
  dimension: ticket_type {
    type: string
    sql: ${TABLE}."ticket_type" ;;
  }
  dimension_group: updated_at {
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
    drill_fields: [id, cf_product_name]
  }
}
