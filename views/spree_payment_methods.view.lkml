view: spree_payment_methods {
  sql_table_name: public.spree_payment_methods ;;
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
  dimension: auto_capture {
    type: yesno
    sql: ${TABLE}."auto_capture" ;;
  }
  dimension: available_to_admin {
    type: yesno
    sql: ${TABLE}."available_to_admin" ;;
  }
  dimension: available_to_users {
    type: yesno
    sql: ${TABLE}."available_to_users" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."deleted_at" ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }
  dimension: preference_source {
    type: string
    sql: ${TABLE}."preference_source" ;;
  }
  dimension: preferences {
    type: string
    sql: ${TABLE}."preferences" ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, spree_payment_method_translations.count]
  }
}
