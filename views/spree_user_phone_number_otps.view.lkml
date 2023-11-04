view: spree_user_phone_number_otps {
  sql_table_name: public.spree_user_phone_number_otps ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension: attempts {
    type: number
    sql: ${TABLE}."attempts" ;;
  }
  dimension: code {
    type: number
    sql: ${TABLE}."code" ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }
  dimension_group: expires {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."expires_at" ;;
  }
  dimension: is_used {
    type: yesno
    sql: ${TABLE}."is_used" ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}."phone_number" ;;
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
  dimension_group: verified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."verified_at" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
