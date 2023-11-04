view: spree_fulfilment_fulfillers {
  sql_table_name: public.spree_fulfilment_fulfillers ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: admin {
    type: yesno
    sql: ${TABLE}."admin" ;;
  }
  dimension: authentication_token {
    type: string
    sql: ${TABLE}."authentication_token" ;;
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
  dimension: email {
    type: string
    sql: ${TABLE}."email" ;;
  }
  dimension: encrypted_password {
    type: string
    sql: ${TABLE}."encrypted_password" ;;
  }
  dimension: is_tester {
    type: yesno
    sql: ${TABLE}."is_tester" ;;
  }
  dimension: locale {
    type: string
    sql: ${TABLE}."locale" ;;
  }
  dimension_group: locked {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."locked_at" ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
  }
  dimension_group: reset_password_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."reset_password_sent_at" ;;
  }
  dimension: reset_password_token {
    type: string
    sql: ${TABLE}."reset_password_token" ;;
  }
  dimension: role_type {
    type: string
    sql: ${TABLE}."role_type" ;;
  }
  dimension: supermarket_id {
    type: number
    sql: ${TABLE}."supermarket_id" ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."updated_at" ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }
  measure: count {
    type: count
    drill_fields: [id, username, name]
  }
}
