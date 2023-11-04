view: spree_authentication_methods {
  sql_table_name: public.spree_authentication_methods ;;
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
  dimension: api_key {
    type: string
    sql: ${TABLE}."api_key" ;;
  }
  dimension: api_secret {
    type: string
    sql: ${TABLE}."api_secret" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension: environment {
    type: string
    sql: ${TABLE}."environment" ;;
  }
  dimension: provider {
    type: string
    sql: ${TABLE}."provider" ;;
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
