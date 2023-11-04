view: spree_return_items {
  sql_table_name: public.spree_return_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: acceptance_status {
    type: string
    sql: ${TABLE}."acceptance_status" ;;
  }
  dimension: acceptance_status_errors {
    type: string
    sql: ${TABLE}."acceptance_status_errors" ;;
  }
  dimension: additional_tax_total {
    type: number
    sql: ${TABLE}."additional_tax_total" ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: customer_return_id {
    type: number
    sql: ${TABLE}."customer_return_id" ;;
  }
  dimension: exchange_inventory_unit_id {
    type: number
    sql: ${TABLE}."exchange_inventory_unit_id" ;;
  }
  dimension: exchange_variant_id {
    type: number
    sql: ${TABLE}."exchange_variant_id" ;;
  }
  dimension: included_tax_total {
    type: number
    sql: ${TABLE}."included_tax_total" ;;
  }
  dimension: inventory_unit_id {
    type: number
    sql: ${TABLE}."inventory_unit_id" ;;
  }
  dimension: override_reimbursement_type_id {
    type: number
    sql: ${TABLE}."override_reimbursement_type_id" ;;
  }
  dimension: preferred_reimbursement_type_id {
    type: number
    sql: ${TABLE}."preferred_reimbursement_type_id" ;;
  }
  dimension: reception_status {
    type: string
    sql: ${TABLE}."reception_status" ;;
  }
  dimension: reimbursement_id {
    type: number
    sql: ${TABLE}."reimbursement_id" ;;
  }
  dimension: resellable {
    type: yesno
    sql: ${TABLE}."resellable" ;;
  }
  dimension: return_authorization_id {
    type: number
    sql: ${TABLE}."return_authorization_id" ;;
  }
  dimension: return_reason_id {
    type: number
    sql: ${TABLE}."return_reason_id" ;;
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
