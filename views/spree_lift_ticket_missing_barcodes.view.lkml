view: spree_lift_ticket_missing_barcodes {
  sql_table_name: public.spree_lift_ticket_missing_barcodes ;;
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
  dimension: customer_reported {
    type: yesno
    sql: ${TABLE}."customer_reported" ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }
  dimension: reported_count {
    type: number
    sql: ${TABLE}."reported_count" ;;
  }
  dimension: resolved {
    type: yesno
    sql: ${TABLE}."resolved" ;;
  }
  dimension: scanned_barcode {
    type: string
    sql: ${TABLE}."scanned_barcode" ;;
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
