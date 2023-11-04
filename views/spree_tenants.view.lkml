view: spree_tenants {
  sql_table_name: public.spree_tenants ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: active {
    type: yesno
    sql: ${TABLE}."active" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: is_default {
    type: yesno
    sql: ${TABLE}."is_default" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: support_email {
    type: string
    sql: ${TABLE}."support_email" ;;
  }
  dimension: support_number {
    type: string
    sql: ${TABLE}."support_number" ;;
  }
  dimension: tenant_key {
    type: string
    sql: ${TABLE}."tenant_key" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: whatsapp_support_number {
    type: string
    sql: ${TABLE}."whatsapp_support_number" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
